import type { MovieApprovalStatus, MovieCategory } from "@/types/movie";

export type SeriesStatus = "ongoing" | "ended" | "cancelled" | "upcoming";

export type SeriesRow = {
  id: string;
  title: string;
  overview: string | null;
  poster_url: string | null;
  start_date: string | null;
  end_date: string | null;
  start_year: number | null;
  end_year: number | null;
  genres: string[];
  category: string;
  rating: number | null;
  review_text: string | null;
  /** Average episode length in minutes. */
  runtime_minutes: number | null;
  season_count: number | null;
  episode_count: number | null;
  director: string | null;
  creator: string | null;
  language: string | null;
  network: string | null;
  watch_provider?: string | null;
  status: SeriesStatus;
  created_at: string;
  updated_at: string;
  approval_status?: MovieApprovalStatus;
  approved_by?: string | null;
  created_by?: string | null;
};

export const SERIES_STATUSES: { value: SeriesStatus; label: string }[] = [
  { value: "ongoing", label: "Ongoing" },
  { value: "ended", label: "Ended" },
  { value: "cancelled", label: "Cancelled" },
  { value: "upcoming", label: "Upcoming" },
];

/** Reuse movie browse tabs until series-specific categories are needed. */
export type SeriesCategory = MovieCategory;

export type SeriesListResult = {
  series: SeriesRow[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
};
