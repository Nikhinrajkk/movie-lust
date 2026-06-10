"use client";

import { useEffect, useState } from "react";
import { useMovieFilters } from "@/stores/movie-filters";
import type { SortOption } from "@/stores/movie-filters";
import { FieldLabel } from "@/components/ui/label";
import {
  UiSelect,
  UiSelectGroup,
  UiSelectGroupLabel,
  UiSelectItem,
} from "@/components/ui/select";
import { GENRE_OPTIONS, formatGenreLabel } from "@/types/movie";

const FILTER_ALL = "__all__";
const SEARCH_DEBOUNCE_MS = 320;

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
  const clearFilters = useMovieFilters((s) => s.clearFilters);
  const sort = useMovieFilters((s) => s.sort);
  const setSort = useMovieFilters((s) => s.setSort);

  const [draftSearch, setDraftSearch] = useState(search);

  useEffect(() => {
    setDraftSearch(search);
  }, [search]);

  useEffect(() => {
    const trimmed = draftSearch.trim();
    const applied = search.trim();
    if (trimmed === applied) return;
    const id = window.setTimeout(() => {
      setSearch(draftSearch.trim());
    }, SEARCH_DEBOUNCE_MS);
    return () => window.clearTimeout(id);
  }, [draftSearch, search, setSearch]);

  function flushSearchToStore() {
    const trimmed = draftSearch.trim();
    if (trimmed !== search.trim()) {
      setSearch(trimmed);
    }
  }

  const genreValue = genre ? `g:${genre}` : FILTER_ALL;

  function onGenreChange(raw: string) {
    if (raw === FILTER_ALL) {
      setGenre("");
      return;
    }
    if (raw.startsWith("g:")) {
      setGenre(raw.slice(2));
    }
  }

  const hasTextOrFilter =
    draftSearch.trim().length > 0 || Boolean(genre);

  return (
    <div className="grid min-w-0 items-center gap-x-2 gap-y-2 max-[650px]:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] min-[651px]:grid-cols-[minmax(0,1fr)_11.5rem_10.5rem] min-[651px]:gap-x-3 min-[651px]:gap-y-3">
      <div className="relative min-w-0 max-[650px]:col-span-2">
        <FieldLabel htmlFor="catalog-search" className="sr-only">
          Search catalogue
        </FieldLabel>
        <span
          className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-[var(--md-input-placeholder)]"
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
          value={draftSearch}
          onChange={(e) => setDraftSearch(e.target.value)}
          onBlur={flushSearchToStore}
          disabled={disabled}
          placeholder="Search…"
          className="box-border h-10 w-full min-w-0 rounded-lg border border-[var(--md-input-border)] bg-[var(--md-input-bg)] py-0 pl-9 pr-3 text-sm font-medium leading-10 text-[var(--md-input-fg)] outline-none transition placeholder:text-[var(--md-input-placeholder)] focus:border-[var(--md-gold)] focus:ring-2 focus:ring-[var(--md-gold-soft)] disabled:opacity-50"
        />
      </div>

      <UiSelect
        value={genreValue}
        onValueChange={onGenreChange}
        disabled={disabled || busy}
        placeholder="Genre"
        id="catalog-genre"
        aria-label="Filter by genre"
        triggerClassName="w-full min-w-0 max-w-full overflow-hidden text-ellipsis whitespace-nowrap rounded-lg px-3 text-sm"
      >
        <UiSelectItem value={FILTER_ALL}>All genres</UiSelectItem>
        <UiSelectGroup>
          <UiSelectGroupLabel>Genre</UiSelectGroupLabel>
          {GENRE_OPTIONS.map((g) => (
            <UiSelectItem key={g} value={`g:${g}`}>
              {formatGenreLabel(g)}
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
        triggerClassName="w-full min-w-0 max-w-full overflow-hidden text-ellipsis whitespace-nowrap rounded-lg px-3 text-sm"
      >
        <UiSelectItem value="title_asc">Sort: Title A–Z</UiSelectItem>
        <UiSelectItem value="rating_desc">Sort: Rating</UiSelectItem>
        <UiSelectItem value="year_desc">Sort: Year</UiSelectItem>
      </UiSelect>

      {hasTextOrFilter ? (
        <button
          type="button"
          disabled={disabled || busy}
          onClick={() => clearFilters()}
          className="col-span-2 box-border h-10 min-h-10 w-full rounded-lg border border-[var(--md-border)] bg-transparent px-3 py-0 text-sm font-medium leading-none text-[var(--md-text-muted)] transition hover:border-[var(--md-gold)]/50 hover:text-[var(--md-title)] disabled:cursor-not-allowed disabled:opacity-50 min-[651px]:col-span-3"
        >
          Clear
        </button>
      ) : null}
    </div>
  );
}
