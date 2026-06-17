"use client";

import { useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { listSeries } from "@/app/actions/series";
import type { MovieListInitialQuery } from "@/lib/movie-search-params";
import { searchQueryStringsEqual } from "@/lib/url-search-compare";
import { useScrollToTopAfterLoad } from "@/lib/use-scroll-to-top-on-change";
import { useMovieFilters } from "@/stores/movie-filters";
import type { SeriesListResult } from "@/types/series";
import { CinemaLoadingLayer } from "./cinema-loader";
import { CatalogueAddButton } from "./catalogue-add-button";
import { MovieFilters } from "./movie-filters";
import { MoviePagination } from "./movie-pagination";
import { SeriesCard } from "./series-card";
import { SetupCallout } from "./setup-callout";

export function SeriesDiscover({
  initial,
  initialQuery,
  supabaseReady,
}: {
  initial: SeriesListResult;
  initialQuery: MovieListInitialQuery;
  supabaseReady: boolean;
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

  const [data, setData] = useState<SeriesListResult>(initial);
  const [listLoading, setListLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const initialRef = useRef(initial);
  const initialQueryRef = useRef(initialQuery);

  const {
    search: iqSearch,
    genre: iqGenre,
    sort: iqSort,
    page: iqPage,
    pageSize: iqPageSize,
  } = initialQuery;

  const urlSearchSnapshot = urlSearchParams.toString();
  const urlSearchSnapshotRef = useRef(urlSearchSnapshot);

  const justHydratedRef = useRef(false);

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

  useScrollToTopAfterLoad(listLoading, `${page}-${pageSize}`);

  useLayoutEffect(() => {
    initialRef.current = initial;
    initialQueryRef.current = initialQuery;
    urlSearchSnapshotRef.current = urlSearchSnapshot;
  });

  useLayoutEffect(() => {
    justHydratedRef.current = true;
    hydrateFromServer({
      search: iqSearch,
      genre: iqGenre,
      sort: iqSort,
      page: iqPage,
      pageSize: iqPageSize,
    });
  }, [hydrateFromServer, iqSearch, iqGenre, iqSort, iqPage, iqPageSize]);

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
    void listSeries(queryForList)
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
    if (justHydratedRef.current) {
      justHydratedRef.current = false;
      return;
    }

    const params = new URLSearchParams();
    if (search.trim()) params.set("q", search.trim());
    if (genre.trim()) params.set("genre", genre.trim());
    if (sort !== "title_asc") params.set("sort", sort);
    if (page > 1) params.set("page", String(page));
    if (pageSize !== 15) params.set("pageSize", String(pageSize));

    const next = params.toString();
    const cur = urlSearchSnapshotRef.current;
    if (searchQueryStringsEqual(next, cur)) return;

    router.replace(next ? `${pathname}?${next}` : pathname, { scroll: false });
  }, [genre, page, pageSize, pathname, router, search, sort]);

  return (
    <div id="catalogue-top" className="space-y-6">
      {!supabaseReady && <SetupCallout />}

      <div className="space-y-4">
        <div className="space-y-1">
          <div className="flex items-center justify-between gap-3">
            <h1 className="app-page-title text-xl font-bold tracking-tight sm:text-2xl md:text-[1.65rem]">
              Series
            </h1>
            <CatalogueAddButton kind="series" />
          </div>
          <div className="flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
            <p className="app-page-sub text-sm">
              Explore TV series — search, pick a genre, then sort.
            </p>
            {supabaseReady && (
              <p className="shrink-0 text-xs font-medium leading-snug text-[var(--md-text-muted)] sm:text-right">
                {data.total === 0
                  ? "No titles match."
                  : `${data.series.length} of ${data.total} series`}
              </p>
            )}
          </div>
        </div>

        <div className="app-panel p-3 sm:p-4">
          <MovieFilters disabled={!supabaseReady} busy={listLoading} />
        </div>
      </div>

      {error && (
        <div className="mdc-moderation-rejected rounded-xl px-4 py-3 text-sm">
          {error}
        </div>
      )}

      <CinemaLoadingLayer active={listLoading && supabaseReady}>
        <>
          <div
            key={`catalogue-page-${data.page}-${pageSize}-${search}-${genre}-${sort}`}
            className={`paginated-list-enter grid min-w-0 grid-cols-2 gap-2 sm:grid-cols-3 sm:gap-3 md:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 ${listLoading && supabaseReady ? "opacity-50 transition-opacity duration-200" : ""}`}
          >
            {data.series.map((s, index) => (
              <div
                key={s.id}
                className="paginated-item-enter min-w-0"
                style={{ animationDelay: `${Math.min(index, 14) * 35}ms` }}
              >
                <SeriesCard series={s} />
              </div>
            ))}
          </div>

          {supabaseReady && data.total > 0 && (
            <MoviePagination
              page={data.page}
              totalPages={data.totalPages}
              total={data.total}
              disabled={listLoading}
              itemSingular="series"
              itemPlural="series"
            />
          )}
        </>
      </CinemaLoadingLayer>
    </div>
  );
}
