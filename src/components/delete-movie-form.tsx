"use client";

import { deleteMovieFormAction } from "@/app/actions/movies";

export function DeleteMovieForm({ id }: { id: string }) {
  return (
    <form action={deleteMovieFormAction}>
      <input type="hidden" name="id" value={id} />
      <button
        type="submit"
        onClick={(e) => {
          if (!confirm("Remove this movie from your library?")) {
            e.preventDefault();
          }
        }}
        className="rounded-xl border border-red-500/40 bg-red-500/10 px-4 py-2 text-sm font-semibold text-red-200 transition hover:bg-red-500/20"
      >
        Remove
      </button>
    </form>
  );
}
