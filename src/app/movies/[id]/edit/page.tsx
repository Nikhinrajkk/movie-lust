import Link from "next/link";
import { notFound } from "next/navigation";
import { getMovieById, updateMovieFromForm } from "@/app/actions/movies";
import { MovieForm } from "@/components/movie-form";
import { SetupCallout } from "@/components/setup-callout";
import { isSupabaseConfigured } from "@/lib/config";

export default async function EditMoviePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const ready = isSupabaseConfigured();
  const movie = ready ? await getMovieById(id) : null;

  if (ready && !movie) notFound();

  return (
    <div className="mx-auto max-w-3xl space-y-8 px-4 py-10 sm:px-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-amber-400/90">
            Edit listing
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-zinc-50">
            {movie?.title ?? "Movie"}
          </h1>
        </div>
        <Link
          href={movie ? `/movies/${movie.id}` : "/"}
          className="text-sm font-medium text-zinc-400 underline-offset-4 hover:text-amber-200 hover:underline"
        >
          ← Cancel
        </Link>
      </div>

      {!ready && <SetupCallout />}
      {ready && movie && (
        <MovieForm action={updateMovieFromForm} movie={movie} />
      )}
    </div>
  );
}
