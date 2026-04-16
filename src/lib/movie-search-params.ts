import {
  GENRE_OPTIONS,
  MOVIE_CATEGORIES,
  type MovieCategory,
} from "@/types/movie";

export type MovieListInitialQuery = {
  search: string;
  genre: string;
  category: MovieCategory | "";
  sort: "newest" | "title_asc" | "rating_desc" | "year_desc";
  page: number;
  pageSize: number;
};

const CATEGORY_SET = new Set<string>(
  MOVIE_CATEGORIES.map((c) => c.value),
);

const GENRE_SET = new Set<string>([...GENRE_OPTIONS]);

function parseSort(
  v: string | null,
): "newest" | "title_asc" | "rating_desc" | "year_desc" {
  if (
    v === "title_asc" ||
    v === "rating_desc" ||
    v === "year_desc" ||
    v === "newest"
  ) {
    return v;
  }
  return "newest";
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

  const catRaw = firstToken(sp, "cat");
  let category: MovieCategory | "" =
    catRaw && CATEGORY_SET.has(catRaw) ? (catRaw as MovieCategory) : "";
  if (genre && category) category = "";

  const pageRaw = sp.get("page");
  const pageSizeRaw = sp.get("pageSize");

  return {
    search: sp.get("q") ?? "",
    genre,
    category,
    sort: parseSort(sp.get("sort")),
    page: Math.max(1, Number(pageRaw) || 1),
    pageSize: Math.min(48, Math.max(1, Number(pageSizeRaw) || 12)),
  };
}
