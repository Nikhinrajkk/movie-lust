import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getMovieById } from "@/app/actions/movies";
import { DeleteMovieForm } from "@/components/delete-movie-form";
import { SetupCallout } from "@/components/setup-callout";
import { isSupabaseConfigured } from "@/lib/config";
import { MOVIE_CATEGORIES } from "@/types/movie";

function categoryLabel(value: string) {
  return MOVIE_CATEGORIES.find((c) => c.value === value)?.label ?? value;
}

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
  const movie = ready ? await getMovieById(id) : null;

  if (ready && !movie) notFound();

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
            <div className="flex flex-wrap items-start justify-between gap-4">
              <div className="space-y-3">
                <div className="flex flex-wrap gap-2">
                  <span className="rounded-full bg-amber-500/15 px-3 py-1 text-xs font-semibold uppercase tracking-wide text-amber-300 ring-1 ring-amber-500/25">
                    {categoryLabel(movie.category)}
                  </span>
                  {movie.release_year != null && (
                    <span className="rounded-full bg-zinc-800 px-3 py-1 text-xs font-medium text-zinc-300">
                      {movie.release_year}
                    </span>
                  )}
                  {movie.runtime_minutes != null && (
                    <span className="rounded-full bg-zinc-800 px-3 py-1 text-xs font-medium text-zinc-300">
                      {movie.runtime_minutes} min
                    </span>
                  )}
                </div>
                <h1 className="text-4xl font-bold tracking-tight text-zinc-50">
                  {movie.title}
                </h1>
                {movie.director?.trim() ? (
                  <p className="text-sm text-zinc-400">
                    Directed by{" "}
                    <span className="text-zinc-200">{movie.director}</span>
                  </p>
                ) : null}
                {movie.rating != null && (
                  <p className="text-sm text-zinc-400">
                    Your rating:{" "}
                    <span className="font-semibold text-amber-400">
                      {movie.rating.toFixed(1)}
                    </span>{" "}
                    / 10
                  </p>
                )}
              </div>

              <div className="flex flex-wrap gap-2">
                <Link
                  href={`/movies/${movie.id}/edit`}
                  className="rounded-xl bg-amber-500 px-4 py-2 text-sm font-bold text-zinc-950 shadow-lg shadow-amber-500/20 transition hover:bg-amber-400"
                >
                  Edit
                </Link>
                <DeleteMovieForm id={movie.id} />
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
              <h2 className="text-sm font-semibold uppercase tracking-wider text-amber-400/90">
                Your review
              </h2>
              <p className="text-base leading-relaxed text-zinc-200">
                {movie.review_text?.trim()
                  ? movie.review_text
                  : "No review yet — add your take from the edit screen."}
              </p>
            </section>

            <Link
              href="/"
              className="inline-flex text-sm font-medium text-zinc-400 underline-offset-4 hover:text-amber-200 hover:underline"
            >
              ← Back to all movies
            </Link>
          </div>
        </div>
      )}
    </div>
  );
}
