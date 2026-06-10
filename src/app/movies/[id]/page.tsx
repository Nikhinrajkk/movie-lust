import { notFound } from "next/navigation";
import {
	getMovieUserReviewAggregate,
	listMovieUserReviews,
} from "@/app/actions/movie-user-reviews";
import { getMovieById } from "@/app/actions/movies";
import { getWatchedMovieIdsForUser } from "@/app/actions/watched";
import { getWatchlistMovieIdsForUser } from "@/app/actions/watchlist";
import { DeleteMovieForm } from "@/components/delete-movie-form";
import {
	MovieDetailPosterLinkRows,
	MovieDetailThreeColumn,
} from "@/components/movie-detail-card";
import {
	MovieDetailWatchedButton,
	MovieDetailWatchlistButton,
} from "@/components/movie-detail-watchlist-button";
import { MovieUserReviewsClient } from "@/components/movie-user-reviews";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";
import { createSupabaseServer } from "@/lib/supabase/server";

function posterSrc(url: string | null) {
	if (url && url.trim().length > 0) return url;
	return "https://placehold.co/600x900/18181b/78716c?text=No+poster";
}

function publicFooterLine(
	movie: NonNullable<Awaited<ReturnType<typeof getMovieById>>>,
	status: string,
	approverLabel: string | null,
) {
	if (status === "approved" && approverLabel) {
		return `Approved for catalogue · ${approverLabel}`;
	}
	return `Submitted ${new Date(movie.created_at).toLocaleString(undefined, {
		dateStyle: "medium",
		timeStyle: "short",
	})}`;
}

export default async function MovieDetailPage({
	params,
}: {
	params: Promise<{ id: string }>;
}) {
	const { id } = await params;
	const ready = isSupabaseConfigured();
	const { user, isAdmin } = await getSessionUserWithProfile();
	const movie = ready ? await getMovieById(id) : null;

	if (ready && !movie) notFound();

	const owner = Boolean(user && movie?.created_by === user.id);
	const status = movie?.approval_status ?? "approved";
	const canEdit = isAdmin || (owner && status === "pending");
	const canDelete = canEdit;
	const showModeration = status === "pending" || status === "rejected";

	const watchlistIds = ready && user ? await getWatchlistMovieIdsForUser() : [];
	const watchedIds = ready && user ? await getWatchedMovieIdsForUser() : [];
	const inWatchlist = movie ? watchlistIds.includes(movie.id) : false;
	const isWatched = movie ? watchedIds.includes(movie.id) : false;
	const watchlistToggleEnabled = Boolean(user) && status === "approved";

	let approverLabel: string | null = null;
	if (ready && movie && status === "approved" && movie.approved_by && isAdmin) {
		const supabase = await createSupabaseServer();
		const { data: approver } = await supabase
			.from("profiles")
			.select("display_name")
			.eq("id", movie.approved_by)
			.maybeSingle();
		const dn = approver?.display_name?.trim();
		approverLabel = dn && dn.length > 0 ? dn : movie.approved_by;
	}

	const p = movie ? posterSrc(movie.poster_url) : "";

	const userReviews = ready && movie ? await listMovieUserReviews(movie.id) : [];
	const userReviewAggregate =
		ready && movie ? await getMovieUserReviewAggregate(movie.id) : undefined;
	const myUserReview = user
		? (userReviews.find((r) => r.user_id === user.id) ?? null)
		: null;
	const reviewsListKey = userReviews
		.map((r) => `${r.id}:${r.updated_at}`)
		.join("|");

	return (
		<div className="mx-auto max-w-7xl px-4 pb-16 pt-8 sm:px-6 lg:px-8">
			{!ready && <SetupCallout />}

			{ready && movie && (
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
						posterSrc={p}
						posterSizes="(max-width: 1023px) 100vw, 320px"
						posterUnoptimized={p.includes("placehold.co")}
						userReviewAggregate={userReviewAggregate}
						shareTitle={movie.title}
						bodyFooterLine={publicFooterLine(movie, status, approverLabel)}
						reviewsSlot={
							<MovieUserReviewsClient
								key={reviewsListKey}
								movieId={movie.id}
								reviews={userReviews}
								currentUserId={user?.id ?? null}
								isAdmin={isAdmin}
								initialStars={myUserReview?.stars ?? null}
								initialComment={myUserReview?.comment ?? ""}
							/>
						}
						posterFooter={
							<div className="flex flex-col gap-2.5">
								{watchlistToggleEnabled && (
									<>
										<MovieDetailWatchlistButton
											movieId={movie.id}
											initialInList={inWatchlist}
										/>
										<MovieDetailWatchedButton
											movieId={movie.id}
											initialWatched={isWatched}
										/>
									</>
								)}
								<MovieDetailPosterLinkRows
									movieId={movie.id}
									mode="public"
									showEdit={canEdit}
								/>
								{canDelete && (
									<div className="pt-1">
										<DeleteMovieForm id={movie.id} />
									</div>
								)}
							</div>
						}
					/>

					<div className="mt-10 border-t border-[var(--md-border)] pt-6">
						<NavLinkButton
							href="/"
							variant="link"
							className="mdc-back-link inline-flex px-0 py-0"
						>
							← Back to all movies
						</NavLinkButton>
					</div>
				</>
			)}
		</div>
	);
}
