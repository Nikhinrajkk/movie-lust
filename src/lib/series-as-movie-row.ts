import type { MovieRow } from "@/types/movie";
import type { SeriesRow } from "@/types/series";

/** Map series fields onto {@link MovieRow} for shared detail/moderation UI. */
export function seriesAsMovieRow(series: SeriesRow): MovieRow {
  const creator = series.creator?.trim();
  const director = series.director?.trim();
  const directorLine =
    creator && director && creator !== director
      ? `${creator} · ${director}`
      : creator || director || "";

  return {
    id: series.id,
    title: series.title,
    overview: series.overview,
    poster_url: series.poster_url,
    release_year: series.start_year,
    genres: series.genres,
    category: series.category,
    rating: series.rating,
    review_text: series.review_text,
    runtime_minutes: null,
    director: directorLine,
    language: series.language,
    watch_provider: series.watch_provider,
    created_at: series.created_at,
    updated_at: series.updated_at,
    approval_status: series.approval_status,
    approved_by: series.approved_by,
    created_by: series.created_by,
  };
}
