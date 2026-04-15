import { createSupabaseServerOptional } from "@/lib/supabase/server";

export type SessionProfile = {
  display_name: string;
  is_admin: boolean;
};

export async function getSessionUserWithProfile(): Promise<{
  user: { id: string; email?: string | null } | null;
  profile: SessionProfile | null;
  isAdmin: boolean;
}> {
  const supabase = await createSupabaseServerOptional();
  if (!supabase) {
    return { user: null, profile: null, isAdmin: false };
  }

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { user: null, profile: null, isAdmin: false };
  }

  const { data: profileRow } = await supabase
    .from("profiles")
    .select("display_name, is_admin")
    .eq("id", user.id)
    .maybeSingle();

  const profile: SessionProfile | null = profileRow
    ? {
        display_name: String(profileRow.display_name ?? ""),
        is_admin: Boolean(profileRow.is_admin),
      }
    : null;

  return {
    user: { id: user.id, email: user.email },
    profile,
    isAdmin: Boolean(profile?.is_admin),
  };
}
