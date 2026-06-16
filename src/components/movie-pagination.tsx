"use client";

import { useMemo } from "react";
import { useMovieFilters } from "@/stores/movie-filters";
import {
	MovieListPaginationBar,
	PaginationPageNavButtons,
} from "@/components/movie-list-pagination-bar";

const perPagePillClass = (active: boolean) =>
	`shrink-0 rounded-md px-2 py-1 font-medium transition ${
		active
			? "bg-[var(--bms-red)]/10 text-[var(--bms-red)]"
			: "text-gray-600 hover:bg-gray-100 hover:text-gray-900"
	}`;

export function MoviePagination({
	page,
	totalPages,
	total,
	disabled,
	itemSingular = "film",
	itemPlural = "films",
}: {
	page: number;
	totalPages: number;
	/** Total catalogue count for “Showing … of …”. */
	total: number;
	disabled?: boolean;
	itemSingular?: string;
	itemPlural?: string;
}) {
	const setPage = useMovieFilters((s) => s.setPage);
	const pageSize = useMovieFilters((s) => s.pageSize);
	const setPageSize = useMovieFilters((s) => s.setPageSize);

	const pageSizeOptions = useMemo(() => {
		const base = [8, 15, 24, 48];
		return [...new Set([...base, pageSize])].sort((a, b) => a - b);
	}, [pageSize]);

	const startText =
		totalPages > 1 ? (
			<p className="text-xs text-gray-600">
				Showing {(page - 1) * pageSize + 1}–{Math.min(page * pageSize, total)} of{" "}
				{total}
			</p>
		) : (
			<p className="text-xs text-gray-600">
				{total} {total === 1 ? itemSingular : itemPlural}
			</p>
		);

	const middle = (
		<>
			<span className="shrink-0 text-gray-500">Per page:</span>
			{pageSizeOptions.map((n) => (
				<button
					key={n}
					type="button"
					disabled={disabled}
					aria-pressed={pageSize === n}
					aria-label={`Show ${n} results per page`}
					className={perPagePillClass(pageSize === n)}
					onClick={() => setPageSize(n)}
				>
					{n}
				</button>
			))}
		</>
	);

	const end =
		totalPages > 1 ? (
			<PaginationPageNavButtons
				page={page}
				totalPages={totalPages}
				prevDisabled={Boolean(disabled) || page <= 1}
				nextDisabled={Boolean(disabled) || page >= totalPages}
				onPrev={() => setPage(Math.max(1, page - 1))}
				onNext={() => setPage(Math.min(totalPages, page + 1))}
			/>
		) : null;

	return (
		<MovieListPaginationBar start={startText} middle={middle} end={end} />
	);
}
