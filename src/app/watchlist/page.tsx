import { redirect } from "next/navigation";
import { listWatchlistMovies } from "@/app/actions/watchlist";
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

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--md-gold)]">
            Your picks
          </p>
          <h1 className="app-page-title text-2xl font-bold tracking-tight sm:text-3xl">
            Watchlist
          </h1>
          <p className="app-page-sub mt-1 text-sm">
            Titles you&apos;ve saved from the catalogue. Add or remove anytime.
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
          Nothing here yet. Browse films and tap{" "}
          <span className="font-semibold text-[var(--md-gold)]">+ Add to Watchlist</span>{" "}
          on any movie to save it.
        </div>
      )}

      {ready && movies.length > 0 && (
        <div className="grid min-w-0 grid-cols-2 gap-2 sm:grid-cols-3 sm:gap-3 md:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6">
          {movies.map((m) => (
            <MovieCard
              key={m.id}
              movie={m}
              actions={{ watchlist: { enabled: true, inList: true } }}
            />
          ))}
        </div>
      )}
    </div>
  );
}
