import { Suspense } from "react";
import { listMovies } from "@/app/actions/movies";
import { MovieDiscover } from "@/components/movie-discover";
import { isSupabaseConfigured } from "@/lib/config";
import { buildInitialQueryFromSearchParams } from "@/lib/movie-search-params";

function DiscoverFallback() {
  return (
    <div className="rounded-2xl border border-zinc-800 bg-zinc-900/40 p-10 text-center text-sm text-zinc-500">
      Loading filters and catalogue…
    </div>
  );
}

export default async function Home({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}) {
  const sp = await searchParams;
  const params = new URLSearchParams();
  for (const [key, value] of Object.entries(sp)) {
    if (value == null) continue;
    if (Array.isArray(value)) {
      if (value[0] != null) params.set(key, value[0]);
    } else {
      params.set(key, value);
    }
  }

  const initialQuery = buildInitialQueryFromSearchParams(params);
  const supabaseReady = isSupabaseConfigured();
  const initial = supabaseReady
    ? await listMovies({
        search: initialQuery.search,
        genre: initialQuery.genre,
        sort: initialQuery.sort,
        page: initialQuery.page,
        pageSize: initialQuery.pageSize,
      })
    : {
        movies: [],
        total: 0,
        page: 1,
        pageSize: initialQuery.pageSize,
        totalPages: 1,
      };

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
      <Suspense fallback={<DiscoverFallback />}>
        <MovieDiscover
          initial={initial}
          initialQuery={initialQuery}
          supabaseReady={supabaseReady}
        />
      </Suspense>
    </div>
  );
}
