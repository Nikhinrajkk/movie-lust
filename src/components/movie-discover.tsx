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
import type { MovieListInitialQuery } from "@/lib/movie-search-params";
import { useMovieFilters } from "@/stores/movie-filters";
import type { MovieListResult } from "@/types/movie";
import { CinemaLoadingLayer } from "./cinema-loader";
import { MovieCard } from "./movie-card";
import { MovieFilters } from "./movie-filters";
import { MoviePagination } from "./movie-pagination";
import { SetupCallout } from "./setup-callout";

export function MovieDiscover({
  initial,
  initialQuery,
  supabaseReady,
  watchlistEnabled,
  watchlistMovieIds,
}: {
  initial: MovieListResult;
  initialQuery: MovieListInitialQuery;
  supabaseReady: boolean;
  watchlistEnabled: boolean;
  watchlistMovieIds: string[];
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

  const watchlistSet = useMemo(
    () => new Set(watchlistMovieIds),
    [watchlistMovieIds],
  );

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
    if (category.trim()) params.set("cat", category.trim());
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

      <div className="space-y-5">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <h1 className="text-2xl font-bold tracking-tight text-zinc-50 sm:text-3xl">
              What are you in the mood for?
            </h1>
            <p className="mt-1 text-sm text-zinc-400">
              Search, narrow by genre or shelf, then sort the grid.
            </p>
          </div>
          {supabaseReady && (
            <p className="shrink-0 text-xs text-zinc-500">
              {data.total === 0
                ? "No titles match."
                : `Showing ${data.movies.length} of ${data.total} films`}
            </p>
          )}
        </div>

        <MovieFilters disabled={!supabaseReady} busy={pending} />
      </div>

      {error && (
        <div className="rounded-xl border border-red-500/30 bg-red-500/10 px-4 py-3 text-sm text-red-200">
          {error}
        </div>
      )}

      <CinemaLoadingLayer active={pending && supabaseReady}>
        <>
          <div
            className={`grid grid-cols-2 gap-4 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 transition-opacity duration-200 ${pending && supabaseReady ? "opacity-50" : ""}`}
          >
            {data.movies.map((m) => (
              <MovieCard
                key={m.id}
                movie={m}
                watchlist={
                  watchlistEnabled
                    ? { enabled: true, inList: watchlistSet.has(m.id) }
                    : undefined
                }
              />
            ))}
          </div>

          {supabaseReady && data.total > 0 && (
            <MoviePagination
              page={data.page}
              totalPages={data.totalPages}
              disabled={pending}
            />
          )}
        </>
      </CinemaLoadingLayer>
    </div>
  );
}
