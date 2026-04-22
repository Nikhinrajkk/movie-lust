import Image from "next/image";
import Link from "next/link";
import type { MovieRow } from "@/types/movie";
import { MOVIE_CATEGORIES } from "@/types/movie";
import { WatchlistToggle } from "@/components/watchlist-toggle";
import { WatchedToggle } from "@/components/watched-toggle";

function posterSrc(url: string | null) {
  if (url && url.trim().length > 0) return url;
  return "https://placehold.co/400x600/e5e5e5/737373?text=No+poster";
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
  const categoryLabel =
    MOVIE_CATEGORIES.find((c) => c.value === movie.category)?.label ??
    movie.category;

  return (
    <Link
      href={`/movies/${movie.id}`}
      className="group relative flex flex-col overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm transition hover:-translate-y-0.5 hover:border-gray-300 hover:shadow-md"
    >
      <div className="relative aspect-[2/3] w-full overflow-hidden bg-gray-100">
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
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-t from-black/55 via-transparent to-transparent" />
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
          <div className="absolute bottom-12 left-1.5 rounded bg-amber-400 px-1.5 py-0.5 text-[9px] font-bold uppercase tracking-wide text-amber-950">
            {movie.approval_status === "pending" ? "Pending" : "Rejected"}
          </div>
        )}
        {movie.rating != null && (
          <div
            className={`absolute right-1.5 rounded-md bg-white/95 px-1.5 py-0.5 text-[10px] font-bold text-emerald-700 shadow-sm ring-1 ring-gray-200/80 ${hasPosterActions ? "top-10" : "top-1.5"}`}
          >
            {movie.rating.toFixed(1)}
            <span className="font-medium text-gray-500">/10</span>
          </div>
        )}
      </div>
      <div className="flex flex-1 flex-col gap-1.5 p-3">
        <h3 className="line-clamp-2 text-sm font-bold leading-snug text-gray-900 group-hover:text-[var(--bms-red)]">
          {movie.title}
        </h3>
        <p className="line-clamp-1 text-[10px] font-medium text-[var(--bms-red)]">
          {categoryLabel}
        </p>
        {(movie.release_year != null || movie.director?.trim()) && (
          <p className="line-clamp-1 text-[10px] text-gray-500">
            {movie.release_year != null && (
              <span className="text-gray-700">{movie.release_year}</span>
            )}
            {movie.release_year != null && movie.director?.trim() && (
              <span className="text-gray-400"> · </span>
            )}
            {movie.director?.trim() ? (
              <span>{movie.director}</span>
            ) : null}
          </p>
        )}
        <p className="line-clamp-2 text-[11px] leading-snug text-gray-600">
          {movie.overview || movie.review_text || "No synopsis yet."}
        </p>
        {movie.genres?.length > 0 && (
          <div className="mt-auto flex flex-wrap gap-1 pt-0.5">
            {movie.genres.slice(0, 3).map((g) => (
              <span
                key={g}
                className="rounded border border-gray-200 bg-gray-50 px-1.5 py-0.5 text-[9px] capitalize text-gray-600"
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
