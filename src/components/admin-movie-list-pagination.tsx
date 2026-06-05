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
    <div className="mt-6 overflow-x-auto border-t border-gray-200 pt-5 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
      <div className="grid w-full min-w-0 grid-cols-[minmax(0,1fr)_auto_minmax(0,1fr)] items-center gap-x-3 gap-y-2">
        <p className="min-w-0 justify-self-start text-xs text-gray-600">
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
        <div className="flex shrink-0 flex-nowrap items-center justify-center gap-2 justify-self-center text-xs">
          <span className="shrink-0 text-gray-500">Per page:</span>
          {[5, 10, 15, 25].map((n) => (
            <Link
              key={n}
              href={href(tab, 1, n)}
              scroll={false}
              className={`shrink-0 rounded-md px-2 py-1 font-medium transition ${
                pageSize === n
                  ? "bg-[var(--bms-red)]/10 text-[var(--bms-red)]"
                  : "text-gray-600 hover:bg-gray-100 hover:text-gray-900"
              }`}
            >
              {n}
            </Link>
          ))}
        </div>
        <div className="flex min-w-0 shrink-0 flex-nowrap items-center justify-end justify-self-end gap-2">
          {totalPages > 1 ? (
            <>
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
              <span className="whitespace-nowrap px-1 text-xs font-medium text-gray-600">
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
            </>
          ) : null}
        </div>
      </div>
    </div>
  );
}
