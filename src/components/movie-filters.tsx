"use client";

import { useMovieFilters } from "@/stores/movie-filters";
import type { SortOption } from "@/stores/movie-filters";
import { Button } from "@/components/ui/button";
import { FieldLabel } from "@/components/ui/label";
import {
  UiSelect,
  UiSelectGroup,
  UiSelectGroupLabel,
  UiSelectItem,
} from "@/components/ui/select";
import { GENRE_OPTIONS, MOVIE_CATEGORIES, type MovieCategory } from "@/types/movie";

const FILTER_ALL = "__all__";

export function MovieFilters({ disabled }: { disabled?: boolean }) {
  const search = useMovieFilters((s) => s.search);
  const setSearch = useMovieFilters((s) => s.setSearch);
  const genre = useMovieFilters((s) => s.genre);
  const setGenre = useMovieFilters((s) => s.setGenre);
  const category = useMovieFilters((s) => s.category);
  const setCategory = useMovieFilters((s) => s.setCategory);
  const clearFilters = useMovieFilters((s) => s.clearFilters);
  const sort = useMovieFilters((s) => s.sort);
  const setSort = useMovieFilters((s) => s.setSort);

  const filterValue = genre ? `g:${genre}` : category ? `c:${category}` : FILTER_ALL;

  function onFilterChange(raw: string) {
    if (raw === FILTER_ALL) {
      setGenre("");
      setCategory("");
      return;
    }
    if (raw.startsWith("g:")) {
      setGenre(raw.slice(2));
      setCategory("");
      return;
    }
    if (raw.startsWith("c:")) {
      setCategory(raw.slice(2) as MovieCategory);
      setGenre("");
    }
  }

  const hasTextOrFilter =
    search.trim().length > 0 || Boolean(genre) || Boolean(category);

  return (
    <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:gap-3">
      <div className="relative min-w-0 flex-1">
        <FieldLabel htmlFor="catalog-search" className="sr-only">
          Search catalogue
        </FieldLabel>
        <span
          className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-zinc-500 sm:left-3.5"
          aria-hidden
        >
          <svg
            className="h-5 w-5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            />
          </svg>
        </span>
        <input
          id="catalog-search"
          type="search"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          disabled={disabled}
          placeholder="Search title, synopsis, reviews, director…"
          className="w-full rounded-xl border border-zinc-700 bg-zinc-950 py-2.5 pl-10 pr-3 text-sm text-zinc-100 outline-none ring-amber-500/0 transition placeholder:text-zinc-600 focus:border-amber-500/45 focus:ring-2 focus:ring-amber-500/20 disabled:opacity-50 sm:py-3 sm:pl-11 sm:text-base"
        />
      </div>

      <div className="flex shrink-0 flex-wrap items-center gap-2 sm:gap-3">
        <UiSelect
          value={filterValue}
          onValueChange={onFilterChange}
          disabled={disabled}
          placeholder="Filter"
          id="catalog-filter"
          aria-label="Filter catalogue"
          triggerClassName="min-w-[11rem] flex-1 sm:flex-initial sm:min-w-[12.5rem]"
        >
          <UiSelectItem value={FILTER_ALL}>All titles</UiSelectItem>
          <UiSelectGroup>
            <UiSelectGroupLabel>Genre</UiSelectGroupLabel>
            {GENRE_OPTIONS.map((g) => (
              <UiSelectItem key={g} value={`g:${g}`}>
                {g.charAt(0).toUpperCase() + g.slice(1)}
              </UiSelectItem>
            ))}
          </UiSelectGroup>
          <UiSelectGroup>
            <UiSelectGroupLabel>Shelf</UiSelectGroupLabel>
            {MOVIE_CATEGORIES.map((c) => (
              <UiSelectItem key={c.value} value={`c:${c.value}`}>
                {c.label}
              </UiSelectItem>
            ))}
          </UiSelectGroup>
        </UiSelect>

        <UiSelect
          value={sort}
          onValueChange={(v) => setSort(v as SortOption)}
          disabled={disabled}
          placeholder="Sort"
          id="catalog-sort"
          aria-label="Sort results"
          triggerClassName="min-w-[10.5rem] flex-1 sm:flex-initial"
        >
          <UiSelectItem value="newest">Sort: Newest</UiSelectItem>
          <UiSelectItem value="rating_desc">Sort: Rating</UiSelectItem>
          <UiSelectItem value="year_desc">Sort: Year</UiSelectItem>
          <UiSelectItem value="title_asc">Sort: Title A–Z</UiSelectItem>
        </UiSelect>

        {hasTextOrFilter ? (
          <Button
            type="button"
            variant="outline"
            disabled={disabled}
            onClick={() => clearFilters()}
            className="shrink-0"
          >
            Clear
          </Button>
        ) : null}
      </div>
    </div>
  );
}
