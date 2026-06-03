"use server";

import { sanitizeSupabaseErrorMessage } from "@/lib/supabase/errors";
import { createSupabaseServer } from "@/lib/supabase/server";
import { getSessionUserWithProfile } from "@/lib/auth/session";

export type AdminProfileRow = {
  id: string;
  display_name: string;
  is_admin: boolean;
  created_at: string;
};

/** All rows from `public.profiles` (same users as auth), newest first. */
export async function listProfilesForAdmin(): Promise<AdminProfileRow[]> {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { data, error } = await supabase
    .from("profiles")
    .select("id, display_name, is_admin, created_at")
    .order("created_at", { ascending: false });

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

  return (data ?? []).map((r) => ({
    id: r.id as string,
    display_name: String(r.display_name ?? ""),
    is_admin: Boolean(r.is_admin),
    created_at: String(r.created_at ?? ""),
  }));
}
