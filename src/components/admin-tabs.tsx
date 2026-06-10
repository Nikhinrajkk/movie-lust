import Link from "next/link";

const tabBase =
  "inline-flex items-center rounded-t-lg border border-b-0 px-4 py-2.5 text-sm font-semibold transition";
const inactive =
  "border-transparent text-[var(--md-text-muted)] hover:border-[var(--md-border)] hover:bg-[var(--app-surface-muted)] hover:text-[var(--md-title)]";
const active =
  "border-[var(--md-border)] bg-[var(--app-surface)] text-[var(--md-gold)] shadow-[0_1px_0_0_var(--app-surface)]";

export function AdminTabs({
  current,
}: {
  current: "pending" | "approved" | "rejected" | "users";
}) {
  return (
    <nav className="-mb-px flex flex-wrap gap-1 border-b border-[var(--md-border)]" aria-label="Admin sections">
      <Link
        href="/admin"
        className={`${tabBase} ${current === "pending" ? active : inactive}`}
        aria-current={current === "pending" ? "page" : undefined}
      >
        Pending
      </Link>
      <Link
        href="/admin?tab=approved"
        className={`${tabBase} ${current === "approved" ? active : inactive}`}
        aria-current={current === "approved" ? "page" : undefined}
      >
        Approved
      </Link>
      <Link
        href="/admin?tab=rejected"
        className={`${tabBase} ${current === "rejected" ? active : inactive}`}
        aria-current={current === "rejected" ? "page" : undefined}
      >
        Rejected
      </Link>
      <Link
        href="/admin?tab=users"
        className={`${tabBase} ${current === "users" ? active : inactive}`}
        aria-current={current === "users" ? "page" : undefined}
      >
        Users
      </Link>
    </nav>
  );
}
