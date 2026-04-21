"use server";

import { revalidatePath } from "next/cache";
import {
  createSupabaseServer,
  createSupabaseServerOptional,
} from "@/lib/supabase/server";

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

  if (movieErr) throw new Error(movieErr.message);
  if (!movie || movie.approval_status !== "approved") {
    throw new Error("Only published films can be marked as watched.");
  }

  const { error } = await supabase.from("watched_movies").upsert(
    { user_id: user.id, movie_id: movieId },
    { onConflict: "user_id,movie_id" },
  );

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/watchlist");
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

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/watchlist");
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

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => r.movie_id as string);
}
