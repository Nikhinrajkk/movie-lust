import type { MoviePayload } from "@/app/actions/movies";
import type { MovieCategory } from "@/types/movie";
import { GENRE_OPTIONS, MOVIE_CATEGORIES } from "@/types/movie";

const CATEGORY_SET = new Set<string>(
  MOVIE_CATEGORIES.map((c) => c.value as string),
);

const GENRE_SET = new Set<string>([...GENRE_OPTIONS]);

/** Example document for the “Paste JSON” importer (kept in sync with the parser). */
export const MOVIE_JSON_FORMAT_EXAMPLE = `{
  "title": "Inception",
  "director": "Christopher Nolan",
  "overview": "A thief who steals secrets through shared dreams is offered a chance at redemption.",
  "poster_url": "https://upload.wikimedia.org/wikipedia/en/7/7f/Inception_ver3.jpg",
  "release_year": 2010,
  "runtime_minutes": 148,
  "rating": 8.8,
  "review_text": "Layered, propulsive, and worth rewatching.",
  "category": "trending",
  "genres": ["sci-fi", "thriller", "action"]
}`;

function asOptionalString(v: unknown): string | undefined {
  if (v == null) return undefined;
  if (typeof v !== "string") return String(v);
  return v;
}

function asOptionalNumber(v: unknown): number | null | undefined {
  if (v === undefined) return undefined;
  if (v === null) return null;
  if (typeof v === "number" && Number.isFinite(v)) return v;
  if (typeof v === "string" && v.trim() === "") return null;
  if (typeof v === "string" && v.trim() !== "") {
    const n = Number(v);
    return Number.isFinite(n) ? n : undefined;
  }
  return undefined;
}

/**
 * Parses and validates a JSON string into {@link MoviePayload}.
 * Required: `title`. Optional: `director`, `overview`, `poster_url`, `release_year`,
 * `runtime_minutes`, `rating` (0–10), `review_text`, `category` (shelf),
 * `genres` (array of known genre slugs).
 */
export function parseMoviePayloadFromJson(raw: string): MoviePayload {
  let parsed: unknown;
  try {
    parsed = JSON.parse(raw);
  } catch {
    throw new Error("Invalid JSON — check syntax, commas, and double quotes.");
  }

  if (parsed === null || typeof parsed !== "object" || Array.isArray(parsed)) {
    throw new Error("JSON must be a single object, not an array.");
  }

  const o = parsed as Record<string, unknown>;

  const title = String(o.title ?? "").trim();
  if (!title) {
    throw new Error('Missing or empty required field "title".');
  }

  const categoryRaw = String(o.category ?? "trending").trim() as MovieCategory;
  if (!CATEGORY_SET.has(categoryRaw)) {
    const allowed = [...CATEGORY_SET].join(", ");
    throw new Error(
      `Invalid "category". Use one of: ${allowed}.`,
    );
  }

  const genresRaw = o.genres;
  if (genresRaw != null && !Array.isArray(genresRaw)) {
    throw new Error('Field "genres" must be an array of strings.');
  }
  const genres: string[] = [];
  if (Array.isArray(genresRaw)) {
    for (const g of genresRaw) {
      const slug = String(g ?? "")
        .trim()
        .toLowerCase();
      if (!slug) continue;
      if (!GENRE_SET.has(slug)) {
        throw new Error(
          `Unknown genre "${slug}". Allowed: ${GENRE_OPTIONS.join(", ")}.`,
        );
      }
      if (!genres.includes(slug)) genres.push(slug);
    }
  }

  const releaseYear = asOptionalNumber(o.release_year);
  const runtimeMinutes = asOptionalNumber(o.runtime_minutes);
  const ratingRaw = asOptionalNumber(o.rating);
  let rating: number | null = null;
  if (ratingRaw !== undefined && ratingRaw !== null && Number.isFinite(ratingRaw)) {
    rating = Math.min(10, Math.max(0, ratingRaw));
  }

  return {
    title,
    director: asOptionalString(o.director)?.trim() || undefined,
    overview: asOptionalString(o.overview) ?? "",
    poster_url: asOptionalString(o.poster_url) ?? "",
    release_year:
      releaseYear === undefined || releaseYear === null
        ? null
        : Number.isFinite(releaseYear)
          ? Math.round(releaseYear)
          : null,
    runtime_minutes:
      runtimeMinutes === undefined || runtimeMinutes === null
        ? null
        : Number.isFinite(runtimeMinutes)
          ? Math.round(runtimeMinutes)
          : null,
    rating,
    review_text: asOptionalString(o.review_text) ?? "",
    category: categoryRaw,
    genres,
  };
}
