import Link from "next/link";
import { redirect } from "next/navigation";
import { listWatchlistMovies } from "@/app/actions/watchlist";
import { MovieCard } from "@/components/movie-card";
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
          <p className="text-xs font-semibold uppercase tracking-widest text-amber-400/90">
            Your picks
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-zinc-50">
            My list
          </h1>
          <p className="mt-1 text-sm text-zinc-400">
            Titles you&apos;ve saved from the catalogue. Add or remove anytime.
          </p>
        </div>
        <Link
          href="/"
          className="text-sm font-medium text-zinc-400 underline-offset-4 hover:text-amber-200 hover:underline"
        >
          ← Back to browse
        </Link>
      </div>

      {!ready && <SetupCallout />}

      {ready && movies.length === 0 && (
        <div className="rounded-2xl border border-zinc-800 bg-zinc-900/40 px-6 py-12 text-center text-sm text-zinc-400">
          Nothing here yet. Browse films and tap{" "}
          <span className="font-semibold text-amber-200">+</span> on a poster to
          save it.
        </div>
      )}

      {ready && movies.length > 0 && (
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4">
          {movies.map((m) => (
            <MovieCard
              key={m.id}
              movie={m}
              watchlist={{ enabled: true, inList: true }}
            />
          ))}
        </div>
      )}
    </div>
  );
}
