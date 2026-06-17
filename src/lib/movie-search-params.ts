import {
  GENRE_OPTIONS,
} from "@/types/movie";
import {
  type CatalogueSortOption,
  isCatalogueSortOption,
} from "@/types/catalogue-sort";

export type MovieListInitialQuery = {
  search: string;
  genre: string;
  sort: CatalogueSortOption;
  page: number;
  pageSize: number;
};

const GENRE_SET = new Set<string>([...GENRE_OPTIONS]);

function parseSort(v: string | null): CatalogueSortOption {
  if (isCatalogueSortOption(v)) return v;
  /* Legacy ?sort=newest bookmarks → default sort */
  return "title_asc";
}

function firstToken(sp: URLSearchParams, key: string): string | null {
  for (const raw of sp.getAll(key)) {
    for (const part of raw.split(",")) {
      const t = part.trim().toLowerCase();
      if (t) return t;
    }
  }
  return null;
}

export function buildInitialQueryFromSearchParams(
  sp: URLSearchParams,
): MovieListInitialQuery {
  const genreRaw = firstToken(sp, "genre");
  const genre = genreRaw && GENRE_SET.has(genreRaw) ? genreRaw : "";

  const pageRaw = sp.get("page");
  const pageSizeRaw = sp.get("pageSize");

  return {
    search: sp.get("q") ?? "",
    genre,
    sort: parseSort(sp.get("sort")),
    page: Math.max(1, Number(pageRaw) || 1),
    pageSize: Math.min(48, Math.max(1, Number(pageSizeRaw) || 15)),
  };
}
