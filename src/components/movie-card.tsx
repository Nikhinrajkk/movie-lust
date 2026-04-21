import Image from "next/image";
import Link from "next/link";
import type { MovieRow } from "@/types/movie";
import { WatchlistToggle } from "@/components/watchlist-toggle";
import { WatchedToggle } from "@/components/watched-toggle";

function posterSrc(url: string | null) {
  if (url && url.trim().length > 0) return url;
  return "https://placehold.co/400x600/18181b/78716c?text=No+poster";
}

export type MovieCardActions = {
  watchlist?: { enabled: boolean; inList: boolean };
  watched?: { enabled: boolean; isWatched: boolean };
};

export function MovieCard({
  movie,
  actions,
}: {
  movie: MovieRow;
  actions?: MovieCardActions;
}) {
  const showWatchlist = actions?.watchlist?.enabled;
  const showWatched = actions?.watched?.enabled;
  const hasPosterActions = Boolean(showWatchlist || showWatched);

  return (
    <Link
      href={`/movies/${movie.id}`}
      className="group relative flex flex-col overflow-hidden rounded-xl border border-zinc-800 bg-zinc-900/60 shadow-lg shadow-black/35 transition hover:-translate-y-0.5 hover:border-cyan-500/40 hover:shadow-cyan-500/10"
    >
      <div className="relative aspect-[2/3] w-full overflow-hidden bg-zinc-950">
        <Image
          src={posterSrc(movie.poster_url)}
          alt={movie.title}
          fill
          sizes="(max-width: 640px) 45vw, (max-width: 1024px) 22vw, 18vw"
          className="object-cover transition duration-500 group-hover:scale-105"
          unoptimized={
            posterSrc(movie.poster_url).includes("placehold.co") ? true : false
          }
        />
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-t from-zinc-950 via-zinc-950/20 to-transparent" />
        {hasPosterActions && (
          <div className="absolute right-1.5 top-1.5 z-10 flex flex-row-reverse items-center gap-1">
            {showWatchlist && actions?.watchlist && (
              <WatchlistToggle
                movieId={movie.id}
                initialInList={actions.watchlist.inList}
                size="xs"
              />
            )}
            {showWatched && actions?.watched && (
              <WatchedToggle
                movieId={movie.id}
                initialWatched={actions.watched.isWatched}
                size="xs"
              />
            )}
          </div>
        )}
        {(movie.approval_status === "pending" ||
          movie.approval_status === "rejected") && (
          <div className="absolute bottom-12 left-1.5 rounded bg-amber-500/90 px-1.5 py-0.5 text-[9px] font-semibold uppercase tracking-wide text-zinc-950">
            {movie.approval_status === "pending" ? "Pending" : "Rejected"}
          </div>
        )}
        {movie.rating != null && (
          <div
            className={`absolute right-1.5 rounded-md bg-zinc-950/90 px-1.5 py-0.5 text-[10px] font-bold text-cyan-400 ring-1 ring-cyan-500/40 ${hasPosterActions ? "top-10" : "top-1.5"}`}
          >
            {movie.rating.toFixed(1)}
          </div>
        )}
      </div>
      <div className="flex flex-1 flex-col gap-1.5 p-3">
        <h3 className="line-clamp-2 text-sm font-semibold leading-snug text-zinc-50 group-hover:text-cyan-100">
          {movie.title}
        </h3>
        {(movie.release_year != null || movie.director?.trim()) && (
          <p className="line-clamp-1 text-[10px] text-zinc-500">
            {movie.release_year != null && (
              <span className="text-zinc-400">{movie.release_year}</span>
            )}
            {movie.release_year != null && movie.director?.trim() && (
              <span className="text-zinc-600"> · </span>
            )}
            {movie.director?.trim() ? (
              <span>{movie.director}</span>
            ) : null}
          </p>
        )}
        <p className="line-clamp-2 text-[11px] leading-snug text-zinc-400">
          {movie.overview || movie.review_text || "No synopsis yet."}
        </p>
        {movie.genres?.length > 0 && (
          <div className="mt-auto flex flex-wrap gap-1 pt-0.5">
            {movie.genres.slice(0, 3).map((g) => (
              <span
                key={g}
                className="rounded bg-zinc-800/80 px-1.5 py-0.5 text-[9px] capitalize text-zinc-300"
              >
                {g}
              </span>
            ))}
          </div>
        )}
      </div>
    </Link>
  );
}
