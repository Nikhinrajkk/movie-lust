import { createClient, type SupabaseClient } from "@supabase/supabase-js";

export function createSupabaseServerOptional(): SupabaseClient | null {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) return null;
  return createClient(url, key);
}

export function createSupabaseServer(): SupabaseClient {
  const client = createSupabaseServerOptional();
  if (!client) {
    throw new Error(
      "Missing NEXT_PUBLIC_SUPABASE_URL or NEXT_PUBLIC_SUPABASE_ANON_KEY",
    );
  }
  return client;
}
