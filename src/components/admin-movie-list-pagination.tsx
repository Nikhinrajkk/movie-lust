import Link from "next/link";
import { Button } from "@/components/ui/button";

function href(tab: "pending" | "approved" | "rejected", page: number, pageSize: number) {
  const p = new URLSearchParams();
  if (tab !== "pending") p.set("tab", tab);
  if (page > 1) p.set("page", String(page));
  if (pageSize !== 10) p.set("perPage", String(pageSize));
  const q = p.toString();
  return q ? `/admin?${q}` : "/admin";
}

export function AdminMovieListPagination({
  tab,
  page,
  pageSize,
  total,
  totalPages,
}: {
  tab: "pending" | "approved" | "rejected";
  page: number;
  pageSize: number;
  total: number;
  totalPages: number;
}) {
  const itemWord =
    tab === "pending" ? "submission" : tab === "rejected" ? "rejected title" : "title";

  return (
    <div className="mt-6 space-y-4 border-t border-gray-200 pt-5">
      <div className="flex flex-col items-center gap-3 sm:flex-row sm:justify-between">
        <p className="text-xs text-gray-600">
          {totalPages > 1 ? (
            <>
              Showing {(page - 1) * pageSize + 1}–{Math.min(page * pageSize, total)} of {total}
            </>
          ) : (
            <>
              {total} {itemWord}
              {total === 1 ? "" : "s"}
            </>
          )}
        </p>
        {totalPages > 1 && (
          <div className="flex flex-wrap items-center justify-center gap-2">
            <Button
              variant="secondary"
              className="px-3 py-1.5 text-xs"
              disabled={page <= 1}
              asChild
            >
              <Link href={href(tab, Math.max(1, page - 1), pageSize)} scroll>
                Previous
              </Link>
            </Button>
            <span className="px-2 text-xs font-medium text-gray-600">
              Page {page} / {totalPages}
            </span>
            <Button
              variant="secondary"
              className="px-3 py-1.5 text-xs"
              disabled={page >= totalPages}
              asChild
            >
              <Link href={href(tab, Math.min(totalPages, page + 1), pageSize)} scroll>
                Next
              </Link>
            </Button>
          </div>
        )}
      </div>
      <div className="flex flex-wrap items-center justify-center gap-2 text-xs">
        <span className="text-gray-500">Per page:</span>
        {[5, 10, 15, 25].map((n) => (
          <Link
            key={n}
            href={href(tab, 1, n)}
            scroll={false}
            className={`rounded-md px-2 py-1 font-medium transition ${
              pageSize === n
                ? "bg-[var(--bms-red)]/10 text-[var(--bms-red)]"
                : "text-gray-600 hover:bg-gray-100 hover:text-gray-900"
            }`}
          >
            {n}
          </Link>
        ))}
      </div>
    </div>
  );
}
