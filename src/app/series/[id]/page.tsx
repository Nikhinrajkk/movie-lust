import { notFound } from "next/navigation";
import {
	getSeriesUserReviewAggregate,
	listSeriesUserReviews,
} from "@/app/actions/series-user-reviews";
import { getSeriesById } from "@/app/actions/series";
import { DeleteSeriesForm } from "@/components/delete-series-form";
import {
	MovieDetailPosterLinkRows,
	MovieDetailThreeColumn,
} from "@/components/movie-detail-card";
import { NavLinkButton } from "@/components/nav-link-button";
import { SeriesDetailAdminActions } from "@/components/series-detail-admin-actions";
import { SeriesUserReviewsClient } from "@/components/movie-user-reviews";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";
import { seriesAsMovieRow } from "@/lib/series-as-movie-row";
import { createSupabaseServer } from "@/lib/supabase/server";
import type { SeriesRow } from "@/types/series";

function posterSrc(url: string | null) {
	if (url && url.trim().length > 0) return url;
	return "https://placehold.co/600x900/18181b/78716c?text=No+poster";
}

function publicFooterLine(
	series: SeriesRow,
	status: string,
	approverLabel: string | null,
) {
	if (status === "approved" && approverLabel) {
		return `Approved for catalogue · ${approverLabel}`;
	}
	return `Submitted ${new Date(series.created_at).toLocaleString(undefined, {
		dateStyle: "medium",
		timeStyle: "short",
	})}`;
}

export default async function SeriesDetailPage({
	params,
}: {
	params: Promise<{ id: string }>;
}) {
	const { id } = await params;
	const ready = isSupabaseConfigured();
	const { user, isAdmin } = await getSessionUserWithProfile();
	const series = ready ? await getSeriesById(id) : null;

	if (ready && !series) notFound();

	const owner = Boolean(user && series?.created_by === user.id);
	const status = series?.approval_status ?? "approved";
	const canEdit = isAdmin || (owner && status === "pending");
	const canDelete = isAdmin || (owner && status === "pending");
	const showModeration = status === "pending" || status === "rejected";

	let approverLabel: string | null = null;
	if (ready && series && status === "approved" && series.approved_by && isAdmin) {
		const supabase = await createSupabaseServer();
		const { data: approver } = await supabase
			.from("profiles")
			.select("display_name")
			.eq("id", series.approved_by)
			.maybeSingle();
		const dn = approver?.display_name?.trim();
		approverLabel = dn && dn.length > 0 ? dn : series.approved_by;
	}

	const p = series ? posterSrc(series.poster_url) : "";
	const movie = series ? seriesAsMovieRow(series) : null;

	const userReviews = ready && series ? await listSeriesUserReviews(series.id) : [];
	const userReviewAggregate =
		ready && series ? await getSeriesUserReviewAggregate(series.id) : undefined;
	const myUserReview = user
		? (userReviews.find((r) => r.user_id === user.id) ?? null)
		: null;
	const reviewsListKey = userReviews
		.map((r) => `${r.id}:${r.updated_at}`)
		.join("|");

	return (
		<div className="mx-auto max-w-7xl px-4 pb-16 pt-8 sm:px-6 lg:px-8">
			{!ready && <SetupCallout />}

			{ready && series && movie && (
				<>
					{showModeration && (
						<div
							className={`mb-8 rounded-2xl border px-4 py-3 text-sm ${
								status === "pending"
									? "mdc-moderation-pending"
									: "mdc-moderation-rejected"
							}`}
						>
							{status === "pending"
								? "This submission is waiting for an admin review. It is only visible to you and moderators until it is approved."
								: "This submission was rejected and is hidden from the public catalogue."}
						</div>
					)}

					<MovieDetailThreeColumn
						movie={movie}
						series={series}
						catalogueKind="series"
						posterSrc={p}
						posterSizes="(max-width: 1023px) 100vw, 320px"
						posterUnoptimized={p.includes("placehold.co")}
						userReviewAggregate={userReviewAggregate}
						shareTitle={series.title}
						bodyFooterLine={publicFooterLine(series, status, approverLabel)}
						reviewsSlot={
							<SeriesUserReviewsClient
								key={reviewsListKey}
								seriesId={series.id}
								reviews={userReviews}
								currentUserId={user?.id ?? null}
								isAdmin={isAdmin}
								initialStars={myUserReview?.stars ?? null}
								initialComment={myUserReview?.comment ?? ""}
							/>
						}
						posterFooter={
							<div className="flex flex-col gap-2.5">
								{isAdmin && (
									<SeriesDetailAdminActions
										seriesId={series.id}
										status={status as "pending" | "approved" | "rejected"}
									/>
								)}
								<MovieDetailPosterLinkRows
									movieId={series.id}
									catalogueKind="series"
									mode="public"
									showEdit={canEdit}
								/>
								{canDelete && (
									<div className="pt-1">
										<DeleteSeriesForm id={series.id} />
									</div>
								)}
							</div>
						}
					/>

					<div className="mt-10 border-t border-[var(--md-border)] pt-6">
						<NavLinkButton
							href="/series"
							variant="link"
							className="mdc-back-link inline-flex px-0 py-0"
						>
							← Back to all series
						</NavLinkButton>
					</div>
				</>
			)}
		</div>
	);
}
