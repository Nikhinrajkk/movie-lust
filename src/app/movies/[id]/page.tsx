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
    <div className="mx-auto max-w-5xl px-4 py-10 sm:px-6">
      {!ready && <SetupCallout />}

      {ready && movie && (
        <div className="grid gap-10 lg:grid-cols-[minmax(0,320px)_1fr] lg:items-start">
          <div className="relative mx-auto aspect-[2/3] w-full max-w-sm overflow-hidden rounded-3xl border border-zinc-800 bg-zinc-950 shadow-2xl shadow-black/50 lg:mx-0">
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
                    ? "border-cyan-500/35 bg-cyan-500/10 text-cyan-100"
                    : "border-red-500/35 bg-red-500/10 text-red-100"
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
                    <span className="rounded-full bg-zinc-800 px-3 py-1 text-xs font-medium text-zinc-300">
                      {movie.runtime_minutes} min
                    </span>
                  </div>
                )}
                <h1 className="text-4xl font-bold tracking-tight text-zinc-50">
                  {movie.title}
                </h1>
                {(movie.release_year != null || movie.director?.trim()) && (
                  <p className="text-sm text-zinc-400">
                    {movie.release_year != null && (
                      <span className="font-medium text-zinc-300">
                        {movie.release_year}
                      </span>
                    )}
                    {movie.release_year != null && movie.director?.trim() && (
                      <span className="text-zinc-600"> · </span>
                    )}
                    {movie.director?.trim() && (
                      <>
                        <span className="text-zinc-500">Directed by </span>
                        <span className="text-zinc-200">{movie.director}</span>
                      </>
                    )}
                  </p>
                )}
                {movie.rating != null && (
                  <p className="text-sm text-zinc-400">
                    Your rating:{" "}
                    <span className="font-semibold text-cyan-400">
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
                    className="rounded-lg bg-zinc-800/90 px-3 py-1 text-xs capitalize text-zinc-200"
                  >
                    {g}
                  </span>
                ))}
              </div>
            )}

            <section className="space-y-2">
              <h2 className="text-sm font-semibold uppercase tracking-wider text-zinc-500">
                Synopsis
              </h2>
              <p className="text-base leading-relaxed text-zinc-300">
                {movie.overview?.trim()
                  ? movie.overview
                  : "No synopsis added yet."}
              </p>
            </section>

            <section className="space-y-2 rounded-2xl border border-zinc-800 bg-zinc-900/40 p-5">
              <h2 className="text-sm font-semibold uppercase tracking-wider text-cyan-400/90">
                Your review
              </h2>
              <p className="text-base leading-relaxed text-zinc-200">
                {movie.review_text?.trim()
                  ? movie.review_text
                  : "No review yet — add your take from the edit screen."}
              </p>
            </section>

            <NavLinkButton
              href="/"
              variant="link"
              className="inline-flex px-0 py-0 text-zinc-400 hover:text-cyan-200"
            >
              ← Back to all movies
            </NavLinkButton>
          </div>
        </div>
      )}
    </div>
  );
}
