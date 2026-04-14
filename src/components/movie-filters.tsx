"use client";

import { useMovieFilters } from "@/stores/movie-filters";
import { GENRE_OPTIONS } from "@/types/movie";

export function MovieFilters({ disabled }: { disabled?: boolean }) {
  const search = useMovieFilters((s) => s.search);
  const setSearch = useMovieFilters((s) => s.setSearch);
  const genre = useMovieFilters((s) => s.genre);
  const setGenre = useMovieFilters((s) => s.setGenre);
  const sort = useMovieFilters((s) => s.sort);
  const setSort = useMovieFilters((s) => s.setSort);
  const pageSize = useMovieFilters((s) => s.pageSize);
  const setPageSize = useMovieFilters((s) => s.setPageSize);

  return (
    <div className="space-y-5 rounded-2xl border border-zinc-800 bg-zinc-900/50 p-5 shadow-lg shadow-black/30">
      <h2 className="text-sm font-semibold uppercase tracking-wider text-amber-400/90">
        Filters
      </h2>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Search</span>
        <input
          type="search"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          disabled={disabled}
          placeholder="Title, synopsis, review…"
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none ring-amber-500/0 transition placeholder:text-zinc-600 focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25 disabled:opacity-50"
        />
      </label>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Genre</span>
        <select
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
          disabled={disabled}
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25 disabled:opacity-50"
        >
          <option value="">All genres</option>
          {GENRE_OPTIONS.map((g) => (
            <option key={g} value={g}>
              {g.charAt(0).toUpperCase() + g.slice(1)}
            </option>
          ))}
        </select>
      </label>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Sort</span>
        <select
          value={sort}
          onChange={(e) =>
            setSort(
              e.target.value as
                | "newest"
                | "title_asc"
                | "rating_desc"
                | "year_desc",
            )
          }
          disabled={disabled}
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25 disabled:opacity-50"
        >
          <option value="newest">Newest added</option>
          <option value="rating_desc">Rating (high → low)</option>
          <option value="year_desc">Release year</option>
          <option value="title_asc">Title (A → Z)</option>
        </select>
      </label>

      <label className="block space-y-2">
        <span className="text-xs font-medium text-zinc-400">Page size</span>
        <select
          value={pageSize}
          onChange={(e) => setPageSize(Number(e.target.value))}
          disabled={disabled}
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-zinc-100 outline-none focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/25 disabled:opacity-50"
        >
          {[8, 12, 16, 24].map((n) => (
            <option key={n} value={n}>
              {n} per page
            </option>
          ))}
        </select>
      </label>
    </div>
  );
}
