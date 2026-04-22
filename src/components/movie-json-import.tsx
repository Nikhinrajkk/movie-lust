"use client";

import { useActionState } from "react";
import {
  createMovieFromJson,
  type MovieFormState,
} from "@/app/actions/movies";
import { MOVIE_JSON_FORMAT_EXAMPLE } from "@/lib/movie-json-import";
import { MOVIE_CATEGORIES } from "@/types/movie";
import { Button } from "@/components/ui/button";
import { FieldLabel } from "@/components/ui/label";

const textareaClass =
  "min-h-[200px] w-full rounded-xl border border-gray-300 bg-white px-3 py-2.5 font-mono text-xs leading-relaxed text-gray-900 outline-none focus:border-[var(--bms-red)] focus:ring-2 focus:ring-[var(--bms-red)]/20";

export function MovieJsonImport() {
  const [state, formAction, pending] = useActionState(
    createMovieFromJson,
    {} as MovieFormState,
  );

  const categoryList = MOVIE_CATEGORIES.map((c) => c.value).join(", ");

  return (
    <details className="rounded-2xl border border-gray-200 bg-white shadow-sm">
      <summary className="cursor-pointer list-none px-4 py-3 text-sm font-medium text-gray-900 [&::-webkit-details-marker]:hidden">
        <span className="text-[var(--bms-red)]">Add from JSON</span>
        <span className="ml-2 text-gray-500">
          — paste an object (see format below)
        </span>
      </summary>
      <div className="space-y-4 border-t border-gray-200 px-4 pb-4 pt-2">
        <p className="text-xs text-gray-600">
          Required: <code className="text-gray-800">title</code>. Optional:{" "}
          <code className="text-gray-800">director</code>,{" "}
          <code className="text-gray-800">overview</code>,{" "}
          <code className="text-gray-800">poster_url</code>,{" "}
          <code className="text-gray-800">release_year</code>,{" "}
          <code className="text-gray-800">runtime_minutes</code>,{" "}
          <code className="text-gray-800">rating</code> (0–10),{" "}
          <code className="text-gray-800">review_text</code>,{" "}
          <code className="text-gray-800">category</code> ({categoryList}
          ; default <code className="text-gray-800">trending</code>),{" "}
          <code className="text-gray-800">genres</code> (array of slugs from
          the form checklist).
        </p>
        <div className="space-y-2">
          <p className="text-xs font-medium text-gray-600">Example</p>
          <pre className="max-h-40 overflow-auto rounded-xl border border-gray-200 bg-gray-50 p-3 font-mono text-[11px] leading-relaxed text-gray-700">
            {MOVIE_JSON_FORMAT_EXAMPLE}
          </pre>
        </div>
        <form action={formAction} className="space-y-3">
          {state.error ? (
            <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800">
              {state.error}
            </div>
          ) : null}
          <div className="space-y-2">
            <FieldLabel htmlFor="movie-json-paste">JSON</FieldLabel>
            <textarea
              id="movie-json-paste"
              name="json"
              required
              placeholder="{ ... }"
              className={textareaClass}
              spellCheck={false}
            />
          </div>
          <Button type="submit" disabled={pending} className="sm:px-8">
            {pending ? "Creating…" : "Create movie from JSON"}
          </Button>
        </form>
      </div>
    </details>
  );
}
