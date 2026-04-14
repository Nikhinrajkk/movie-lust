import Link from "next/link";
import { createMovieFromForm } from "@/app/actions/movies";
import { MovieForm } from "@/components/movie-form";
import { SetupCallout } from "@/components/setup-callout";
import { isSupabaseConfigured } from "@/lib/config";

export default function NewMoviePage() {
  const ready = isSupabaseConfigured();

  return (
    <div className="mx-auto max-w-3xl space-y-8 px-4 py-10 sm:px-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-amber-400/90">
            Add to collection
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-zinc-50">
            New movie
          </h1>
        </div>
        <Link
          href="/"
          className="text-sm font-medium text-zinc-400 underline-offset-4 hover:text-amber-200 hover:underline"
        >
          ← Back to browse
        </Link>
      </div>

      {!ready && <SetupCallout />}
      {ready && <MovieForm action={createMovieFromForm} />}
    </div>
  );
}
