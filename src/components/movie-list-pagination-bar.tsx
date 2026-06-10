import type { ReactNode } from "react";

/** Shared single-row grid: start (e.g. “Showing…”) | middle (per page) | end (prev / page / next). */
export function MovieListPaginationBar({
	start,
	middle,
	end,
}: {
	start: ReactNode;
	middle: ReactNode;
	end: ReactNode;
}) {
	return (
		<div className="mt-6 overflow-x-auto border-t border-[var(--md-border)] pt-5 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
			<div className="grid w-full min-w-0 grid-cols-[minmax(0,1fr)_auto_minmax(0,1fr)] items-center gap-x-3 gap-y-2">
				<div className="min-w-0 justify-self-start">{start}</div>
				<div className="flex shrink-0 flex-nowrap items-center justify-center gap-2 justify-self-center text-xs">
					{middle}
				</div>
				<div className="flex min-w-0 shrink-0 flex-nowrap items-center justify-end justify-self-end gap-2">
					{end}
				</div>
			</div>
		</div>
	);
}
