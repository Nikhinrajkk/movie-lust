"use client";

import Image from "next/image";
import { useRouter } from "next/navigation";
import { useTransition } from "react";
import {
	approveMovie,
	approveSeries,
	disapproveMovie,
	disapproveSeries,
	rejectMovie,
	rejectSeries,
	returnRejectedSeriesToPending,
	returnRejectedToPending,
} from "@/app/actions/admin-movies";
import { CatalogueKindBadge } from "@/components/catalogue-kind-badge";
import {
	MovieDetailPosterLinkRows,
	MovieDetailThreeColumn,
} from "@/components/movie-detail-card";
import { seriesAsMovieRow } from "@/lib/series-as-movie-row";
import type { AdminCatalogueItem } from "@/types/admin-catalogue";
import type { MovieRow } from "@/types/movie";

function posterSrc(url: string | null) {
	if (url && url.trim().length > 0) return url;
	return "https://placehold.co/120x180/e5e5e5/737373?text=No+poster";
}

/** Check — approve */
function IconCheck({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Approve</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2.5}
				d="M5 13l4 4L19 7"
			/>
		</svg>
	);
}

/** X — reject */
function IconX({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Reject</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2.5}
				d="M6 18L18 6M6 6l12 12"
			/>
		</svg>
	);
}

/** Rotate counter-clockwise — return to pending */
function IconUndo({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Return to pending</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2.25}
				d="M9 15 3 9m0 0 6-6M3 9h12a6 6 0 010 12h-3"
			/>
		</svg>
	);
}

/** Eye-off — dis-approve */
function IconUnpublish({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Dis-approve</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2.25}
				d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"
			/>
		</svg>
	);
}

const summaryActionsClass =
	"flex shrink-0 flex-row items-center gap-1 opacity-0 transition-opacity duration-200 group-open/details:hidden " +
	"group-hover/moderation:opacity-100 group-focus-within/moderation:opacity-100";

const summaryIconBtnClass =
	"mdc-admin-action mdc-admin-action--icon size-10 shrink-0 [&_svg]:size-6 [&_svg]:shrink-0";

const bigActionBtn =
	"mdc-admin-action mdc-admin-action--lg size-16 shrink-0 [&_svg]:shrink-0";

/** Inline actions beside the title (expanded row) — always clickable, matches rail sizing */
const headerActionBtn =
	"mdc-admin-action mdc-admin-action--icon size-10 shrink-0 [&_svg]:size-6 [&_svg]:shrink-0";

function moderationFooterLine(
	item: AdminCatalogueItem,
	mode: "pending" | "approved" | "rejected",
) {
	const row = item.row;
	const fmt = (iso: string) =>
		new Date(iso).toLocaleString("en-US", { dateStyle: "medium", timeStyle: "short" });

	if (mode === "approved") {
		const added = `Added ${fmt(row.created_at)}`;
		if (row.updated_at && row.updated_at !== row.created_at) {
			return `${added} · Updated ${fmt(row.updated_at)}`;
		}
		return added;
	}
	if (mode === "rejected") {
		const sub = `Submitted ${fmt(row.created_at)}`;
		if (row.updated_at) {
			return `${sub} · Rejected ${fmt(row.updated_at)}`;
		}
		return sub;
	}
	return `Submitted ${fmt(row.created_at)}`;
}

function collapsedSubtitle(item: AdminCatalogueItem): string {
	if (item.kind === "movie") {
		const movie = item.row;
		return `${movie.release_year != null ? `${movie.release_year}` : "Year TBD"}${movie.director?.trim() ? ` · ${movie.director}` : ""}`;
	}
	const series = item.row;
	const parts: string[] = [
		series.start_year != null ? String(series.start_year) : "Year TBD",
	];
	const creator = series.creator?.trim() || series.director?.trim();
	if (creator) parts.push(creator);
	if (series.season_count != null && series.season_count > 0) {
		parts.push(`${series.season_count} season${series.season_count === 1 ? "" : "s"}`);
	}
	return parts.join(" · ");
}

async function approveCatalogueItem(item: AdminCatalogueItem) {
	if (item.kind === "movie") await approveMovie(item.row.id);
	else await approveSeries(item.row.id);
}

async function rejectCatalogueItem(item: AdminCatalogueItem) {
	if (item.kind === "movie") await rejectMovie(item.row.id);
	else await rejectSeries(item.row.id);
}

async function disapproveCatalogueItem(item: AdminCatalogueItem) {
	if (item.kind === "movie") await disapproveMovie(item.row.id);
	else await disapproveSeries(item.row.id);
}

async function returnRejectedCatalogueItem(item: AdminCatalogueItem) {
	if (item.kind === "movie") await returnRejectedToPending(item.row.id);
	else await returnRejectedSeriesToPending(item.row.id);
}

