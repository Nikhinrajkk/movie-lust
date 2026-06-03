"use server";

import { revalidatePath } from "next/cache";
import {
  isLikelyHtmlOrTransportBody,
  logSupabaseTransportFailure,
  sanitizeSupabaseErrorMessage,
} from "@/lib/supabase/errors";
import {
  createSupabaseServer,
  createSupabaseServerOptional,
} from "@/lib/supabase/server";
import type { MovieRow } from "@/types/movie";

export async function markMovieWatched(movieId: string) {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to mark films as watched.");

  const { data: movie, error: movieErr } = await supabase
    .from("movies")
    .select("id, approval_status")
    .eq("id", movieId)
    .maybeSingle();

  if (movieErr) throw new Error(sanitizeSupabaseErrorMessage(movieErr));
  if (!movie || movie.approval_status !== "approved") {
    throw new Error("Only published films can be marked as watched.");
  }

  const { error } = await supabase.from("watched_movies").upsert(
    { user_id: user.id, movie_id: movieId },
    { onConflict: "user_id,movie_id" },
  );

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/watchlist");
  revalidatePath("/watched");
  revalidatePath(`/movies/${movieId}`);
}

export async function unmarkMovieWatched(movieId: string) {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to update watched status.");

  const { error } = await supabase
    .from("watched_movies")
    .delete()
    .eq("user_id", user.id)
    .eq("movie_id", movieId);

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/watchlist");
  revalidatePath("/watched");
  revalidatePath(`/movies/${movieId}`);
}

export async function getWatchedMovieIdsForUser(): Promise<string[]> {
  const supabase = await createSupabaseServerOptional();
  if (!supabase) return [];

  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return [];

  const { data, error } = await supabase
    .from("watched_movies")
    .select("movie_id")
    .eq("user_id", user.id);

  if (error) {
    const raw = String(error.message ?? "");
    if (isLikelyHtmlOrTransportBody(raw)) {
      logSupabaseTransportFailure("getWatchedMovieIdsForUser");
      return [];
    }
    throw new Error(sanitizeSupabaseErrorMessage(error));
  }
  return (data ?? []).map((r) => r.movie_id as string);
}

export async function listWatchedMovies(): Promise<MovieRow[]> {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return [];

  const { data: rows, error } = await supabase
    .from("watched_movies")
    .select("movie_id, movies(*)")
    .eq("user_id", user.id);

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

  const movies = (rows ?? [])
    .map((r) => {
      const m = r.movies as MovieRow | MovieRow[] | null;
      if (m && !Array.isArray(m)) return m;
      if (Array.isArray(m) && m[0]) return m[0];
      return null;
    })
    .filter((m): m is MovieRow => m != null);

  return movies.sort((a, b) =>
    (a.title ?? "").localeCompare(b.title ?? "", undefined, {
      sensitivity: "base",
    }),
  );
}
