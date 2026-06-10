import Link from "next/link";
import { Button } from "@/components/ui/button";
import { MovieListPaginationBar } from "@/components/movie-list-pagination-bar";

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

	const start =
		totalPages > 1 ? (
			<p className="text-xs text-[var(--md-text-muted)]">
				Showing {(page - 1) * pageSize + 1}–{Math.min(page * pageSize, total)} of {total}
			</p>
		) : (
			<p className="text-xs text-[var(--md-text-muted)]">
				{total} {itemWord}
				{total === 1 ? "" : "s"}
			</p>
		);

	const middle = (
		<>
			<span className="shrink-0 text-[var(--md-text-muted)]">Per page:</span>
			{[5, 10, 15, 25].map((n) => (
				<Link
					key={n}
					href={href(tab, 1, n)}
					scroll={false}
					className={`shrink-0 rounded-md px-2 py-1 font-medium transition ${
						pageSize === n
							? "bg-[var(--md-gold-soft)] text-[var(--md-gold)]"
							: "text-[var(--md-text-muted)] hover:bg-[var(--app-surface-muted)] hover:text-[var(--md-title)]"
					}`}
				>
					{n}
				</Link>
			))}
		</>
	);

	const end =
		totalPages > 1 ? (
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
				<span className="whitespace-nowrap px-1 text-xs font-medium text-[var(--md-text-muted)]">
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
		) : null;

	return <MovieListPaginationBar start={start} middle={middle} end={end} />;
}
