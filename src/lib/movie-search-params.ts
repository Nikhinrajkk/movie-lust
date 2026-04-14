export type MovieListInitialQuery = {
  search: string;
  genre: string;
  sort: "newest" | "title_asc" | "rating_desc" | "year_desc";
  page: number;
  pageSize: number;
};

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
    sort: parseSort(get("sort")),
    page: Math.max(1, Number(pageRaw) || 1),
    pageSize: Math.min(48, Math.max(1, Number(pageSizeRaw) || 12)),
  };
}
