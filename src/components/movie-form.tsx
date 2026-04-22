"use client";

import { useActionState } from "react";
import type { MovieFormState } from "@/app/actions/movies";
import type { MovieRow } from "@/types/movie";
import { GENRE_OPTIONS } from "@/types/movie";
import { Button } from "@/components/ui/button";
import { FormCheckbox } from "@/components/ui/checkbox";
import { FieldLabel } from "@/components/ui/label";

type Action = (
  prev: MovieFormState,
  formData: FormData,
) => Promise<MovieFormState>;

const inputClass =
  "w-full rounded-xl border border-gray-300 bg-white px-3 py-2.5 text-sm text-gray-900 outline-none focus:border-[var(--bms-red)] focus:ring-2 focus:ring-[var(--bms-red)]/20";

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
        <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800">
          {state.error}
        </div>
      )}
      <div className="grid gap-6 sm:grid-cols-2">
        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="movie-title">Title</FieldLabel>
          <input
            id="movie-title"
            name="title"
            required
            defaultValue={movie?.title ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="movie-director">Director</FieldLabel>
          <input
            id="movie-director"
            name="director"
            defaultValue={movie?.director ?? ""}
            placeholder="e.g. Christopher Nolan"
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="movie-poster">Poster URL</FieldLabel>
          <input
            id="movie-poster"
            name="poster_url"
            type="url"
            defaultValue={movie?.poster_url ?? ""}
            placeholder="https://image.tmdb.org/..."
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="movie-year">Release year</FieldLabel>
          <input
            id="movie-year"
            name="release_year"
            type="number"
            min={1888}
            max={2100}
            defaultValue={movie?.release_year ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="movie-runtime">Runtime (min)</FieldLabel>
          <input
            id="movie-runtime"
            name="runtime_minutes"
            type="number"
            min={1}
            defaultValue={movie?.runtime_minutes ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="movie-rating">Your rating (0–10)</FieldLabel>
          <input
            id="movie-rating"
            name="rating"
            type="number"
            step="0.1"
            min={0}
            max={10}
            defaultValue={movie?.rating ?? ""}
            className={inputClass}
          />
        </div>
      </div>

      <fieldset className="space-y-3 rounded-2xl border border-gray-200 bg-gray-50/80 p-4">
        <legend className="px-1 text-xs font-semibold uppercase tracking-wider text-[var(--bms-red)]">
          Genres
        </legend>
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
          {GENRE_OPTIONS.map((g) => {
            const checked = movie?.genres?.includes(g) ?? false;
            return (
              <FormCheckbox
                key={g}
                id={`genre-${g}`}
                name={`genre_${g}`}
                defaultChecked={checked}
                labelText={g}
              />
            );
          })}
        </div>
      </fieldset>

      <div className="space-y-2">
        <FieldLabel htmlFor="movie-overview">Synopsis</FieldLabel>
        <textarea
          id="movie-overview"
          name="overview"
          rows={4}
          defaultValue={movie?.overview ?? ""}
          className={inputClass}
        />
      </div>

      <div className="space-y-2">
        <FieldLabel htmlFor="movie-review">Your review</FieldLabel>
        <textarea
          id="movie-review"
          name="review_text"
          rows={4}
          defaultValue={movie?.review_text ?? ""}
          placeholder="What stayed with you after the credits?"
          className={inputClass}
        />
      </div>

      <Button
        type="submit"
        disabled={pending}
        className="w-full sm:w-auto sm:px-10"
      >
        {pending ? "Saving…" : movie ? "Update movie" : "Add movie"}
      </Button>
    </form>
  );
}
