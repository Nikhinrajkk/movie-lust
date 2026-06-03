"use client";

import { useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { listMovies } from "@/app/actions/movies";
import type { MovieListInitialQuery } from "@/lib/movie-search-params";
import { searchQueryStringsEqual } from "@/lib/url-search-compare";
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
  watchedMovieIds,
}: {
  initial: MovieListResult;
  initialQuery: MovieListInitialQuery;
  supabaseReady: boolean;
  watchlistEnabled: boolean;
  watchlistMovieIds: string[];
  watchedMovieIds: string[];
}) {
  const router = useRouter();
  const pathname = usePathname();
  const urlSearchParams = useSearchParams();

  const hydrateFromServer = useMovieFilters((s) => s.hydrateFromServer);
  const search = useMovieFilters((s) => s.search);
  const genre = useMovieFilters((s) => s.genre);
  const sort = useMovieFilters((s) => s.sort);
  const page = useMovieFilters((s) => s.page);
  const pageSize = useMovieFilters((s) => s.pageSize);

  const [data, setData] = useState<MovieListResult>(initial);
  const [listLoading, setListLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const initialRef = useRef(initial);
  const initialQueryRef = useRef(initialQuery);

  const urlSearchSnapshot = urlSearchParams.toString();

  const watchlistSet = useMemo(
    () => new Set(watchlistMovieIds),
    [watchlistMovieIds],
  );

  const watchedSet = useMemo(
    () => new Set(watchedMovieIds),
    [watchedMovieIds],
  );

  const queryForList = useMemo(
    () => ({
      search,
      genre,
      sort,
      page,
      pageSize,
    }),
    [search, genre, sort, page, pageSize],
  );

  useLayoutEffect(() => {
    initialRef.current = initial;
    initialQueryRef.current = initialQuery;
    hydrateFromServer({
      search: initialQuery.search,
      genre: initialQuery.genre,
      sort: initialQuery.sort,
      page: initialQuery.page,
      pageSize: initialQuery.pageSize,
    });
  }, [hydrateFromServer, initial, initialQuery]);

  useEffect(() => {
    if (!supabaseReady) return;

    const iq = initialQueryRef.current;
    const sameAsServerPayload =
      queryForList.search === iq.search &&
      queryForList.genre === iq.genre &&
      queryForList.sort === iq.sort &&
      queryForList.page === iq.page &&
      queryForList.pageSize === iq.pageSize;

    if (sameAsServerPayload) {
      setData(initialRef.current);
      setListLoading(false);
      setError(null);
      return;
    }

    let cancelled = false;
    setListLoading(true);
    setError(null);
    void listMovies(queryForList)
      .then((result) => {
        if (!cancelled) setData(result);
      })
      .catch((e: unknown) => {
        if (!cancelled) {
          setError(e instanceof Error ? e.message : "Something went wrong");
        }
      })
      .finally(() => {
        if (!cancelled) setListLoading(false);
      });
    return () => {
      cancelled = true;
      setListLoading(false);
    };
  }, [queryForList, supabaseReady]);

  useEffect(() => {
    const params = new URLSearchParams();
    if (search.trim()) params.set("q", search.trim());
    if (genre.trim()) params.set("genre", genre.trim());
    if (sort !== "title_asc") params.set("sort", sort);
    if (page > 1) params.set("page", String(page));
    if (pageSize !== 15) params.set("pageSize", String(pageSize));

    const next = params.toString();
    const cur = urlSearchSnapshot;
    if (searchQueryStringsEqual(next, cur)) return;

    router.replace(next ? `${pathname}?${next}` : pathname, { scroll: false });
  }, [
    genre,
    page,
    pageSize,
    pathname,
    router,
    search,
    sort,
    urlSearchSnapshot,
  ]);

  return (
    <div className="space-y-6">
      {!supabaseReady && <SetupCallout />}

      <div className="space-y-4">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <h1 className="text-xl font-bold tracking-tight text-gray-900 sm:text-2xl md:text-[1.65rem]">
              Movies
            </h1>
            <p className="mt-0.5 text-sm text-gray-500">
              Explore titles — search, pick a genre, then sort.
            </p>
          </div>
          {supabaseReady && (
            <p className="shrink-0 text-right text-xs font-medium leading-snug text-gray-500 sm:text-left">
              {data.total === 0
                ? "No titles match."
                : `${data.movies.length} of ${data.total} films`}
            </p>
          )}
        </div>

        <div className="rounded-2xl border border-gray-200 bg-white p-3 shadow-sm sm:p-4">
          <MovieFilters disabled={!supabaseReady} busy={listLoading} />
        </div>
      </div>

      {error && (
        <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800">
          {error}
        </div>
      )}

      <CinemaLoadingLayer active={listLoading && supabaseReady}>
        <>
          <div
            className={`grid min-w-0 grid-cols-2 gap-2 transition-opacity duration-200 sm:grid-cols-3 sm:gap-3 md:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 ${listLoading && supabaseReady ? "opacity-50" : ""}`}
          >
            {data.movies.map((m) => {
              const approved =
                (m.approval_status ?? "approved") === "approved";
              const actions =
                watchlistEnabled && approved
                  ? {
                      watchlist: {
                        enabled: true,
                        inList: watchlistSet.has(m.id),
                      },
                      watched: {
                        enabled: true,
                        isWatched: watchedSet.has(m.id),
                      },
                    }
                  : undefined;
              return (
                <MovieCard key={m.id} movie={m} actions={actions} />
              );
            })}
          </div>

          {supabaseReady && data.total > 0 && (
            <MoviePagination
              page={data.page}
              totalPages={data.totalPages}
              disabled={listLoading}
            />
          )}
        </>
      </CinemaLoadingLayer>
    </div>
  );
}
