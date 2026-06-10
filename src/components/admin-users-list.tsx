import type { AdminProfileRow } from "@/app/actions/admin-users";

function shortId(id: string) {
  return id.replace(/-/g, "").slice(0, 8);
}

export function AdminUsersList({ users }: { users: AdminProfileRow[] }) {
  if (users.length === 0) {
    return (
      <div className="rounded-2xl border border-[var(--md-border)] bg-[var(--app-surface)] px-6 py-12 text-center text-sm text-[var(--md-text-muted)] shadow-sm">
        No profiles yet. Users appear here after they sign up.
      </div>
    );
  }

  return (
    <div className="overflow-hidden rounded-2xl border border-[var(--md-border)] bg-[var(--app-surface)] shadow-sm">
      <div className="overflow-x-auto">
        <table className="w-full min-w-[32rem] text-left text-sm">
          <thead className="border-b border-[var(--md-border)] bg-[var(--app-surface-muted)] text-xs font-semibold uppercase tracking-wide text-[var(--md-text-muted)]">
            <tr>
              <th className="px-4 py-3">User id</th>
              <th className="px-4 py-3">Display name</th>
              <th className="px-4 py-3">Role</th>
              <th className="px-4 py-3">Joined</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-[var(--md-border)]">
            {users.map((u) => (
              <tr key={u.id} className="text-[var(--md-text)]">
                <td className="px-4 py-3 font-mono text-xs text-[var(--md-text-muted)]" title={u.id}>
                  {shortId(u.id)}…
                </td>
                <td className="px-4 py-3 font-medium text-[var(--md-title)]">
                  {u.display_name.trim() || "—"}
                </td>
                <td className="px-4 py-3">
                  {u.is_admin ? (
                    <span className="rounded-full bg-[var(--md-gold-soft)] px-2 py-0.5 text-xs font-semibold text-[var(--md-gold)]">
                      Admin
                    </span>
                  ) : (
                    <span className="text-xs text-[var(--md-text-muted)]">Member</span>
                  )}
                </td>
                <td className="px-4 py-3 text-xs text-[var(--md-text-muted)]">
                  {u.created_at
                    ? new Date(u.created_at).toLocaleString(undefined, {
                        dateStyle: "medium",
                        timeStyle: "short",
                      })
                    : "—"}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <p className="border-t border-[var(--md-border)] px-4 py-3 text-xs text-[var(--md-text-muted)]">
        Emails live in Supabase Auth; this list is from{" "}
        <code className="rounded bg-[var(--app-surface-muted)] px-1 py-0.5 text-[var(--md-text)]">
          public.profiles
        </code>{" "}
        (one row per signed-up user).
      </p>
    </div>
  );
}
