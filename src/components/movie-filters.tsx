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

export function MovieFilters({
  disabled,
  busy,
}: {
  disabled?: boolean;
  /** Results are refreshing — disable controls that would blur search if toggled mid-typing. */
  busy?: boolean;
}) {
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
    <div className="flex min-w-0 flex-col gap-3 sm:flex-row sm:flex-wrap sm:items-center sm:gap-3">
      <div className="relative min-w-0 w-full sm:min-w-[10rem] sm:flex-1 sm:basis-[min(100%,18rem)]">
        <FieldLabel htmlFor="catalog-search" className="sr-only">
          Search catalogue
        </FieldLabel>
        <span
          className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"
          aria-hidden
        >
          <svg
            className="size-4"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2}
            aria-hidden="true"
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
          placeholder="Search…"
          className="box-border h-10 w-full min-w-0 rounded-lg border border-gray-300 bg-white py-0 pl-9 pr-3 text-sm font-medium leading-10 text-gray-900 outline-none transition placeholder:text-gray-400 focus:border-[var(--bms-red)] focus:ring-2 focus:ring-[var(--bms-red)]/20 disabled:opacity-50"
        />
      </div>

      <div className="grid min-w-0 grid-cols-2 gap-2 sm:flex sm:flex-1 sm:flex-nowrap sm:items-center sm:gap-3 sm:[&>*]:min-w-0">
      <UiSelect
        value={filterValue}
        onValueChange={onFilterChange}
        disabled={disabled || busy}
        placeholder="Filter"
        id="catalog-filter"
        aria-label="Filter catalogue"
        triggerClassName="w-full min-w-0 rounded-lg sm:w-[12.5rem] sm:shrink-0"
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
        disabled={disabled || busy}
        placeholder="Sort"
        id="catalog-sort"
        aria-label="Sort results"
        triggerClassName="w-full min-w-0 rounded-lg sm:w-[10.75rem] sm:shrink-0"
      >
        <UiSelectItem value="title_asc">Sort: Title A–Z</UiSelectItem>
        <UiSelectItem value="newest">Sort: Newest</UiSelectItem>
        <UiSelectItem value="rating_desc">Sort: Rating</UiSelectItem>
        <UiSelectItem value="year_desc">Sort: Year</UiSelectItem>
      </UiSelect>

      {hasTextOrFilter ? (
        <Button
          type="button"
          variant="outline"
          disabled={disabled || busy}
          onClick={() => clearFilters()}
          className="col-span-2 box-border h-10 min-h-10 w-full shrink-0 px-3 py-0 leading-none sm:col-span-1 sm:w-auto"
        >
          Clear
        </Button>
      ) : null}
      </div>
    </div>
  );
}
