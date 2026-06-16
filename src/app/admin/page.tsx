import { Suspense } from "react";
import { redirect } from "next/navigation";

export const dynamic = "force-dynamic";
import {
  listApprovedMoviesPaged,
  listPendingMoviesPaged,
  listRejectedMoviesPaged,
} from "@/app/actions/admin-movies";
import { listProfilesForAdmin } from "@/app/actions/admin-users";
import { AdminMovieListPagination } from "@/components/admin-movie-list-pagination";
import { AdminScrollToTop } from "@/components/admin-scroll-to-top";
import { AdminSearch } from "@/components/admin-search";
import { AdminTabs } from "@/components/admin-tabs";
import { AdminUsersList } from "@/components/admin-users-list";
import { ModerationRow } from "@/components/moderation-row";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

function tabFromSearch(
  sp: Record<string, string | string[] | undefined>,
): "pending" | "approved" | "rejected" | "users" {
  const raw = sp.tab;
  const v = Array.isArray(raw) ? raw[0] : raw;
  if (v === "users") return "users";
  if (v === "rejected") return "rejected";
  if (v === "approved") return "approved";
  return "pending";
}

function intFromSearch(
  sp: Record<string, string | string[] | undefined>,
  key: string,
  fallback: number,
): number {
  const raw = sp[key];
  const s = Array.isArray(raw) ? raw[0] : raw;
  const n = parseInt(String(s ?? ""), 10);
  return Number.isFinite(n) ? n : fallback;
}

function textFromSearch(
  sp: Record<string, string | string[] | undefined>,
  key: string,
): string {
  const raw = sp[key];
  const s = Array.isArray(raw) ? raw[0] : raw;
  return typeof s === "string" ? s : "";
}

export default async function AdminPage({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}) {
  const sp = await searchParams;
  const tab = tabFromSearch(sp);
  const listPage = Math.max(1, intFromSearch(sp, "page", 1));
  const listPageSize = Math.min(50, Math.max(5, intFromSearch(sp, "perPage", 10)));
  const listSearch = textFromSearch(sp, "q");

  const ready = isSupabaseConfigured();
  const { user, isAdmin } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/admin");
  }

  if (ready && user && !isAdmin) {
    redirect("/");
  }

  const pendingResult =
    ready && isAdmin && tab === "pending"
      ? await listPendingMoviesPaged({
          page: listPage,
          pageSize: listPageSize,
          search: listSearch,
        })
      : null;

  const approvedResult =
    ready && isAdmin && tab === "approved"
      ? await listApprovedMoviesPaged({
          page: listPage,
          pageSize: listPageSize,
          search: listSearch,
        })
      : null;

  const rejectedResult =
    ready && isAdmin && tab === "rejected"
      ? await listRejectedMoviesPaged({
          page: listPage,
          pageSize: listPageSize,
          search: listSearch,
        })
      : null;

  const profiles =
    ready && isAdmin && tab === "users" ? await listProfilesForAdmin() : [];

  const headline =
    tab === "users"
      ? "Users"
      : tab === "approved"
        ? "Approved catalogue"
        : tab === "rejected"
          ? "Rejected submissions"
          : "Pending submissions";

  const subline =
    tab === "users"
      ? "Everyone who has signed up — profile id matches Auth user id."
      : tab === "approved"
        ? "Titles visible on the public browse page. Dis-approve to pull a title back into the pending queue for re-review."
        : tab === "rejected"
          ? "Titles you rejected from the pending queue. Return one to pending if you want to review it again."
          : "Approve new titles to publish them to the public catalogue, or reject duplicates and spam.";

  return (
    <div id="admin-page-top" className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--md-gold)]">
            Admin
          </p>
          <h1 className="app-page-title text-2xl font-bold tracking-tight sm:text-3xl">
            {headline}
          </h1>
          <p className="app-page-sub mt-1 text-sm">{subline}</p>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="app-nav-link px-0 py-0 text-sm"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {ready && isAdmin && (
        <div className="mb-6 space-y-4">
          <AdminTabs current={tab} search={listSearch} />
          <Suspense
            fallback={
              <div className="h-10 w-full rounded-lg border border-[var(--md-input-border)] bg-[var(--md-input-bg)]" />
            }
          >
            <AdminSearch initialSearch={listSearch} tab={tab} />
          </Suspense>
        </div>
      )}

      {!ready && <SetupCallout />}

      <Suspense fallback={null}>
        <AdminScrollToTop />
      </Suspense>

      {ready && tab === "pending" && pendingResult && pendingResult.total === 0 && (
        <div className="app-panel px-6 py-12 text-center text-sm text-[var(--md-text-muted)]">
          {listSearch.trim()
            ? "No pending submissions match your search."
            : "No submissions waiting for review."}
        </div>
      )}

      {ready && tab === "pending" && pendingResult && pendingResult.total > 0 && (
        <>
          <ul
            key={`pending-${pendingResult.page}-${pendingResult.pageSize}-${listSearch}`}
            className="space-y-3"
          >
            {pendingResult.movies.map((m) => (
              <li key={m.id}>
                <ModerationRow movie={m} mode="pending" />
              </li>
            ))}
          </ul>
          <AdminMovieListPagination
            tab="pending"
            page={pendingResult.page}
            pageSize={pendingResult.pageSize}
            total={pendingResult.total}
            totalPages={pendingResult.totalPages}
            search={listSearch}
          />
        </>
      )}

      {ready && tab === "approved" && approvedResult && approvedResult.total === 0 && (
        <div className="app-panel px-6 py-12 text-center text-sm text-[var(--md-text-muted)]">
          {listSearch.trim()
            ? "No approved titles match your search."
            : "No approved titles in the catalogue yet."}
        </div>
      )}

      {ready && tab === "approved" && approvedResult && approvedResult.total > 0 && (
        <>
          <ul
            key={`approved-${approvedResult.page}-${approvedResult.pageSize}-${listSearch}`}
            className="space-y-3"
          >
            {approvedResult.movies.map((m) => (
              <li key={m.id}>
                <ModerationRow movie={m} mode="approved" />
              </li>
            ))}
          </ul>
          <AdminMovieListPagination
            tab="approved"
            page={approvedResult.page}
            pageSize={approvedResult.pageSize}
            total={approvedResult.total}
            totalPages={approvedResult.totalPages}
            search={listSearch}
          />
        </>
      )}

      {ready && tab === "rejected" && rejectedResult && rejectedResult.total === 0 && (
        <div className="app-panel px-6 py-12 text-center text-sm text-[var(--md-text-muted)]">
          {listSearch.trim()
            ? "No rejected titles match your search."
            : "No rejected titles."}
        </div>
      )}

      {ready && tab === "rejected" && rejectedResult && rejectedResult.total > 0 && (
        <>
          <ul
            key={`rejected-${rejectedResult.page}-${rejectedResult.pageSize}-${listSearch}`}
            className="space-y-3"
          >
            {rejectedResult.movies.map((m) => (
              <li key={m.id}>
                <ModerationRow movie={m} mode="rejected" />
              </li>
            ))}
          </ul>
          <AdminMovieListPagination
            tab="rejected"
            page={rejectedResult.page}
            pageSize={rejectedResult.pageSize}
            total={rejectedResult.total}
            totalPages={rejectedResult.totalPages}
            search={listSearch}
          />
        </>
      )}

      {ready && tab === "users" && <AdminUsersList users={profiles} />}
    </div>
  );
}
