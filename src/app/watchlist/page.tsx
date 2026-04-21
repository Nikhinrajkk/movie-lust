import { redirect } from "next/navigation";
import { listWatchlistMovies } from "@/app/actions/watchlist";
import { getWatchedMovieIdsForUser } from "@/app/actions/watched";
import { MovieCard } from "@/components/movie-card";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function WatchlistPage() {
  const ready = isSupabaseConfigured();
  const { user } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/watchlist");
  }

  const movies = ready && user ? await listWatchlistMovies() : [];
  const watchedMovieIds =
    ready && user ? await getWatchedMovieIdsForUser() : [];
  const watchedSet = new Set(watchedMovieIds);

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-cyan-400/90">
            Your picks
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-zinc-50">
            My list
          </h1>
          <p className="mt-1 text-sm text-zinc-400">
            Titles you&apos;ve saved from the catalogue. Add or remove anytime.
          </p>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="px-0 py-0 text-sm text-zinc-400 hover:text-cyan-200"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {!ready && <SetupCallout />}

      {ready && movies.length === 0 && (
        <div className="rounded-2xl border border-zinc-800 bg-zinc-900/40 px-6 py-12 text-center text-sm text-zinc-400">
          Nothing here yet. Browse films and tap the{" "}
          <span className="font-semibold text-rose-300">heart</span> on a poster
          to favourite it.
        </div>
      )}

      {ready && movies.length > 0 && (
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6">
          {movies.map((m) => (
            <MovieCard
              key={m.id}
              movie={m}
              actions={{
                watchlist: { enabled: true, inList: true },
                watched: {
                  enabled: true,
                  isWatched: watchedSet.has(m.id),
                },
              }}
            />
          ))}
        </div>
      )}
    </div>
  );
}
