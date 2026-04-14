"use client";

import {
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
  useTransition,
} from "react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { listMovies } from "@/app/actions/movies";
import { useMovieFilters } from "@/stores/movie-filters";
import type { MovieCategory, MovieListResult } from "@/types/movie";
import { MovieCard } from "./movie-card";
import { MovieFilters } from "./movie-filters";
import { MoviePagination } from "./movie-pagination";
import { SetupCallout } from "./setup-callout";

type InitialQuery = {
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

export function MovieDiscover({
  initial,
  initialQuery,
  supabaseReady,
}: {
  initial: MovieListResult;
  initialQuery: InitialQuery;
  supabaseReady: boolean;
}) {
  const router = useRouter();
  const pathname = usePathname();
  const urlSearchParams = useSearchParams();

  const hydrateFromServer = useMovieFilters((s) => s.hydrateFromServer);
  const search = useMovieFilters((s) => s.search);
  const genre = useMovieFilters((s) => s.genre);
  const category = useMovieFilters((s) => s.category);
  const sort = useMovieFilters((s) => s.sort);
  const page = useMovieFilters((s) => s.page);
  const pageSize = useMovieFilters((s) => s.pageSize);

  const [data, setData] = useState<MovieListResult>(initial);
  const [pending, start] = useTransition();
  const [error, setError] = useState<string | null>(null);

  const queryForList = useMemo(
    () => ({
      search,
      genre,
      category,
      sort,
      page,
      pageSize,
    }),
    [search, genre, category, sort, page, pageSize],
  );

  const initialQueryRef = useRef(initialQuery);
  useLayoutEffect(() => {
    hydrateFromServer(initialQueryRef.current);
  }, [hydrateFromServer]);

  useEffect(() => {
    if (!supabaseReady) return;
    start(() => {
      setError(null);
      listMovies(queryForList)
        .then(setData)
        .catch((e: unknown) => {
          setError(e instanceof Error ? e.message : "Something went wrong");
        });
    });
  }, [queryForList, supabaseReady]);

  useEffect(() => {
    const params = new URLSearchParams();
    if (search.trim()) params.set("q", search.trim());
    if (genre.trim()) params.set("genre", genre.trim());
    if (category) params.set("category", category);
    if (sort !== "newest") params.set("sort", sort);
    if (page > 1) params.set("page", String(page));
    if (pageSize !== 12) params.set("pageSize", String(pageSize));

    const next = params.toString();
    const cur = urlSearchParams?.toString() ?? "";
    if (next === cur) return;

    router.replace(next ? `${pathname}?${next}` : pathname, { scroll: false });
  }, [
    category,
    genre,
    page,
    pageSize,
    pathname,
    router,
    search,
    sort,
    urlSearchParams,
  ]);

  return (
    <div className="space-y-8">
      {!supabaseReady && <SetupCallout />}

      <div className="flex flex-col gap-6 lg:flex-row lg:items-start">
        <aside className="lg:w-72 lg:shrink-0">
          <MovieFilters disabled={!supabaseReady || pending} />
        </aside>
        <div className="min-w-0 flex-1 space-y-6">
          <div className="flex flex-col gap-2 sm:flex-row sm:items-end sm:justify-between">
            <div>
              <h1 className="text-2xl font-bold tracking-tight text-zinc-50 sm:text-3xl">
                What are you in the mood for?
              </h1>
              <p className="mt-1 text-sm text-zinc-400">
                Filter by genre and category, search your library, and paginate
                like a marquee listing.
              </p>
            </div>
            {supabaseReady && (
              <p className="text-xs text-zinc-500">
                {data.total === 0
                  ? "No titles match."
                  : `Showing ${data.movies.length} of ${data.total} films`}
              </p>
            )}
          </div>

          {error && (
            <div className="rounded-xl border border-red-500/30 bg-red-500/10 px-4 py-3 text-sm text-red-200">
              {error}
            </div>
          )}

          {pending && supabaseReady && (
            <p className="text-xs text-zinc-500">Updating results…</p>
          )}

          <div className="grid grid-cols-2 gap-4 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4">
            {data.movies.map((m) => (
              <MovieCard key={m.id} movie={m} />
            ))}
          </div>

          {supabaseReady && data.total > 0 && (
            <MoviePagination
              page={data.page}
              totalPages={data.totalPages}
              disabled={pending}
            />
          )}
        </div>
      </div>
    </div>
  );
}

export function buildInitialQueryFromSearchParams(
  sp: URLSearchParams | Record<string, string | string[] | undefined>,
): InitialQuery {
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
