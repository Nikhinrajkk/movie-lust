export type MovieCategory =
  | "now_showing"
  | "coming_soon"
  | "classic"
  | "trending";

export type MovieApprovalStatus = "approved" | "pending" | "rejected";

export type MovieRow = {
  id: string;
  title: string;
  overview: string | null;
  poster_url: string | null;
  release_year: number | null;
  genres: string[];
  category: string;
  rating: number | null;
  review_text: string | null;
  runtime_minutes: number | null;
  director: string | null;
  /** Original dialogue languages, e.g. "Spanish" or "Spanish, Catalan". */
  language: string | null;
  created_at: string;
  updated_at: string;
  approval_status?: MovieApprovalStatus;
  /** Set when an admin approves the submission (moderation). */
  approved_by?: string | null;
  created_by?: string | null;
};

export const MOVIE_CATEGORIES: { value: MovieCategory; label: string }[] = [
  { value: "now_showing", label: "Now Showing" },
  { value: "coming_soon", label: "Coming Soon" },
  { value: "classic", label: "Classics" },
  { value: "trending", label: "Trending" },
];

export const GENRE_OPTIONS = [
  "action",
  "adventure",
  "animation",
  "comedy",
  "crime",
  "drama",
  "fantasy",
  "feelgood",
  "horror",
  "investigation",
  "mystery",
  "romance",
  "sci-fi",
  "serial-killer",
  "thriller",
] as const;

export type GenreSlug = (typeof GENRE_OPTIONS)[number];

/** Human-readable genre for filters, forms, and chips (slugs stay URL-safe). */
export function formatGenreLabel(slug: string): string {
  const map: Partial<Record<GenreSlug, string>> = {
    "sci-fi": "Sci-Fi",
    "serial-killer": "Serial killer",
  };
  const asSlug = slug as GenreSlug;
  const mapped = map[asSlug];
  if (mapped) return mapped;
  if (!slug.includes("-")) {
    return slug.charAt(0).toUpperCase() + slug.slice(1);
  }
  return slug
    .split("-")
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(" ");
}

export type MovieListResult = {
  movies: MovieRow[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
};
