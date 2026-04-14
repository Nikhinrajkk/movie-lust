"use client";

import { useMovieFilters } from "@/stores/movie-filters";

export function MoviePagination({
  page,
  totalPages,
  disabled,
}: {
  page: number;
  totalPages: number;
  disabled?: boolean;
}) {
  const setPage = useMovieFilters((s) => s.setPage);

  return (
    <div className="flex flex-wrap items-center justify-between gap-3 border-t border-zinc-800 pt-6">
      <p className="text-xs text-zinc-500">
        Page {page} of {totalPages}
      </p>
      <div className="flex gap-2">
        <button
          type="button"
          disabled={disabled || page <= 1}
          onClick={() => setPage(Math.max(1, page - 1))}
          className="rounded-xl border border-zinc-700 bg-zinc-900 px-4 py-2 text-sm font-medium text-zinc-200 transition hover:border-amber-500/40 hover:text-amber-100 disabled:cursor-not-allowed disabled:opacity-40"
        >
          Previous
        </button>
        <button
          type="button"
          disabled={disabled || page >= totalPages}
          onClick={() => setPage(Math.min(totalPages, page + 1))}
          className="rounded-xl border border-zinc-700 bg-zinc-900 px-4 py-2 text-sm font-medium text-zinc-200 transition hover:border-amber-500/40 hover:text-amber-100 disabled:cursor-not-allowed disabled:opacity-40"
        >
          Next
        </button>
      </div>
    </div>
  );
}
