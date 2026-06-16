import type { ReactNode } from "react";
import Link from "next/link";

const arrowBtnClass =
	"inline-flex size-8 shrink-0 items-center justify-center rounded-md border border-[var(--md-border)] bg-[var(--app-surface)] text-[var(--md-title)] transition hover:bg-[var(--app-surface-muted)] focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[var(--md-gold)]/40 disabled:pointer-events-none disabled:opacity-40";

function IconChevronLeft() {
	return (
		<svg className="size-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Previous</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
		</svg>
	);
}

function IconChevronRight() {
	return (
		<svg className="size-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Next</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
		</svg>
	);
}

function PageIndicator({ page, totalPages }: { page: number; totalPages: number }) {
	return (
		<span className="min-w-[3.25rem] shrink-0 text-center text-xs font-medium tabular-nums text-[var(--md-text-muted)]">
			{page} / {totalPages}
		</span>
	);
}

export function PaginationPageNavButtons({
	page,
	totalPages,
	prevDisabled,
	nextDisabled,
	onPrev,
	onNext,
}: {
	page: number;
	totalPages: number;
	prevDisabled: boolean;
	nextDisabled: boolean;
	onPrev: () => void;
	onNext: () => void;
}) {
	return (
		<div className="flex shrink-0 items-center gap-1">
			<button
				type="button"
				className={arrowBtnClass}
				disabled={prevDisabled}
				onClick={onPrev}
				aria-label="Previous page"
			>
				<IconChevronLeft />
			</button>
			<PageIndicator page={page} totalPages={totalPages} />
			<button
				type="button"
				className={arrowBtnClass}
				disabled={nextDisabled}
				onClick={onNext}
				aria-label="Next page"
			>
				<IconChevronRight />
			</button>
		</div>
	);
}

export function PaginationPageNavLinks({
	page,
	totalPages,
	prevHref,
	nextHref,
	prevDisabled,
	nextDisabled,
}: {
	page: number;
	totalPages: number;
	prevHref: string;
	nextHref: string;
	prevDisabled: boolean;
	nextDisabled: boolean;
}) {
	return (
		<div className="flex shrink-0 items-center gap-1">
			{prevDisabled ? (
				<span className={`${arrowBtnClass} opacity-40`} aria-hidden>
					<IconChevronLeft />
				</span>
			) : (
				<Link href={prevHref} scroll className={arrowBtnClass} aria-label="Previous page">
					<IconChevronLeft />
				</Link>
			)}
			<PageIndicator page={page} totalPages={totalPages} />
			{nextDisabled ? (
				<span className={`${arrowBtnClass} opacity-40`} aria-hidden>
					<IconChevronRight />
				</span>
			) : (
				<Link href={nextHref} scroll className={arrowBtnClass} aria-label="Next page">
					<IconChevronRight />
				</Link>
			)}
		</div>
	);
}

/** Shared pagination row: start (e.g. “Showing…”) | middle (per page) | end (prev / page / next). */
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
		<div className="mt-6 border-t border-[var(--md-border)] pt-5">
			<div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between sm:gap-4">
				<div className="min-w-0 shrink-0">{start}</div>
				<div className="flex flex-wrap items-center justify-center gap-2 text-xs">{middle}</div>
				<div className="flex shrink-0 items-center justify-center sm:justify-end">{end}</div>
			</div>
		</div>
	);
}
