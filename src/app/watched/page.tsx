import { redirect } from "next/navigation";
import { listWatchedMovies } from "@/app/actions/watched";
import { getWatchlistMovieIdsForUser } from "@/app/actions/watchlist";
import { MovieCard } from "@/components/movie-card";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function WatchedMoviesPage() {
  const ready = isSupabaseConfigured();
  const { user } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/watched");
  }

  const movies = ready && user ? await listWatchedMovies() : [];
  const watchlistMovieIds =
    ready && user ? await getWatchlistMovieIdsForUser() : [];
  const watchlistSet = new Set(watchlistMovieIds);

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Library
          </p>
          <h1 className="app-page-title text-2xl font-bold tracking-tight sm:text-3xl">
            Watched movies
          </h1>
          <p className="app-page-sub mt-1 text-sm">
            Films you&apos;ve marked as watched in the catalogue.
          </p>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="app-nav-link px-0 py-0 text-sm"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {!ready && <SetupCallout />}

      {ready && movies.length === 0 && (
        <div className="app-panel px-6 py-12 text-center text-sm text-[var(--md-text-muted)]">
          Nothing here yet. Open any approved title and tap the{" "}
          <span className="font-semibold text-[var(--bms-red)]">checkmark</span>{" "}
          on the poster to mark it watched.
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
                        watched: { enabled: true, isWatched: true },
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
