import Link from "next/link";

const tabBase =
  "inline-flex items-center rounded-t-lg border border-b-0 px-4 py-2.5 text-sm font-semibold transition";
const inactive =
  "border-transparent text-[var(--md-text-muted)] hover:border-[var(--md-border)] hover:bg-[var(--app-surface-muted)] hover:text-[var(--md-title)]";
const active =
  "border-[var(--md-border)] bg-[var(--app-surface)] text-[var(--md-gold)] shadow-[0_1px_0_0_var(--app-surface)]";

function tabHref(
  tab: "pending" | "approved" | "rejected" | "users",
  search?: string,
) {
  const p = new URLSearchParams();
  if (tab !== "pending") p.set("tab", tab);
  const trimmed = search?.trim();
  if (trimmed) p.set("q", trimmed);
  const q = p.toString();
  return q ? `/admin?${q}` : "/admin";
}

export function AdminTabs({
  current,
  search = "",
}: {
  current: "pending" | "approved" | "rejected" | "users";
  search?: string;
}) {
  return (
    <nav className="-mb-px flex flex-wrap gap-1 border-b border-[var(--md-border)]" aria-label="Admin sections">
      <Link
        href={tabHref("pending", search)}
        className={`${tabBase} ${current === "pending" ? active : inactive}`}
        aria-current={current === "pending" ? "page" : undefined}
      >
        Pending
      </Link>
      <Link
        href={tabHref("approved", search)}
        className={`${tabBase} ${current === "approved" ? active : inactive}`}
        aria-current={current === "approved" ? "page" : undefined}
      >
        Approved
      </Link>
      <Link
        href={tabHref("rejected", search)}
        className={`${tabBase} ${current === "rejected" ? active : inactive}`}
        aria-current={current === "rejected" ? "page" : undefined}
      >
        Rejected
      </Link>
      <Link
        href={tabHref("users", search)}
        className={`${tabBase} ${current === "users" ? active : inactive}`}
        aria-current={current === "users" ? "page" : undefined}
      >
        Users
      </Link>
    </nav>
  );
}
