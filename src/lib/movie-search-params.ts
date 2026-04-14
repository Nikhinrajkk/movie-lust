import type { MovieCategory } from "@/types/movie";

export type MovieListInitialQuery = {
  search: string;
  genre: string;
  category: MovieCategory | "";
  sort: "newest" | "title_asc" | "rating_desc" | "year_desc";
  page: number;
  pageSize: number;
};

function parseCategory(v: string | null): MovieCategory | "" {
  if (
    v === "now_showing" ||
    v === "coming_soon" ||
    v === "classic" ||
    v === "trending"
  ) {
    return v;
  }
  return "";
}

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

export function buildInitialQueryFromSearchParams(
  sp: URLSearchParams | Record<string, string | string[] | undefined>,
): MovieListInitialQuery {
  const get = (key: string) => {
    const raw = sp instanceof URLSearchParams ? sp.get(key) : sp[key];
    if (Array.isArray(raw)) return raw[0];
    return raw ?? null;
  };

  const pageRaw = get("page");
  const pageSizeRaw = get("pageSize");

  return {
    search: get("q") ?? "",
    genre: get("genre") ?? "",
    category: parseCategory(get("category")),
    sort: parseSort(get("sort")),
    page: Math.max(1, Number(pageRaw) || 1),
    pageSize: Math.min(48, Math.max(1, Number(pageSizeRaw) || 12)),
  };
}
