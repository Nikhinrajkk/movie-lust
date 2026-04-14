export type MovieCategory =
  | "now_showing"
  | "coming_soon"
  | "classic"
  | "trending";

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
  created_at: string;
  updated_at: string;
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
  "horror",
  "romance",
  "sci-fi",
  "thriller",
] as const;

export type MovieListResult = {
  movies: MovieRow[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
};
