"use server";

import { revalidatePath, unstable_noStore } from "next/cache";
import { sanitizeSupabaseErrorMessage } from "@/lib/supabase/errors";
import { createSupabaseServer } from "@/lib/supabase/server";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import type { MovieRow } from "@/types/movie";
import type {
  AdminCatalogueItem,
  AdminCataloguePageResult,
} from "@/types/admin-catalogue";
import type { SeriesRow } from "@/types/series";

export type AdminMoviesPageResult = {
  movies: MovieRow[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
};

function adminMovieSearchFilter(search?: string): string | null {
  const q = search?.trim();
  if (!q) return null;
  const safe = q.replace(/%/g, "").replace(/,/g, "").slice(0, 200);
  if (safe.length === 0) return null;
  const p = `%${safe}%`;
  return `title.ilike.${p},overview.ilike.${p},review_text.ilike.${p},director.ilike.${p}`;
}

function adminSeriesSearchFilter(search?: string): string | null {
  const q = search?.trim();
  if (!q) return null;
  const safe = q.replace(/%/g, "").replace(/,/g, "").slice(0, 200);
  if (safe.length === 0) return null;
  const p = `%${safe}%`;
  return `title.ilike.${p},overview.ilike.${p},review_text.ilike.${p},director.ilike.${p},creator.ilike.${p},network.ilike.${p}`;
}

type ModerationStatus = "pending" | "approved" | "rejected";

function sortTimestamp(
  row: { created_at: string; updated_at: string },
  status: ModerationStatus,
) {
  return status === "pending" ? row.created_at : row.updated_at;
}

async function fetchMoviesByStatus(
  status: ModerationStatus,
  search?: string,
): Promise<MovieRow[]> {
  const supabase = await createSupabaseServer();
  const searchFilter = adminMovieSearchFilter(search);
  const order =
    status === "pending"
      ? { column: "created_at" as const, ascending: false }
      : { column: "updated_at" as const, ascending: false };

  let query = supabase
    .from("movies")
    .select("*")
    .eq("approval_status", status);
  if (searchFilter) query = query.or(searchFilter);

  const { data, error } = await query
    .order(order.column, { ascending: order.ascending })
    .order("id", { ascending: false });

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  return (data ?? []) as MovieRow[];
}

async function fetchSeriesByStatus(
  status: ModerationStatus,
  search?: string,
): Promise<SeriesRow[]> {
  const supabase = await createSupabaseServer();
  const searchFilter = adminSeriesSearchFilter(search);
  const order =
    status === "pending"
      ? { column: "created_at" as const, ascending: false }
      : { column: "updated_at" as const, ascending: false };

  let query = supabase
    .from("series")
    .select("*")
    .eq("approval_status", status);
  if (searchFilter) query = query.or(searchFilter);

  const { data, error } = await query
    .order(order.column, { ascending: order.ascending })
    .order("id", { ascending: false });

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  return (data ?? []) as SeriesRow[];
}

function mergeCatalogueItems(
  movies: MovieRow[],
  series: SeriesRow[],
  status: ModerationStatus,
): AdminCatalogueItem[] {
  const items: AdminCatalogueItem[] = [
    ...movies.map((row) => ({ kind: "movie" as const, row })),
    ...series.map((row) => ({ kind: "series" as const, row })),
  ];

  items.sort((a, b) => {
    const aTime = sortTimestamp(a.row, status);
    const bTime = sortTimestamp(b.row, status);
    const diff = new Date(bTime).getTime() - new Date(aTime).getTime();
    if (diff !== 0) return diff;
    return b.row.id.localeCompare(a.row.id);
  });

  return items;
}

async function listCatalogueByStatusPaged(
  status: ModerationStatus,
  input: { page?: number; pageSize?: number; search?: string },
): Promise<AdminCataloguePageResult> {
  unstable_noStore();
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const page = Math.max(1, input.page ?? 1);
  const pageSize = Math.min(50, Math.max(5, input.pageSize ?? 10));

  const [movies, series] = await Promise.all([
    fetchMoviesByStatus(status, input.search),
    fetchSeriesByStatus(status, input.search),
  ]);

  const merged = mergeCatalogueItems(movies, series, status);
  const total = merged.length;
  const totalPages = Math.max(1, Math.ceil(total / pageSize));
  const safePage = Math.min(page, totalPages);
  const from = (safePage - 1) * pageSize;
  const items = merged.slice(from, from + pageSize);

  return {
    items,
    total,
    page: safePage,
    pageSize,
    totalPages,
  };
}

export async function listPendingCataloguePaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminCataloguePageResult> {
  return listCatalogueByStatusPaged("pending", input);
}

export async function listApprovedCataloguePaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminCataloguePageResult> {
  return listCatalogueByStatusPaged("approved", input);
}

export async function listRejectedCataloguePaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminCataloguePageResult> {
  return listCatalogueByStatusPaged("rejected", input);
}

async function listMoviesByStatusPaged(
  status: "pending" | "approved" | "rejected",
  input: { page?: number; pageSize?: number; search?: string },
): Promise<AdminMoviesPageResult> {
  unstable_noStore();
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const page = Math.max(1, input.page ?? 1);
  const pageSize = Math.min(50, Math.max(5, input.pageSize ?? 10));

  const supabase = await createSupabaseServer();
  let countQuery = supabase
    .from("movies")
    .select("*", { count: "exact", head: true })
    .eq("approval_status", status);
  const searchFilter = adminMovieSearchFilter(input.search);
  if (searchFilter) countQuery = countQuery.or(searchFilter);

  const { count, error: countError } = await countQuery;

  if (countError) throw new Error(sanitizeSupabaseErrorMessage(countError));

  const total = count ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / pageSize));
  const safePage = Math.min(page, totalPages);
  const from = (safePage - 1) * pageSize;
  const to = from + pageSize - 1;

  // All tabs: newest activity first.
  // Pending  → created_at DESC (latest submissions at top)
  // Approved → updated_at DESC (most recently approved/edited first)
  // Rejected → updated_at DESC (most recently actioned first)
  const order =
    status === "pending"
      ? { column: "created_at" as const, ascending: false }
      : { column: "updated_at" as const, ascending: false };

  let dataQuery = supabase
    .from("movies")
    .select("*")
    .eq("approval_status", status);
  if (searchFilter) dataQuery = dataQuery.or(searchFilter);

  const { data, error } = await dataQuery
    .order(order.column, { ascending: order.ascending })
    .order("id", { ascending: false })
    .range(from, to);

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));

  return {
    movies: (data ?? []) as MovieRow[],
    total,
    page: safePage,
    pageSize,
    totalPages,
  };
}

