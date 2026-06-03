import { redirect } from "next/navigation";
import { listPendingMovies } from "@/app/actions/admin-movies";
import { listProfilesForAdmin } from "@/app/actions/admin-users";
import { AdminTabs } from "@/components/admin-tabs";
import { AdminUsersList } from "@/components/admin-users-list";
import { ModerationRow } from "@/components/moderation-row";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

function tabFromSearch(
  sp: Record<string, string | string[] | undefined>,
): "pending" | "users" {
  const raw = sp.tab;
  const v = Array.isArray(raw) ? raw[0] : raw;
  return v === "users" ? "users" : "pending";
}

export default async function AdminPage({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}) {
  const sp = await searchParams;
  const tab = tabFromSearch(sp);

  const ready = isSupabaseConfigured();
  const { user, isAdmin } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/admin");
  }

  if (ready && user && !isAdmin) {
    redirect("/");
  }

  const pending = ready && isAdmin && tab === "pending" ? await listPendingMovies() : [];
  const profiles =
    ready && isAdmin && tab === "users" ? await listProfilesForAdmin() : [];

  return (
    <div className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Admin
          </p>
          <h1 className="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">
            {tab === "users" ? "Users" : "Pending submissions"}
          </h1>
          <p className="mt-1 text-sm text-gray-600">
            {tab === "users"
              ? "Everyone who has signed up — profile id matches Auth user id."
              : "Approve new titles to publish them to the public catalogue, or reject duplicates and spam."}
          </p>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="px-0 py-0 text-sm text-gray-600 hover:text-[var(--bms-red)]"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {ready && isAdmin && (
        <div className="mb-6">
          <AdminTabs current={tab} />
        </div>
      )}

      {!ready && <SetupCallout />}

      {ready && tab === "pending" && pending.length === 0 && (
        <div className="rounded-2xl border border-gray-200 bg-white px-6 py-12 text-center text-sm text-gray-600 shadow-sm">
          No submissions waiting for review.
        </div>
      )}

      {ready && tab === "pending" && pending.length > 0 && (
        <ul className="space-y-4">
          {pending.map((m) => (
            <li key={m.id}>
              <ModerationRow movie={m} />
            </li>
          ))}
        </ul>
      )}

      {ready && tab === "users" && <AdminUsersList users={profiles} />}
    </div>
  );
}