function displayMovieForItem(item: AdminCatalogueItem): MovieRow {
	return item.kind === "movie" ? item.row : seriesAsMovieRow(item.row);
}

function ModerationSummaryActions({
	item,
	mode,
	pending,
	start,
	router,
}: {
	item: AdminCatalogueItem;
	mode: "pending" | "approved" | "rejected";
	pending: boolean;
	start: (fn: () => void | Promise<void>) => void;
	router: ReturnType<typeof useRouter>;
}) {
	const stop = (e: React.MouseEvent) => e.stopPropagation();

	if (mode === "pending") {
		return (
			<div className={summaryActionsClass}>
				<button
					type="button"
					disabled={pending}
					title="Approve"
					aria-label="Approve"
					className={`${summaryIconBtnClass} mdc-admin-action--success`}
					onClick={(e) => {
						stop(e);
						start(async () => {
							await approveCatalogueItem(item);
							router.refresh();
						});
					}}
				>
					<IconCheck />
				</button>
				<button
					type="button"
					disabled={pending}
					title="Reject"
					aria-label="Reject"
					className={`${summaryIconBtnClass} mdc-admin-action--danger`}
					onClick={(e) => {
						stop(e);
						start(async () => {
							await rejectCatalogueItem(item);
							router.refresh();
						});
					}}
				>
					<IconX />
				</button>
			</div>
		);
	}

	if (mode === "rejected") {
		return (
			<div className={summaryActionsClass}>
				<button
					type="button"
					disabled={pending}
					title="Return to pending queue"
					aria-label="Return to pending"
					className={`${summaryIconBtnClass} mdc-admin-action--neutral`}
					onClick={(e) => {
						stop(e);
						start(async () => {
							await returnRejectedCatalogueItem(item);
							router.refresh();
						});
					}}
				>
					<IconUndo />
				</button>
			</div>
		);
	}

	return (
		<div className={summaryActionsClass}>
			<button
				type="button"
				disabled={pending}
				title="Dis-approve — return to pending queue"
				aria-label="Dis-approve"
				className={`${summaryIconBtnClass} mdc-admin-action--warning`}
				onClick={(e) => {
					stop(e);
					start(async () => {
						await disapproveCatalogueItem(item);
						router.refresh();
					});
				}}
			>
				<IconUnpublish />
			</button>
		</div>
	);
}

function ModerationOpenRightSlot({
	item,
	mode,
	pending,
	start,
	router,
	layout = "panel",
}: {
	item: AdminCatalogueItem;
	mode: "pending" | "approved" | "rejected";
	pending: boolean;
	start: (fn: () => void | Promise<void>) => void;
	router: ReturnType<typeof useRouter>;
	layout?: "panel" | "header";
}) {
	const isHeader = layout === "header";

	if (mode === "pending") {
		if (isHeader) {
			return (
				<>
					<button
						type="button"
						disabled={pending}
						title="Approve"
						aria-label="Approve"
						className={`${headerActionBtn} mdc-admin-action--success`}
						onClick={() =>
							start(async () => {
								await approveCatalogueItem(item);
								router.refresh();
							})
						}
					>
						<IconCheck />
					</button>
					<button
						type="button"
						disabled={pending}
						title="Reject"
						aria-label="Reject"
						className={`${headerActionBtn} mdc-admin-action--danger`}
						onClick={() =>
							start(async () => {
								await rejectCatalogueItem(item);
								router.refresh();
							})
						}
					>
						<IconX />
					</button>
				</>
			);
		}
		return (
			<div className="flex flex-wrap justify-center gap-5 sm:justify-start">
				<div className="flex flex-col items-center gap-1.5">
					<button
						type="button"
						disabled={pending}
						title="Approve"
						aria-label="Approve"
						className={`${bigActionBtn} mdc-admin-action--success`}
						onClick={() =>
							start(async () => {
								await approveCatalogueItem(item);
								router.refresh();
							})
						}
					>
						<IconCheck className="size-8" />
					</button>
					<span className="mdc-admin-action-label">Approve</span>
				</div>
				<div className="flex flex-col items-center gap-1.5">
					<button
						type="button"
						disabled={pending}
						title="Reject"
						aria-label="Reject"
						className={`${bigActionBtn} mdc-admin-action--danger`}
						onClick={() =>
							start(async () => {
								await rejectCatalogueItem(item);
								router.refresh();
							})
						}
					>
						<IconX className="size-8" />
					</button>
					<span className="mdc-admin-action-label mdc-admin-action-label--danger">
						Reject
					</span>
				</div>
			</div>
		);
	}
	if (mode === "rejected") {
		if (isHeader) {
			return (
				<button
					type="button"
					disabled={pending}
					title="Return to pending queue"
					aria-label="Return to pending"
					className={`${headerActionBtn} mdc-admin-action--neutral`}
					onClick={() =>
						start(async () => {
							await returnRejectedCatalogueItem(item);
							router.refresh();
						})
					}
				>
					<IconUndo />
				</button>
			);
		}
		return (
			<div className="flex flex-col items-center gap-1.5 sm:items-start">
				<button
					type="button"
					disabled={pending}
					title="Return to pending queue"
					aria-label="Return to pending"
					className={`${bigActionBtn} mdc-admin-action--neutral`}
					onClick={() =>
						start(async () => {
							await returnRejectedCatalogueItem(item);
							router.refresh();
						})
					}
				>
					<IconUndo className="size-7" />
				</button>
				<span className="mdc-admin-action-label mdc-admin-action-label--neutral">
					Return to pending
				</span>
			</div>
		);
	}
	if (isHeader) {
		return (
			<button
				type="button"
				disabled={pending}
				title="Dis-approve — return to pending queue"
				aria-label="Dis-approve"
				className={`${headerActionBtn} mdc-admin-action--warning`}
				onClick={() =>
					start(async () => {
						await disapproveCatalogueItem(item);
						router.refresh();
					})
				}
			>
				<IconUnpublish />
			</button>
		);
	}
	return (
		<div className="flex flex-col items-center gap-1.5 sm:items-start">
			<button
				type="button"
				disabled={pending}
				title="Dis-approve — return to pending queue"
				aria-label="Dis-approve"
				className={`${bigActionBtn} mdc-admin-action--warning`}
				onClick={() =>
					start(async () => {
						await disapproveCatalogueItem(item);
						router.refresh();
					})
				}
			>
				<IconUnpublish className="size-7" />
			</button>
			<span className="mdc-admin-action-label mdc-admin-action-label--warning">
				Dis-approve
			</span>
		</div>
	);
}

