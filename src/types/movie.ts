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
  /** OTT / streaming slug; see {@link WATCH_PROVIDERS}. Omitted on older rows until migration. */
  watch_provider?: string | null;
  created_at: string;
  updated_at: string;
  approval_status?: MovieApprovalStatus;
  /** Set when an admin approves the submission (moderation). */
  approved_by?: string | null;
  created_by?: string | null;
};

/** Curated streaming options (slug stored in `movies.watch_provider`). Logos render in the UI. */
export const WATCH_PROVIDERS = [
  { slug: "netflix", label: "Netflix" },
  { slug: "primevideo", label: "Prime Video" },
  { slug: "disneyplus", label: "Disney+" },
  { slug: "hulu", label: "Hulu" },
  { slug: "appletv", label: "Apple TV+" },
  { slug: "max", label: "Max" },
  { slug: "paramountplus", label: "Paramount+" },
  { slug: "youtube", label: "YouTube" },
  { slug: "crunchyroll", label: "Crunchyroll" },
  { slug: "tubi", label: "Tubi" },
  { slug: "mubi", label: "MUBI" },
] as const;

export type WatchProviderSlug = (typeof WATCH_PROVIDERS)[number]["slug"];

const WATCH_PROVIDER_BY_SLUG = Object.fromEntries(
  WATCH_PROVIDERS.map((p) => [p.slug, p]),
) as Record<WatchProviderSlug, (typeof WATCH_PROVIDERS)[number]>;

export const WATCH_PROVIDER_SLUG_SET = new Set<string>(
  WATCH_PROVIDERS.map((p) => p.slug),
);

export function getWatchProviderBySlug(
  slug: string | null | undefined,
): (typeof WATCH_PROVIDERS)[number] | null {
  if (!slug || typeof slug !== "string") return null;
  const key = slug.trim().toLowerCase() as WatchProviderSlug;
  return WATCH_PROVIDER_BY_SLUG[key] ?? null;
}

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
  "neo-noir",
  "drama",
  "fantasy",
  "feelgood",
  "gothic",
  "horror",
  "bloodshed",
  "body-horror",
  "investigation",
  "mystery",
  "psychological",
  "mind-fuck",
  "romance",
  "sci-fi",
  "serial-killer",
  "thriller",
  /** Common catalogue / TMDB-style genres beyond the core set above */
  "biography",
  "documentary",
  "family",
  "history",
  "musical",
  "music",
  "sports",
  "superhero",
  "tv-movie",
  "war",
  "western",
] as const;

export type GenreSlug = (typeof GENRE_OPTIONS)[number];

/** Human-readable genre for filters, forms, and chips (slugs stay URL-safe). */
export function formatGenreLabel(slug: string): string {
  const map: Partial<Record<GenreSlug, string>> = {
    "sci-fi": "Sci-Fi",
    "serial-killer": "Serial Killer",
    "tv-movie": "TV Movie",
    "body-horror": "Body horror",
    "neo-noir": "Neo Noir",
    "mind-fuck": "Mind Fuck",
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
