"use client";

import { useActionState } from "react";
import type { MovieFormState } from "@/app/actions/movies";
import type { MovieRow } from "@/types/movie";
import { GENRE_OPTIONS } from "@/types/movie";

type Action = (
  prev: MovieFormState,
  formData: FormData,
) => Promise<MovieFormState>;

export function MovieForm({
  action,
  movie,
}: {
  action: Action;
  movie?: MovieRow | null;
}) {
  const [state, formAction, pending] = useActionState(action, {});

  return (
    <form action={formAction} className="mx-auto max-w-2xl space-y-6">
      {movie?.id ? <input type="hidden" name="id" value={movie.id} /> : null}
      <input
        type="hidden"
        name="category"
        value={movie?.category ?? "trending"}
      />
      {state.error && (
        <div className="rounded-xl border border-red-500/35 bg-red-500/10 px-4 py-3 text-sm text-red-100">
          {state.error}
        </div>
      )}
      <div className="grid gap-6 sm:grid-cols-2">
        <label className="sm:col-span-2 block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Title</span>
          <input
            name="title"
            required
            defaultValue={movie?.title ?? ""}
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

        <label className="sm:col-span-2 block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Director</span>
          <input
            name="director"
            defaultValue={movie?.director ?? ""}
            placeholder="e.g. Christopher Nolan"
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

        <label className="sm:col-span-2 block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Poster URL</span>
          <input
            name="poster_url"
            type="url"
            defaultValue={movie?.poster_url ?? ""}
            placeholder="https://image.tmdb.org/..."
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

        <label className="block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Release year</span>
          <input
            name="release_year"
            type="number"
            min={1888}
            max={2100}
            defaultValue={movie?.release_year ?? ""}
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

        <label className="block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Runtime (min)</span>
          <input
            name="runtime_minutes"
            type="number"
            min={1}
            defaultValue={movie?.runtime_minutes ?? ""}
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

        <label className="block space-y-2">
          <span className="text-xs font-medium text-zinc-400">Your rating (0–10)</span>
          <input
            name="rating"
            type="number"
            step="0.1"
            min={0}
            max={10}
            defaultValue={movie?.rating ?? ""}
            className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
          />
        </label>

      </div>

      <fieldset className="space-y-3 rounded-2xl border border-zinc-800 bg-zinc-900/40 p-4">
        <legend className="px-1 text-xs font-semibold uppercase tracking-wider text-amber-400/90">
          Genres
        </legend>
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
          {GENRE_OPTIONS.map((g) => {
            const checked = movie?.genres?.includes(g) ?? false;
            return (
              <label
                key={g}
                className="flex cursor-pointer items-center gap-2 rounded-lg border border-zinc-800 bg-zinc-950/60 px-3 py-2 text-sm capitalize text-zinc-300 hover:border-amber-500/30"
              >
                <input
                  type="checkbox"
                  name={`genre_${g}`}
                  defaultChecked={checked}
                  className="size-4 rounded border-zinc-600 text-amber-500 focus:ring-amber-500/40"
                />
                {g}
              </label>
            );
          })}
        </div>
      </fieldset>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Synopsis</span>
        <textarea
          name="overview"
          rows={4}
          defaultValue={movie?.overview ?? ""}
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
        />
      </label>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Your review</span>
        <textarea
          name="review_text"
          rows={4}
          defaultValue={movie?.review_text ?? ""}
          placeholder="What stayed with you after the credits?"
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25"
        />
      </label>

      <button
        type="submit"
        disabled={pending}
        className="w-full rounded-xl bg-amber-500 py-3 text-sm font-bold text-zinc-950 shadow-lg shadow-amber-500/25 transition hover:bg-amber-400 disabled:opacity-50 sm:w-auto sm:px-10"
      >
        {pending ? "Saving…" : movie ? "Update movie" : "Add movie"}
      </button>
    </form>
  );
}
