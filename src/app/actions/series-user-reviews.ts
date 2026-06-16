"use server";

import { revalidatePath } from "next/cache";
import type {
	SeriesUserReviewAggregate,
	SeriesUserReviewRow,
} from "@/types/series-user-review";
import {
	isLikelyHtmlOrTransportBody,
	logSupabaseTransportFailure,
	sanitizeSupabaseErrorMessage,
} from "@/lib/supabase/errors";
import { createSupabaseServerOptional } from "@/lib/supabase/server";
import { normalizeHalfStarRating } from "@/lib/user-star-rating";

export async function listSeriesUserReviews(
	seriesId: string,
): Promise<SeriesUserReviewRow[]> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) return [];

	const { data, error } = await supabase
		.from("series_user_reviews")
		.select(
			"id, series_id, user_id, stars, comment, author_display_name, created_at, updated_at",
		)
		.eq("series_id", seriesId)
		.order("created_at", { ascending: false });

	if (error) {
		const raw = String(error.message ?? "");
		if (isLikelyHtmlOrTransportBody(raw)) {
			logSupabaseTransportFailure("listSeriesUserReviews");
			return [];
		}
		throw new Error(sanitizeSupabaseErrorMessage(error));
	}

	return (data ?? []).map((row) => {
		const r = row as SeriesUserReviewRow;
		const s = r.stars as unknown;
		const num = s == null || s === "" ? null : Number(s);
		const stars = num != null && Number.isFinite(num) ? num : null;
		return { ...r, stars };
	});
}

export async function getSeriesUserReviewAggregate(
	seriesId: string,
): Promise<SeriesUserReviewAggregate> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) return { avgStars: null, ratingCount: 0 };

	const { data, error } = await supabase
		.from("series_user_reviews")
		.select("stars")
		.eq("series_id", seriesId);

	if (error) {
		const raw = String(error.message ?? "");
		if (isLikelyHtmlOrTransportBody(raw)) {
			logSupabaseTransportFailure("getSeriesUserReviewAggregate");
			return { avgStars: null, ratingCount: 0 };
		}
		throw new Error(sanitizeSupabaseErrorMessage(error));
	}

	const withStars = (data ?? [])
		.map((r: { stars: unknown }) =>
			r.stars == null ? null : Number(r.stars),
		)
		.filter((s): s is number => s != null && Number.isFinite(s));
	if (withStars.length === 0) {
		return { avgStars: null, ratingCount: 0 };
	}
	const sum = withStars.reduce((acc, r) => acc + r, 0);
	const avgStars = Math.round((sum / withStars.length) * 10) / 10;
	return { avgStars, ratingCount: withStars.length };
}

export async function upsertSeriesUserReview(
	seriesId: string,
	input: { stars: number | null; comment: string },
): Promise<void> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) throw new Error("Database is not configured.");

	const {
		data: { user },
	} = await supabase.auth.getUser();
	if (!user) throw new Error("Sign in to leave a rating or comment.");

	const comment = input.comment.trim().slice(0, 500);
	const stars = normalizeHalfStarRating(
		input.stars != null && Number.isFinite(input.stars)
			? Number(input.stars)
			: null,
	);

	if (stars == null && comment.length === 0) {
		throw new Error("Add a star rating and/or a comment.");
	}

	const { data: profile } = await supabase
		.from("profiles")
		.select("display_name")
		.eq("id", user.id)
		.maybeSingle();

	const author =
		profile?.display_name?.trim() && profile.display_name.trim().length > 0
			? profile.display_name.trim()
			: "Member";

	const { error } = await supabase.from("series_user_reviews").upsert(
		{
			series_id: seriesId,
			user_id: user.id,
			stars,
			comment,
			author_display_name: author,
		},
		{ onConflict: "series_id,user_id" },
	);

	if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

	revalidatePath(`/series/${seriesId}`);
}

export async function deleteSeriesUserReview(
	reviewId: string,
	seriesId: string,
): Promise<void> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) throw new Error("Database is not configured.");

	const {
		data: { user },
	} = await supabase.auth.getUser();
	if (!user) throw new Error("Sign in to remove a review.");

	const { error } = await supabase
		.from("series_user_reviews")
		.delete()
		.eq("id", reviewId);

	if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

	revalidatePath(`/series/${seriesId}`);
}
