import Link from "next/link";
import {
	MovieListPaginationBar,
	PaginationPageNavLinks,
} from "@/components/movie-list-pagination-bar";

function href(
	tab: "pending" | "approved" | "rejected",
	page: number,
	pageSize: number,
	search?: string,
) {
	const p = new URLSearchParams();
	if (tab !== "pending") p.set("tab", tab);
	if (page > 1) p.set("page", String(page));
	if (pageSize !== 10) p.set("perPage", String(pageSize));
	const trimmed = search?.trim();
	if (trimmed) p.set("q", trimmed);
	const q = p.toString();
	return q ? `/admin?${q}` : "/admin";
}

export function AdminMovieListPagination({
	tab,
	page,
	pageSize,
	total,
	totalPages,
	search = "",
}: {
	tab: "pending" | "approved" | "rejected";
	page: number;
	pageSize: number;
	total: number;
	totalPages: number;
	search?: string;
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
					href={href(tab, 1, n, search)}
					scroll
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
			<PaginationPageNavLinks
				page={page}
				totalPages={totalPages}
				prevHref={href(tab, Math.max(1, page - 1), pageSize, search)}
				nextHref={href(tab, Math.min(totalPages, page + 1), pageSize, search)}
				prevDisabled={page <= 1}
				nextDisabled={page >= totalPages}
			/>
		) : null;

	return <MovieListPaginationBar start={start} middle={middle} end={end} />;
}
