import { redirect } from "next/navigation";
import { listMoviesCreatedByUser } from "@/app/actions/movies";
import { getWatchlistMovieIdsForUser } from "@/app/actions/watchlist";
import { getWatchedMovieIdsForUser } from "@/app/actions/watched";
import { MovieCard } from "@/components/movie-card";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function MyMoviesPage() {
  const ready = isSupabaseConfigured();
  const { user } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/my-movies");
  }

  const movies = ready && user ? await listMoviesCreatedByUser() : [];
  const watchlistMovieIds =
    ready && user ? await getWatchlistMovieIdsForUser() : [];
  const watchedMovieIds =
    ready && user ? await getWatchedMovieIdsForUser() : [];
  const watchlistSet = new Set(watchlistMovieIds);
  const watchedSet = new Set(watchedMovieIds);

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Submissions
          </p>
          <h1 className="app-page-title text-2xl font-bold tracking-tight sm:text-3xl">
            My movies
          </h1>
          <p className="app-page-sub mt-1 text-sm">
            Titles you&apos;ve added — pending, approved, or rejected.
          </p>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <NavLinkButton href="/movies/new" className="shrink-0">
            Add movie
          </NavLinkButton>
          <NavLinkButton
            href="/"
            variant="link"
            className="app-nav-link shrink-0 px-0 py-0 text-sm"
          >
            ← Back to browse
          </NavLinkButton>
        </div>
      </div>

      {!ready && <SetupCallout />}

      {ready && movies.length === 0 && (
        <div className="app-panel px-6 py-12 text-center text-sm text-[var(--md-text-muted)]">
          You haven&apos;t submitted any titles yet.{" "}
          <NavLinkButton
            href="/movies/new"
            variant="link"
            className="inline-flex px-0 py-0 font-semibold text-[var(--bms-red)]"
          >
            Add your first movie
          </NavLinkButton>
          .
        </div>
      )}

      {ready && movies.length > 0 && (
        <div className="grid min-w-0 grid-cols-2 gap-2 sm:grid-cols-3 sm:gap-3 md:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6">
          {movies.map((m) => {
            const approved = (m.approval_status ?? "approved") === "approved";
            return (
              <MovieCard
                key={m.id}
                movie={m}
                actions={
                  user && approved
                    ? {
                        watchlist: {
                          enabled: true,
                          inList: watchlistSet.has(m.id),
                        },
                        watched: {
                          enabled: true,
                          isWatched: watchedSet.has(m.id),
                        },
                      }
                    : undefined
                }
              />
            );
          })}
        </div>
      )}
    </div>
  );
}
