import Image from "next/image";
import Link from "next/link";
import type { MovieRow } from "@/types/movie";

function posterSrc(url: string | null) {
  if (url && url.trim().length > 0) return url;
  return "https://placehold.co/400x600/18181b/78716c?text=No+poster";
}

export function MovieCard({ movie }: { movie: MovieRow }) {
  return (
    <Link
      href={`/movies/${movie.id}`}
      className="group relative flex flex-col overflow-hidden rounded-2xl border border-zinc-800 bg-zinc-900/60 shadow-xl shadow-black/40 transition hover:-translate-y-1 hover:border-amber-500/40 hover:shadow-amber-500/10"
    >
      <div className="relative aspect-[2/3] w-full overflow-hidden bg-zinc-950">
        <Image
          src={posterSrc(movie.poster_url)}
          alt={movie.title}
          fill
          sizes="(max-width: 640px) 50vw, (max-width: 1024px) 33vw, 25vw"
          className="object-cover transition duration-500 group-hover:scale-105"
          unoptimized={
            posterSrc(movie.poster_url).includes("placehold.co") ? true : false
          }
        />
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-t from-zinc-950 via-zinc-950/20 to-transparent" />
        {movie.rating != null && (
          <div className="absolute right-2 top-2 rounded-lg bg-zinc-950/90 px-2 py-1 text-xs font-bold text-amber-400 ring-1 ring-amber-500/40">
            {movie.rating.toFixed(1)}
          </div>
        )}
      </div>
      <div className="flex flex-1 flex-col gap-2 p-4">
        {movie.release_year != null && (
          <div className="flex flex-wrap items-center gap-2">
            <span className="text-[11px] text-zinc-500">{movie.release_year}</span>
          </div>
        )}
        <h3 className="line-clamp-2 text-base font-semibold leading-snug text-zinc-50 group-hover:text-amber-100">
          {movie.title}
        </h3>
        {movie.director?.trim() ? (
          <p className="line-clamp-1 text-[11px] text-zinc-500">
            {movie.director}
          </p>
        ) : null}
        <p className="line-clamp-2 text-xs leading-relaxed text-zinc-400">
          {movie.overview || movie.review_text || "No synopsis yet."}
        </p>
        {movie.genres?.length > 0 && (
          <div className="mt-auto flex flex-wrap gap-1.5 pt-1">
            {movie.genres.slice(0, 3).map((g) => (
              <span
                key={g}
                className="rounded-md bg-zinc-800/80 px-2 py-0.5 text-[10px] capitalize text-zinc-300"
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
