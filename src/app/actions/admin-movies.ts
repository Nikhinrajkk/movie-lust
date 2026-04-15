"use server";

import { revalidatePath } from "next/cache";
import { createSupabaseServer } from "@/lib/supabase/server";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import type { MovieRow } from "@/types/movie";

export async function listPendingMovies(): Promise<MovieRow[]> {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { data, error } = await supabase
    .from("movies")
    .select("*")
    .eq("approval_status", "pending")
    .order("created_at", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []) as MovieRow[];
}

export async function approveMovie(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "approved",
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
}

export async function rejectMovie(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "rejected",
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(error.message);
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
}
