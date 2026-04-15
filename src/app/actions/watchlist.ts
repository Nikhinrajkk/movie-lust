"use server";

import { revalidatePath } from "next/cache";
import {
  createSupabaseServer,
  createSupabaseServerOptional,
} from "@/lib/supabase/server";
import type { MovieRow } from "@/types/movie";

export async function addToWatchlist(movieId: string) {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to save titles to your list.");

  const { data: movie, error: movieErr } = await supabase
    .from("movies")
    .select("id, approval_status")
    .eq("id", movieId)
    .maybeSingle();

  if (movieErr) throw new Error(movieErr.message);
  if (!movie || movie.approval_status !== "approved") {
    throw new Error("Only published films can be added to your list.");
  }

  const { error } = await supabase.from("watchlist").upsert(
    { user_id: user.id, movie_id: movieId },
    { onConflict: "user_id,movie_id" },
  );

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/watchlist");
  revalidatePath(`/movies/${movieId}`);
}

export async function removeFromWatchlist(movieId: string) {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to manage your list.");

  const { error } = await supabase
    .from("watchlist")
    .delete()
    .eq("user_id", user.id)
    .eq("movie_id", movieId);

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/watchlist");
  revalidatePath(`/movies/${movieId}`);
}

export async function getWatchlistMovieIdsForUser(): Promise<string[]> {
  const supabase = await createSupabaseServerOptional();
  if (!supabase) return [];

  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return [];

  const { data, error } = await supabase
    .from("watchlist")
    .select("movie_id")
    .eq("user_id", user.id);

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => r.movie_id as string);
}

export async function listWatchlistMovies(): Promise<MovieRow[]> {
  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return [];

  const { data: rows, error } = await supabase
    .from("watchlist")
    .select("movie_id, movies(*)")
    .eq("user_id", user.id)
    .order("created_at", { ascending: false });

  if (error) throw new Error(error.message);

  return (rows ?? [])
    .map((r) => {
      const m = r.movies as MovieRow | MovieRow[] | null;
      if (m && !Array.isArray(m)) return m;
      if (Array.isArray(m) && m[0]) return m[0];
      return null;
    })
    .filter((m): m is MovieRow => m != null);
}