export async function listPendingMoviesPaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminMoviesPageResult> {
  return listMoviesByStatusPaged("pending", input);
}

export async function listApprovedMoviesPaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminMoviesPageResult> {
  return listMoviesByStatusPaged("approved", input);
}

export async function listRejectedMoviesPaged(
  input: { page?: number; pageSize?: number; search?: string } = {},
): Promise<AdminMoviesPageResult> {
  return listMoviesByStatusPaged("rejected", input);
}

export async function approveMovie(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to approve.");

  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "approved",
      approved_by: user.id,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
  revalidatePath("/my-movies");
}

export async function rejectMovie(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "rejected",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
  revalidatePath("/my-movies");
}

/** Return a published title to the moderation queue (pending). */
export async function disapproveMovie(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "pending",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "approved");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
  revalidatePath("/my-movies");
  revalidatePath("/watchlist");
  revalidatePath("/watched");
}

/** Move a rejected submission back to the pending queue. */
export async function returnRejectedToPending(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("movies")
    .update({
      approval_status: "pending",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "rejected");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/");
  revalidatePath("/admin");
  revalidatePath(`/movies/${id}`);
  revalidatePath("/my-movies");
}

export async function approveSeries(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("Sign in to approve.");

  const { error } = await supabase
    .from("series")
    .update({
      approval_status: "approved",
      approved_by: user.id,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  revalidatePath(`/series/${id}`);
}

export async function rejectSeries(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("series")
    .update({
      approval_status: "rejected",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "pending");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  revalidatePath(`/series/${id}`);
}

export async function disapproveSeries(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("series")
    .update({
      approval_status: "pending",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "approved");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  revalidatePath(`/series/${id}`);
}

export async function returnRejectedSeriesToPending(id: string) {
  const { isAdmin } = await getSessionUserWithProfile();
  if (!isAdmin) throw new Error("Admin access required.");

  const supabase = await createSupabaseServer();
  const { error } = await supabase
    .from("series")
    .update({
      approval_status: "pending",
      approved_by: null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id)
    .eq("approval_status", "rejected");

  if (error) throw new Error(sanitizeSupabaseErrorMessage(error));
  revalidatePath("/series");
  revalidatePath("/admin");
  revalidatePath(`/series/${id}`);
}
