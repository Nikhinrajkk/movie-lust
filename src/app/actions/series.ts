"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import {
  isLikelyHtmlOrTransportBody,
  logSupabaseTransportFailure,
  sanitizeSupabaseErrorMessage,
} from "@/lib/supabase/errors";
import {
  createSupabaseServer,
  createSupabaseServerOptional,
} from "@/lib/supabase/server";
import {
  GENRE_OPTIONS,
  MOVIE_CATEGORIES,
  WATCH_PROVIDER_SLUG_SET,
  type MovieCategory,
} from "@/types/movie";
import type {
  SeriesListResult,
  SeriesRow,
  SeriesStatus,
} from "@/types/series";

export type ListSeriesInput = {
  search?: string;
  genre?: string;
  category?: string;
  sort?: "title_asc" | "rating_desc" | "year_desc";
  page?: number;
  pageSize?: number;
};

function mapSort(sort: ListSeriesInput["sort"]) {
  switch (sort) {
    case "title_asc":
      return { column: "title" as const, ascending: true };
    case "rating_desc":
      return { column: "rating" as const, ascending: false };
    case "year_desc":
      return { column: "start_year" as const, ascending: false };
    default:
      return { column: "title" as const, ascending: true };
  }
}

export async function listSeries(
  input: ListSeriesInput = {},
): Promise<SeriesListResult> {
  const page = Math.max(1, input.page ?? 1);
  const pageSize = Math.min(48, Math.max(1, input.pageSize ?? 15));
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  const supabase = await createSupabaseServerOptional();
  if (!supabase) {
    return { series: [], total: 0, page, pageSize, totalPages: 1 };
  }

  let query = supabase
    .from("series")
    .select("*", { count: "exact" })
    .eq("approval_status", "approved");

  const q = input.search?.trim();
  if (q) {
    const safe = q.replace(/%/g, "").replace(/,/g, "").slice(0, 200);
    if (safe.length > 0) {
      const p = `%${safe}%`;
      query = query.or(
        `title.ilike.${p},overview.ilike.${p},review_text.ilike.${p},director.ilike.${p},creator.ilike.${p},network.ilike.${p}`,
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
  query = query
    .order(column, { ascending, nullsFirst: false })
    .order("id", { ascending: false });

  const { data, error, count } = await query.range(from, to);

  if (error) {
    const raw = String(error.message ?? "");
    if (isLikelyHtmlOrTransportBody(raw)) {
      logSupabaseTransportFailure("listSeries");
      return { series: [], total: 0, page, pageSize, totalPages: 1 };
    }
    throw new Error(sanitizeSupabaseErrorMessage(error));
  }

  const total = count ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / pageSize));

  return {
    series: (data ?? []) as SeriesRow[],
    total,
    page,
    pageSize,
    totalPages,
  };
}

export async function getSeriesById(id: string): Promise<SeriesRow | null> {
  const supabase = await createSupabaseServerOptional();
  if (!supabase) return null;

  const { data, error } = await supabase
    .from("series")
    .select("*")
    .eq("id", id)
    .maybeSingle();

  if (error) {
    const raw = String(error.message ?? "");
    if (isLikelyHtmlOrTransportBody(raw)) {
      logSupabaseTransportFailure("getSeriesById");
      return null;
    }
    throw new Error(sanitizeSupabaseErrorMessage(error));
  }

  return (data as SeriesRow) ?? null;
}

export type SeriesPayload = {
  title: string;
  overview?: string;
  poster_url?: string;
  start_date?: string | null;
  end_date?: string | null;
  start_year?: number | null;
  end_year?: number | null;
  genres: string[];
  category: MovieCategory;
  rating?: number | null;
  review_text?: string;
  runtime_minutes?: number | null;
  season_count?: number | null;
  episode_count?: number | null;
  director?: string;
  creator?: string;
  language?: string;
  network?: string;
  watch_provider?: string | null;
  status?: SeriesStatus;
};

export type SeriesFormState = {
  error?: string;
};

function parseOptionalInt(raw: string): number | null {
  const trimmed = raw.trim();
  if (!trimmed) return null;
  const n = Number(trimmed);
  return Number.isFinite(n) ? n : null;
}

function parseOptionalDate(raw: string): string | null {
  const trimmed = raw.trim();
  if (!trimmed) return null;
  return trimmed;
}

function parseSeriesFormData(formData: FormData): SeriesPayload {
  const title = String(formData.get("title") ?? "").trim();
  if (!title) throw new Error("Title is required");

  const categoryRaw = String(formData.get("category") ?? "trending");
  const categoryOk = MOVIE_CATEGORIES.some((c) => c.value === categoryRaw);
  if (!categoryOk) throw new Error("Invalid category");

  const statusRaw = String(formData.get("status") ?? "ended");
  const statusOk = ["ongoing", "ended", "cancelled", "upcoming"].includes(
    statusRaw,
  );
  if (!statusOk) throw new Error("Invalid status");

  const ratingRaw = String(formData.get("rating") ?? "").trim();
  const rating = ratingRaw ? Number(ratingRaw) : null;

  const watchRaw = String(formData.get("watch_provider") ?? "").trim();
  const watch_provider =
    watchRaw.length > 0 && WATCH_PROVIDER_SLUG_SET.has(watchRaw)
      ? watchRaw
      : null;

  const genres = GENRE_OPTIONS.filter(
    (g) => formData.get(`genre_${g}`) === "on",
  ).map((g) => g);

  return {
    title,
    overview: String(formData.get("overview") ?? ""),
    poster_url: String(formData.get("poster_url") ?? ""),
    start_date: parseOptionalDate(String(formData.get("start_date") ?? "")),
    end_date: parseOptionalDate(String(formData.get("end_date") ?? "")),
    start_year: parseOptionalInt(String(formData.get("start_year") ?? "")),
    end_year: parseOptionalInt(String(formData.get("end_year") ?? "")),
    runtime_minutes: parseOptionalInt(
      String(formData.get("runtime_minutes") ?? ""),
    ),
    season_count: parseOptionalInt(String(formData.get("season_count") ?? "")),
    episode_count: parseOptionalInt(
      String(formData.get("episode_count") ?? ""),
    ),
    rating:
      rating != null && Number.isFinite(rating)
        ? Math.min(10, Math.max(0, rating))
        : null,
    review_text: String(formData.get("review_text") ?? ""),
    director: String(formData.get("director") ?? "").trim(),
    creator: String(formData.get("creator") ?? "").trim(),
    language: String(formData.get("language") ?? "").trim(),
    network: String(formData.get("network") ?? "").trim(),
    category: categoryRaw as MovieCategory,
    genres,
    watch_provider,
    status: statusRaw as SeriesStatus,
  };
}

export async function createSeries(payload: SeriesPayload): Promise<string> {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to add a series.");

  const { data, error } = await supabase
    .from("series")
    .insert({
      title: payload.title,
      overview: payload.overview ?? "",
      poster_url: payload.poster_url ?? "",
      start_date: payload.start_date ?? null,
      end_date: payload.end_date ?? null,
      start_year: payload.start_year ?? null,
      end_year: payload.end_year ?? null,
      genres: payload.genres.map((g) => g.toLowerCase()),
      category: payload.category,
      rating: payload.rating ?? null,
      review_text: payload.review_text ?? "",
      runtime_minutes: payload.runtime_minutes ?? null,
      season_count: payload.season_count ?? null,
      episode_count: payload.episode_count ?? null,
      director: payload.director ?? "",
      creator: payload.creator ?? "",
      language: payload.language?.trim() ?? "",
      network: payload.network ?? "",
      watch_provider: payload.watch_provider ?? null,
      status: payload.status ?? "ended",
      created_by: user.id,
      approval_status: "pending",
    })
    .select("id")
    .single();

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  return data.id as string;
}

export async function createSeriesFromForm(
  _prev: SeriesFormState,
  formData: FormData,
): Promise<SeriesFormState> {
  let payload: SeriesPayload;
  try {
    payload = parseSeriesFormData(formData);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Invalid form",
    };
  }

  let id: string;
  try {
    id = await createSeries(payload);
  } catch (e: unknown) {
    return {
      error: e instanceof Error ? e.message : "Could not create series",
    };
  }

  redirect(`/series/${id}`);
}

export async function deleteSeries(id: string) {
  const supabase = await createSupabaseServer();
  const { error } = await supabase.from("series").delete().eq("id", id);
  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  revalidatePath(`/series/${id}`);
}

export async function deleteSeriesFormAction(formData: FormData) {
  const id = String(formData.get("id") ?? "").trim();
  if (!id) throw new Error("Missing series id");
  await deleteSeries(id);
  redirect("/series");
}

