"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import {
  createSupabaseServer,
  createSupabaseServerOptional,
} from "@/lib/supabase/server";
import {
  GENRE_OPTIONS,
  MOVIE_CATEGORIES,
  type MovieCategory,
  type MovieListResult,
  type MovieRow,
} from "@/types/movie";

export type ListMoviesInput = {
  search?: string;
  genre?: string;
  category?: string;
  sort?: "newest" | "title_asc" | "rating_desc" | "year_desc";
  page?: number;
  pageSize?: number;
};

function mapSort(sort: ListMoviesInput["sort"]) {
  switch (sort) {
    case "title_asc":
      return { column: "title" as const, ascending: true };
    case "rating_desc":
      return { column: "rating" as const, ascending: false };
    case "year_desc":
      return { column: "release_year" as const, ascending: false };
    case "newest":
    default:
      return { column: "created_at" as const, ascending: false };
  }
}

export async function listMovies(
  input: ListMoviesInput = {},
): Promise<MovieListResult> {
  const page = Math.max(1, input.page ?? 1);
  const pageSize = Math.min(48, Math.max(1, input.pageSize ?? 12));
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  const supabase = createSupabaseServerOptional();
  if (!supabase) {
    return { movies: [], total: 0, page, pageSize, totalPages: 1 };
  }

  let query = supabase.from("movies").select("*", { count: "exact" });

  const q = input.search?.trim();
  if (q) {
    const safe = q.replace(/%/g, "").replace(/,/g, "").slice(0, 200);
    if (safe.length > 0) {
      const p = `%${safe}%`;
      query = query.or(
        `title.ilike.${p},overview.ilike.${p},review_text.ilike.${p}`,
      );
    }
  }

  if (input.genre?.trim()) {
    query = query.contains("genres", [input.genre.trim().toLowerCase()]);
  }

  if (input.category?.trim()) {
    query = query.eq("category", input.category.trim());
  }

  const { column, ascending } = mapSort(input.sort);
  query = query.order(column, { ascending, nullsFirst: false });

  const { data, error, count } = await query.range(from, to);

  if (error) throw new Error(error.message);

  const total = count ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / pageSize));

  return {
    movies: (data ?? []) as MovieRow[],
    total,
    page,
    pageSize,
    totalPages,
  };
}

export async function getMovieById(id: string): Promise<MovieRow | null> {
  const supabase = createSupabaseServerOptional();
  if (!supabase) return null;
  const { data, error } = await supabase
    .from("movies")
    .select("*")
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return (data as MovieRow) ?? null;
}

export type MoviePayload = {
  title: string;
  overview?: string;
  poster_url?: string;
  release_year?: number | null;
  genres: string[];
  category: MovieCategory;
  rating?: number | null;
  review_text?: string;
  runtime_minutes?: number | null;
};

export async function createMovie(payload: MoviePayload): Promise<string> {
  const supabase = createSupabaseServer();
  const { data, error } = await supabase
    .from("movies")
    .insert({
      title: payload.title,
      overview: payload.overview ?? "",
      poster_url: payload.poster_url ?? "",
      release_year: payload.release_year ?? null,
      genres: payload.genres.map((g) => g.toLowerCase()),
      category: payload.category,
      rating: payload.rating ?? null,
      review_text: payload.review_text ?? "",
      runtime_minutes: payload.runtime_minutes ?? null,
    })
    .select("id")
    .single();

  if (error) throw new Error(error.message);
  revalidatePath("/");
  return data.id as string;
}

export async function updateMovie(id: string, payload: MoviePayload) {
  const supabase = createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      title: payload.title,
      overview: payload.overview ?? "",
      poster_url: payload.poster_url ?? "",
      release_year: payload.release_year ?? null,
      genres: payload.genres.map((g) => g.toLowerCase()),
      category: payload.category,
      rating: payload.rating ?? null,
      review_text: payload.review_text ?? "",
      runtime_minutes: payload.runtime_minutes ?? null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id);

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath(`/movies/${id}`);
}

export async function deleteMovie(id: string) {
  const supabase = createSupabaseServer();
  const { error } = await supabase.from("movies").delete().eq("id", id);
  if (error) throw new Error(error.message);
  revalidatePath("/");
}

export type MovieFormState = {
  error?: string;
};

function parseMovieFormData(formData: FormData): MoviePayload {
  const title = String(formData.get("title") ?? "").trim();
  if (!title) throw new Error("Title is required");

  const overview = String(formData.get("overview") ?? "");
  const poster_url = String(formData.get("poster_url") ?? "");
  const review_text = String(formData.get("review_text") ?? "");

  const release_year_raw = String(formData.get("release_year") ?? "").trim();
  const release_year = release_year_raw ? Number(release_year_raw) : null;

  const runtime_raw = String(formData.get("runtime_minutes") ?? "").trim();
  const runtime_minutes = runtime_raw ? Number(runtime_raw) : null;

  const rating_raw = String(formData.get("rating") ?? "").trim();
  const rating = rating_raw ? Number(rating_raw) : null;

  const categoryRaw = String(formData.get("category") ?? "trending");
  const categoryOk = MOVIE_CATEGORIES.some((c) => c.value === categoryRaw);
  if (!categoryOk) throw new Error("Invalid category");

  const genres = GENRE_OPTIONS.filter(
    (g) => formData.get(`genre_${g}`) === "on",
  ).map((g) => g);

  return {
    title,
    overview,
    poster_url,
    release_year: Number.isFinite(release_year) ? release_year : null,
    runtime_minutes: Number.isFinite(runtime_minutes) ? runtime_minutes : null,
    rating:
      rating != null && Number.isFinite(rating)
        ? Math.min(10, Math.max(0, rating))
        : null,
    review_text,
    category: categoryRaw as MovieCategory,
    genres,
  };
}

export async function createMovieFromForm(
  _prev: MovieFormState,
  formData: FormData,
): Promise<MovieFormState> {
  let payload: MoviePayload;
  try {
    payload = parseMovieFormData(formData);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Invalid form",
    };
  }

  let id: string;
  try {
    id = await createMovie(payload);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Could not create movie",
    };
  }

  redirect(`/movies/${id}`);
}

export async function updateMovieFromForm(
  _prev: MovieFormState,
  formData: FormData,
): Promise<MovieFormState> {
  const id = String(formData.get("id") ?? "").trim();
  if (!id) return { error: "Missing movie id" };

  let payload: MoviePayload;
  try {
    payload = parseMovieFormData(formData);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Invalid form",
    };
  }

  try {
    await updateMovie(id, payload);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Could not update movie",
    };
  }

  redirect(`/movies/${id}`);
}

export async function deleteMovieFormAction(formData: FormData) {
  const id = String(formData.get("id") ?? "").trim();
  if (!id) throw new Error("Missing movie id");
  await deleteMovie(id);
  redirect("/");
}
