import { redirect } from "next/navigation";
import { listPendingMovies } from "@/app/actions/admin-movies";
import { ModerationRow } from "@/components/moderation-row";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function AdminPage() {
  const ready = isSupabaseConfigured();
  const { user, isAdmin } = await getSessionUserWithProfile();

  if (ready && !user) {
    redirect("/login?next=/admin");
  }

  if (ready && user && !isAdmin) {
    redirect("/");
  }

  const pending = ready && isAdmin ? await listPendingMovies() : [];

  return (
    <div className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Moderation
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-gray-900">
            Pending submissions
          </h1>
          <p className="mt-1 text-sm text-gray-600">
            Approve new titles to publish them to the public catalogue, or
            reject duplicates and spam.
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

      {!ready && <SetupCallout />}

      {ready && pending.length === 0 && (
        <div className="rounded-2xl border border-zinc-800 bg-zinc-900/40 px-6 py-12 text-center text-sm text-zinc-400">
          No submissions waiting for review.
        </div>
      )}

      {ready && pending.length > 0 && (
        <ul className="space-y-4">
          {pending.map((m) => (
            <li key={m.id}>
              <ModerationRow movie={m} />
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
