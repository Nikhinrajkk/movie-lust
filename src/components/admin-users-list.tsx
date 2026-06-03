import type { AdminProfileRow } from "@/app/actions/admin-users";

function shortId(id: string) {
  return id.replace(/-/g, "").slice(0, 8);
}

export function AdminUsersList({ users }: { users: AdminProfileRow[] }) {
  if (users.length === 0) {
    return (
      <div className="rounded-2xl border border-gray-200 bg-white px-6 py-12 text-center text-sm text-gray-600 shadow-sm">
        No profiles yet. Users appear here after they sign up.
      </div>
    );
  }

  return (
    <div className="overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm">
      <div className="overflow-x-auto">
        <table className="w-full min-w-[32rem] text-left text-sm">
          <thead className="border-b border-gray-200 bg-gray-50 text-xs font-semibold uppercase tracking-wide text-gray-500">
            <tr>
              <th className="px-4 py-3">User id</th>
              <th className="px-4 py-3">Display name</th>
              <th className="px-4 py-3">Role</th>
              <th className="px-4 py-3">Joined</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {users.map((u) => (
              <tr key={u.id} className="text-gray-800">
                <td className="px-4 py-3 font-mono text-xs text-gray-600" title={u.id}>
                  {shortId(u.id)}…
                </td>
                <td className="px-4 py-3 font-medium text-gray-900">
                  {u.display_name.trim() || "—"}
                </td>
                <td className="px-4 py-3">
                  {u.is_admin ? (
                    <span className="rounded-full bg-[var(--bms-red)]/10 px-2 py-0.5 text-xs font-semibold text-[var(--bms-red)]">
                      Admin
                    </span>
                  ) : (
                    <span className="text-xs text-gray-500">Member</span>
                  )}
                </td>
                <td className="px-4 py-3 text-xs text-gray-600">
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
      <p className="border-t border-gray-100 px-4 py-3 text-xs text-gray-500">
        Emails live in Supabase Auth; this list is from{" "}
        <code className="rounded bg-gray-100 px-1 py-0.5 text-gray-700">
          public.profiles
        </code>{" "}
        (one row per signed-up user).
      </p>
    </div>
  );
}