export function ModerationRow({
	item,
	mode = "pending",
}: {
	item: AdminCatalogueItem;
	mode?: "pending" | "approved" | "rejected";
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const movie = displayMovieForItem(item);
	const poster = posterSrc(movie.poster_url);

	return (
		<div className="group/moderation relative flex items-stretch overflow-hidden rounded-2xl border border-[var(--md-border)] bg-[var(--app-surface)] shadow-sm">
			<details className="group/details min-w-0 flex-1 list-none">
				<summary className="flex cursor-pointer list-none items-center gap-3 p-3 marker:content-none group-open/details:justify-end sm:gap-4 sm:p-4 [&::-webkit-details-marker]:hidden">
					<div className="relative h-16 w-11 shrink-0 overflow-hidden rounded-lg bg-[var(--app-surface-muted)] group-open/details:hidden sm:h-20 sm:w-14">
						<Image
							src={poster}
							alt={`${movie.title} poster`}
							fill
							sizes="56px"
							className="object-cover"
							unoptimized={poster.includes("placehold.co")}
						/>
					</div>
					<div className="min-w-0 flex-1 space-y-0.5 pr-1 group-open/details:hidden">
						<div className="flex min-w-0 items-center gap-2">
							<p className="truncate text-sm font-bold text-[var(--md-title)] sm:text-base">
								{movie.title}
							</p>
							<CatalogueKindBadge kind={item.kind} />
						</div>
						<p className="text-xs text-[var(--md-text-muted)]">
							{collapsedSubtitle(item)}
						</p>
					</div>
					<div className="ml-auto flex shrink-0 items-center gap-1 sm:gap-2">
						<ModerationSummaryActions
							item={item}
							mode={mode}
							pending={pending}
							start={start}
							router={router}
						/>
						<svg
							className="size-5 shrink-0 text-[var(--md-text-muted)] transition-transform duration-300 group-open/details:rotate-180"
							fill="none"
							viewBox="0 0 24 24"
							stroke="currentColor"
							role="presentation"
							aria-hidden
						>
							<title>Toggle row details</title>
							<path
								strokeLinecap="round"
								strokeLinejoin="round"
								strokeWidth={2}
								d="M19 9l-7 7-7-7"
							/>
						</svg>
					</div>
				</summary>

				<div className="border-t border-[var(--md-border)] px-3 py-5 sm:px-5 sm:py-6">
					<MovieDetailThreeColumn
						movie={movie}
						catalogueKind={item.kind}
						series={item.kind === "series" ? item.row : undefined}
						posterSrc={poster}
						posterSizes="(max-width: 1023px) 100vw, 220px"
						posterUnoptimized={poster.includes("placehold.co")}
						showMetadataAside={false}
						headerActions={
							<ModerationOpenRightSlot
								item={item}
								mode={mode}
								pending={pending}
								start={start}
								router={router}
								layout="header"
							/>
						}
						posterFooter={
							<MovieDetailPosterLinkRows
								movieId={item.row.id}
								catalogueKind={item.kind}
								mode="admin"
								showEdit
							/>
						}
						bodyFooterLine={moderationFooterLine(item, mode)}
					/>
				</div>
			</details>
		</div>
	);
}
