"use client";

import { create } from "zustand";

export type SortOption = "newest" | "title_asc" | "rating_desc" | "year_desc";

export type MovieFiltersState = {
  search: string;
  genre: string;
  sort: SortOption;
  page: number;
  pageSize: number;
  setSearch: (v: string) => void;
  setGenre: (v: string) => void;
  setSort: (v: SortOption) => void;
  setPage: (v: number) => void;
  setPageSize: (v: number) => void;
  resetPage: () => void;
  hydrateFromServer: (
    partial: Partial<
      Pick<MovieFiltersState, "search" | "genre" | "sort" | "page" | "pageSize">
    >,
  ) => void;
};

const defaultState = {
  search: "",
  genre: "",
  sort: "newest" as SortOption,
  page: 1,
  pageSize: 12,
};

export const useMovieFilters = create<MovieFiltersState>((set) => ({
  ...defaultState,
  setSearch: (search) => set({ search, page: 1 }),
  setGenre: (genre) => set({ genre, page: 1 }),
  setSort: (sort) => set({ sort, page: 1 }),
  setPage: (page) => set({ page }),
  setPageSize: (pageSize) => set({ pageSize, page: 1 }),
  resetPage: () => set({ page: 1 }),
  hydrateFromServer: (partial) => set((s) => ({ ...s, ...partial })),
}));
