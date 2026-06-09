import { notFound } from "next/navigation";
import { getMovieById } from "@/app/actions/movies";
import { getWatchedMovieIdsForUser } from "@/app/actions/watched";
import { getWatchlistMovieIdsForUser } from "@/app/actions/watchlist";
import { DeleteMovieForm } from "@/components/delete-movie-form";
import {
	MovieDetailPosterLinkRows,
	MovieDetailThreeColumn,
} from "@/components/movie-detail-card";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { WatchedToggle } from "@/components/watched-toggle";
import { WatchlistToggle } from "@/components/watchlist-toggle";
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

	return (
		<div className="mx-auto max-w-6xl px-0 py-0 sm:px-6 sm:py-10">
			{!ready && <SetupCallout />}

			{ready && movie && (
				<div className="overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-lg">
					<div className="p-4 sm:p-6 lg:p-8">
						{showModeration && (
							<div
								className={`mb-6 rounded-xl border px-4 py-3 text-sm ${
									status === "pending"
										? "border-amber-200 bg-amber-50 text-amber-900"
										: "border-red-200 bg-red-50 text-red-900"
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
							posterSizes="(max-width: 1023px) 100vw, 240px"
							posterUnoptimized={p.includes("placehold.co")}
							bodyFooterLine={publicFooterLine(movie, status, approverLabel)}
							posterFooter={
								<div className="flex flex-col gap-3">
									{watchlistToggleEnabled && (
										<div className="flex flex-wrap gap-2">
											<WatchlistToggle
												movieId={movie.id}
												initialInList={inWatchlist}
												size="md"
											/>
											<WatchedToggle
												movieId={movie.id}
												initialWatched={isWatched}
												size="md"
											/>
										</div>
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

						<div className="mt-8 border-t border-gray-100 pt-6">
							<NavLinkButton
								href="/"
								variant="link"
								className="inline-flex px-0 py-0 text-gray-600 hover:text-[var(--bms-red)]"
							>
								← Back to all movies
							</NavLinkButton>
						</div>
					</div>
				</div>
			)}
		</div>
	);
}
