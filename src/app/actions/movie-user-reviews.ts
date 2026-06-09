"use server";

import { revalidatePath } from "next/cache";
import {
	isLikelyHtmlOrTransportBody,
	logSupabaseTransportFailure,
	sanitizeSupabaseErrorMessage,
} from "@/lib/supabase/errors";
import { createSupabaseServerOptional } from "@/lib/supabase/server";
import type {
	MovieUserReviewAggregate,
	MovieUserReviewRow,
} from "@/types/movie-user-review";

export async function listMovieUserReviews(
	movieId: string,
): Promise<MovieUserReviewRow[]> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) return [];

	const { data, error } = await supabase
		.from("movie_user_reviews")
		.select(
			"id, movie_id, user_id, stars, comment, author_display_name, created_at, updated_at",
		)
		.eq("movie_id", movieId)
		.order("created_at", { ascending: false });

	if (error) {
		const raw = String(error.message ?? "");
		if (isLikelyHtmlOrTransportBody(raw)) {
			logSupabaseTransportFailure("listMovieUserReviews");
			return [];
		}
		throw new Error(sanitizeSupabaseErrorMessage(error));
	}

	return (data ?? []) as MovieUserReviewRow[];
}

export async function getMovieUserReviewAggregate(
	movieId: string,
): Promise<MovieUserReviewAggregate> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) return { avgStars: null, ratingCount: 0 };

	const { data, error } = await supabase
		.from("movie_user_reviews")
		.select("stars")
		.eq("movie_id", movieId);

	if (error) {
		const raw = String(error.message ?? "");
		if (isLikelyHtmlOrTransportBody(raw)) {
			logSupabaseTransportFailure("getMovieUserReviewAggregate");
			return { avgStars: null, ratingCount: 0 };
		}
		throw new Error(sanitizeSupabaseErrorMessage(error));
	}

	const withStars = (data ?? []).filter(
		(r: { stars: number | null }) => r.stars != null && Number.isFinite(r.stars),
	) as { stars: number }[];
	if (withStars.length === 0) {
		return { avgStars: null, ratingCount: 0 };
	}
	const sum = withStars.reduce((acc, r) => acc + r.stars, 0);
	const avgStars = Math.round((sum / withStars.length) * 10) / 10;
	return { avgStars, ratingCount: withStars.length };
}

export async function upsertMovieUserReview(
	movieId: string,
	input: { stars: number | null; comment: string },
): Promise<void> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) throw new Error("Database is not configured.");

	const {
		data: { user },
	} = await supabase.auth.getUser();
	if (!user) throw new Error("Sign in to leave a rating or comment.");

	const comment = input.comment.trim();
	const stars =
		input.stars != null &&
		Number.isFinite(input.stars) &&
		input.stars >= 1 &&
		input.stars <= 5
			? Math.round(input.stars)
			: null;

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

	const { error } = await supabase.from("movie_user_reviews").upsert(
		{
			movie_id: movieId,
			user_id: user.id,
			stars,
			comment,
			author_display_name: author,
		},
		{ onConflict: "movie_id,user_id" },
	);

	if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

	revalidatePath(`/movies/${movieId}`);
}

export async function deleteMovieUserReview(
	reviewId: string,
	movieId: string,
): Promise<void> {
	const supabase = await createSupabaseServerOptional();
	if (!supabase) throw new Error("Database is not configured.");

	const {
		data: { user },
	} = await supabase.auth.getUser();
	if (!user) throw new Error("Sign in to remove a review.");

	const { error } = await supabase
		.from("movie_user_reviews")
		.delete()
		.eq("id", reviewId);

	if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

	revalidatePath(`/movies/${movieId}`);
}
