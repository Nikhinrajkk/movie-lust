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
    <div className="flex min-w-0 flex-nowrap items-center gap-2 overflow-x-auto pb-0.5 [-ms-overflow-style:none] [scrollbar-width:none] sm:gap-3 [&::-webkit-scrollbar]:hidden">
      <div className="relative min-w-[8rem] flex-1 basis-0">
        <FieldLabel htmlFor="catalog-search" className="sr-only">
          Search catalogue
        </FieldLabel>
        <span
          className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-zinc-500"
          aria-hidden
        >
          <svg
            className="size-4"
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
          placeholder="Search…"
          className="box-border h-10 w-full min-w-0 rounded-xl border border-zinc-700 bg-zinc-950 py-0 pl-9 pr-3 text-sm font-medium leading-10 text-zinc-100 outline-none ring-cyan-500/0 transition placeholder:text-zinc-600 focus:border-cyan-500/45 focus:ring-2 focus:ring-cyan-500/20 disabled:opacity-50"
        />
      </div>

      <UiSelect
        value={filterValue}
        onValueChange={onFilterChange}
        disabled={disabled}
        placeholder="Filter"
        id="catalog-filter"
        aria-label="Filter catalogue"
        triggerClassName="w-[10.25rem] shrink-0 sm:w-[12.5rem]"
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
        triggerClassName="w-[9.5rem] shrink-0 sm:w-[10.75rem]"
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
          className="box-border h-10 min-h-10 shrink-0 px-3 py-0 leading-none"
        >
          Clear
        </Button>
      ) : null}
    </div>
  );
}
