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
  "min-h-[200px] w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 font-mono text-xs leading-relaxed text-zinc-100 outline-none focus:border-cyan-500/50 focus:ring-2 focus:ring-cyan-500/25";

export function MovieJsonImport() {
  const [state, formAction, pending] = useActionState(
    createMovieFromJson,
    {} as MovieFormState,
  );

  const categoryList = MOVIE_CATEGORIES.map((c) => c.value).join(", ");

  return (
    <details className="rounded-2xl border border-zinc-800 bg-zinc-900/35">
      <summary className="cursor-pointer list-none px-4 py-3 text-sm font-medium text-zinc-200 [&::-webkit-details-marker]:hidden">
        <span className="text-cyan-400/90">Add from JSON</span>
        <span className="ml-2 text-zinc-500">
          — paste an object (see format below)
        </span>
      </summary>
      <div className="space-y-4 border-t border-zinc-800 px-4 pb-4 pt-2">
        <p className="text-xs text-zinc-500">
          Required: <code className="text-zinc-400">title</code>. Optional:{" "}
          <code className="text-zinc-400">director</code>,{" "}
          <code className="text-zinc-400">overview</code>,{" "}
          <code className="text-zinc-400">poster_url</code>,{" "}
          <code className="text-zinc-400">release_year</code>,{" "}
          <code className="text-zinc-400">runtime_minutes</code>,{" "}
          <code className="text-zinc-400">rating</code> (0–10),{" "}
          <code className="text-zinc-400">review_text</code>,{" "}
          <code className="text-zinc-400">category</code> ({categoryList}
          ; default <code className="text-zinc-400">trending</code>),{" "}
          <code className="text-zinc-400">genres</code> (array of slugs from
          the form checklist).
        </p>
        <div className="space-y-2">
          <p className="text-xs font-medium text-zinc-400">Example</p>
          <pre className="max-h-40 overflow-auto rounded-xl border border-zinc-800 bg-zinc-950/80 p-3 font-mono text-[11px] leading-relaxed text-zinc-400">
            {MOVIE_JSON_FORMAT_EXAMPLE}
          </pre>
        </div>
        <form action={formAction} className="space-y-3">
          {state.error ? (
            <div className="rounded-xl border border-red-500/35 bg-red-500/10 px-4 py-3 text-sm text-red-100">
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
