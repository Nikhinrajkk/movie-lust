import Link from "next/link";

const tabBase =
  "inline-flex items-center rounded-t-lg border border-b-0 px-4 py-2.5 text-sm font-semibold transition";
const inactive =
  "border-transparent text-gray-500 hover:border-gray-200 hover:bg-gray-50 hover:text-gray-800";
const active =
  "border-gray-200 bg-white text-[var(--bms-red)] shadow-[0_1px_0_0_white]";

export function AdminTabs({ current }: { current: "pending" | "users" }) {
  return (
    <nav className="-mb-px flex flex-wrap gap-1 border-b border-gray-200" aria-label="Admin sections">
      <Link
        href="/admin"
        className={`${tabBase} ${current === "pending" ? active : inactive}`}
        aria-current={current === "pending" ? "page" : undefined}
      >
        Pending
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
