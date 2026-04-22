import Image from "next/image";
import { notFound } from "next/navigation";
import { getMovieById } from "@/app/actions/movies";
import { getWatchlistMovieIdsForUser } from "@/app/actions/watchlist";
import { getWatchedMovieIdsForUser } from "@/app/actions/watched";
import { DeleteMovieForm } from "@/components/delete-movie-form";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { WatchlistToggle } from "@/components/watchlist-toggle";
import { WatchedToggle } from "@/components/watched-toggle";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

function posterSrc(url: string | null) {
  if (url && url.trim().length > 0) return url;
  return "https://placehold.co/600x900/18181b/78716c?text=No+poster";
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
  const canEdit =
    isAdmin || (owner && status === "pending");
  const canDelete = canEdit;
  const showModeration =
    status === "pending" || status === "rejected";

  const watchlistIds =
    ready && user ? await getWatchlistMovieIdsForUser() : [];
  const watchedIds =
    ready && user ? await getWatchedMovieIdsForUser() : [];
  const inWatchlist = movie ? watchlistIds.includes(movie.id) : false;
  const isWatched = movie ? watchedIds.includes(movie.id) : false;
  const watchlistToggleEnabled =
    Boolean(user) && status === "approved";

  return (
    <div className="mx-auto max-w-5xl px-4 py-8 sm:px-6 sm:py-10">
      {!ready && <SetupCallout />}

      {ready && movie && (
        <div className="grid gap-10 lg:grid-cols-[minmax(0,320px)_1fr] lg:items-start">
          <div className="relative mx-auto aspect-[2/3] w-full max-w-sm overflow-hidden rounded-2xl border border-gray-200 bg-gray-100 shadow-lg lg:mx-0">
            <Image
              src={posterSrc(movie.poster_url)}
              alt={movie.title}
              fill
              priority
              className="object-cover"
              sizes="(max-width: 1024px) 80vw, 320px"
              unoptimized={posterSrc(movie.poster_url).includes("placehold.co")}
            />
          </div>

          <div className="min-w-0 space-y-6">
            {showModeration && (
              <div
                className={`rounded-2xl border px-4 py-3 text-sm ${
                  status === "pending"
                    ? "border-cyan-200 bg-cyan-50 text-cyan-900"
                    : "border-red-200 bg-red-50 text-red-900"
                }`}
              >
                {status === "pending"
                  ? "This submission is waiting for an admin review. It is only visible to you and moderators until it is approved."
                  : "This submission was rejected and is hidden from the public catalogue."}
              </div>
            )}

            <div className="flex flex-wrap items-start justify-between gap-4">
              <div className="space-y-3">
                {movie.runtime_minutes != null && (
                  <div className="flex flex-wrap gap-2">
                    <span className="rounded-full border border-gray-200 bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700">
                      {movie.runtime_minutes} min
                    </span>
                  </div>
                )}
                <h1 className="text-4xl font-bold tracking-tight text-gray-900">
                  {movie.title}
                </h1>
                {(movie.release_year != null || movie.director?.trim()) && (
                  <p className="text-sm text-gray-600">
                    {movie.release_year != null && (
                      <span className="font-semibold text-gray-800">
                        {movie.release_year}
                      </span>
                    )}
                    {movie.release_year != null && movie.director?.trim() && (
                      <span className="text-gray-400"> · </span>
                    )}
                    {movie.director?.trim() && (
                      <>
                        <span className="text-gray-500">Directed by </span>
                        <span className="text-gray-900">{movie.director}</span>
                      </>
                    )}
                  </p>
                )}
                {movie.rating != null && (
                  <p className="text-sm text-gray-600">
                    Your rating:{" "}
                    <span className="font-semibold text-[var(--bms-red)]">
                      {movie.rating.toFixed(1)}
                    </span>{" "}
                    / 10
                  </p>
                )}
              </div>

              <div className="flex flex-row-reverse flex-wrap items-center gap-2">
                {watchlistToggleEnabled && (
                  <>
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
                  </>
                )}
                {canEdit && (
                  <NavLinkButton href={`/movies/${movie.id}/edit`}>
                    Edit
                  </NavLinkButton>
                )}
                {canDelete && <DeleteMovieForm id={movie.id} />}
              </div>
            </div>

            {movie.genres?.length > 0 && (
              <div className="flex flex-wrap gap-2">
                {movie.genres.map((g) => (
                  <span
                    key={g}
                    className="rounded-lg border border-gray-200 bg-gray-50 px-3 py-1 text-xs capitalize text-gray-700"
                  >
                    {g}
                  </span>
                ))}
              </div>
            )}

            <section className="space-y-2">
              <h2 className="text-sm font-semibold uppercase tracking-wider text-gray-500">
                Synopsis
              </h2>
              <p className="text-base leading-relaxed text-gray-700">
                {movie.overview?.trim()
                  ? movie.overview
                  : "No synopsis added yet."}
              </p>
            </section>

            <section className="space-y-2 rounded-2xl border border-gray-200 bg-white p-5 shadow-sm">
              <h2 className="text-sm font-semibold uppercase tracking-wider text-[var(--bms-red)]">
                Your review
              </h2>
              <p className="text-base leading-relaxed text-gray-800">
                {movie.review_text?.trim()
                  ? movie.review_text
                  : "No review yet — add your take from the edit screen."}
              </p>
            </section>

            <NavLinkButton
              href="/"
              variant="link"
              className="inline-flex px-0 py-0"
            >
              ← Back to all movies
            </NavLinkButton>
          </div>
        </div>
      )}
    </div>
  );
}
