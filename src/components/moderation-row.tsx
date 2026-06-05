"use client";

import Image from "next/image";
import { useRouter } from "next/navigation";
import { useTransition } from "react";
import {
	approveMovie,
	disapproveMovie,
	rejectMovie,
	returnRejectedToPending,
} from "@/app/actions/admin-movies";
import {
	MovieDetailPosterLinkRows,
	MovieDetailThreeColumn,
} from "@/components/movie-detail-card";
import { Button } from "@/components/ui/button";
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

const actionRailClass =
	"relative z-10 flex shrink-0 flex-row items-center justify-center gap-1 self-stretch border-l border-gray-200 bg-gray-50/95 px-1.5 py-2 sm:gap-1.5 sm:px-2 " +
	"opacity-0 transition-opacity duration-200 " +
	"group-hover/moderation:opacity-100 group-focus-within/moderation:opacity-100";

const iconBtnClass =
	"pointer-events-none group-hover/moderation:pointer-events-auto group-focus-within/moderation:pointer-events-auto " +
	"inline-flex size-10 shrink-0 items-center justify-center rounded-lg p-0 text-current shadow-sm " +
	"[&_svg]:size-6 [&_svg]:shrink-0";

const bigActionBtn =
	"flex size-16 shrink-0 items-center justify-center rounded-2xl p-0 shadow-md disabled:opacity-50";

/** Inline actions beside the title (expanded row) — always clickable, matches rail sizing */
const headerActionBtn =
	"inline-flex size-10 shrink-0 items-center justify-center rounded-lg p-0 text-current shadow-sm disabled:opacity-50 [&_svg]:size-6 [&_svg]:shrink-0";

function moderationFooterLine(
	movie: MovieRow,
	mode: "pending" | "approved" | "rejected",
) {
	if (mode === "approved") {
		const added = `Added ${new Date(movie.created_at).toLocaleString(
			undefined,
			{
				dateStyle: "medium",
				timeStyle: "short",
			},
		)}`;
		if (movie.updated_at && movie.updated_at !== movie.created_at) {
			return `${added} · Updated ${new Date(movie.updated_at).toLocaleString(
				undefined,
				{
					dateStyle: "medium",
					timeStyle: "short",
				},
			)}`;
		}
		return added;
	}
	if (mode === "rejected") {
		const sub = `Submitted ${new Date(movie.created_at).toLocaleString(
			undefined,
			{
				dateStyle: "medium",
				timeStyle: "short",
			},
		)}`;
		if (movie.updated_at) {
			return `${sub} · Rejected ${new Date(movie.updated_at).toLocaleString(
				undefined,
				{
					dateStyle: "medium",
					timeStyle: "short",
				},
			)}`;
		}
		return sub;
	}
	return `Submitted ${new Date(movie.created_at).toLocaleString(undefined, {
		dateStyle: "medium",
		timeStyle: "short",
	})}`;
}

function ModerationOpenRightSlot({
	movie,
	mode,
	pending,
	start,
	router,
	layout = "panel",
}: {
	movie: MovieRow;
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
					<Button
						type="button"
						variant="success"
						disabled={pending}
						title="Approve"
						aria-label="Approve"
						className={headerActionBtn}
						onClick={() =>
							start(async () => {
								await approveMovie(movie.id);
								router.refresh();
							})
						}
					>
						<IconCheck />
					</Button>
					<Button
						type="button"
						variant="destructive"
						disabled={pending}
						title="Reject"
						aria-label="Reject"
						className={headerActionBtn}
						onClick={() =>
							start(async () => {
								await rejectMovie(movie.id);
								router.refresh();
							})
						}
					>
						<IconX />
					</Button>
				</>
			);
		}
		return (
			<div className="flex flex-wrap justify-center gap-5 sm:justify-start">
				<div className="flex flex-col items-center gap-1.5">
					<Button
						type="button"
						variant="success"
						disabled={pending}
						title="Approve"
						aria-label="Approve"
						className={`${bigActionBtn} bg-emerald-600 hover:bg-emerald-500`}
						onClick={() =>
							start(async () => {
								await approveMovie(movie.id);
								router.refresh();
							})
						}
					>
						<IconCheck className="size-8 text-white" />
					</Button>
					<span className="text-xs font-semibold text-emerald-700">
						Approve
					</span>
				</div>
				<div className="flex flex-col items-center gap-1.5">
					<Button
						type="button"
						variant="destructive"
						disabled={pending}
						title="Reject"
						aria-label="Reject"
						className={`${bigActionBtn} border-2 border-red-200 bg-red-50 hover:bg-red-100`}
						onClick={() =>
							start(async () => {
								await rejectMovie(movie.id);
								router.refresh();
							})
						}
					>
						<IconX className="size-8 text-red-700" />
					</Button>
					<span className="text-xs font-semibold text-red-700">Reject</span>
				</div>
			</div>
		);
	}
	if (mode === "rejected") {
		if (isHeader) {
			return (
				<Button
					type="button"
					variant="secondary"
					disabled={pending}
					title="Return to pending queue"
					aria-label="Return to pending"
					className={headerActionBtn}
					onClick={() =>
						start(async () => {
							await returnRejectedToPending(movie.id);
							router.refresh();
						})
					}
				>
					<IconUndo />
				</Button>
			);
		}
		return (
			<div className="flex flex-col items-center gap-1.5 sm:items-start">
				<Button
					type="button"
					variant="secondary"
					disabled={pending}
					title="Return to pending queue"
					aria-label="Return to pending"
					className={`${bigActionBtn} border border-gray-300 bg-white`}
					onClick={() =>
						start(async () => {
							await returnRejectedToPending(movie.id);
							router.refresh();
						})
					}
				>
					<IconUndo className="size-7 text-gray-800" />
				</Button>
				<span className="text-xs font-semibold text-gray-700">
					Return to pending
				</span>
			</div>
		);
	}
	if (isHeader) {
		return (
			<Button
				type="button"
				variant="secondary"
				disabled={pending}
				title="Dis-approve — return to pending queue"
				aria-label="Dis-approve"
				className={`${headerActionBtn} border-amber-300 bg-amber-50 text-amber-950 hover:bg-amber-100`}
				onClick={() =>
					start(async () => {
						await disapproveMovie(movie.id);
						router.refresh();
					})
				}
			>
				<IconUnpublish />
			</Button>
		);
	}
	return (
		<div className="flex flex-col items-center gap-1.5 sm:items-start">
			<Button
				type="button"
				variant="secondary"
				disabled={pending}
				title="Dis-approve — return to pending queue"
				aria-label="Dis-approve"
				className={`${bigActionBtn} border-2 border-amber-300 bg-amber-50 text-amber-950 hover:bg-amber-100`}
				onClick={() =>
					start(async () => {
						await disapproveMovie(movie.id);
						router.refresh();
					})
				}
			>
				<IconUnpublish className="size-7 text-amber-950" />
			</Button>
			<span className="text-xs font-semibold text-amber-900">Dis-approve</span>
		</div>
	);
}

export function ModerationRow({
	movie,
	mode = "pending",
}: {
	movie: MovieRow;
	mode?: "pending" | "approved" | "rejected";
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const poster = posterSrc(movie.poster_url);

	return (
		<div className="group/moderation relative flex items-stretch overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm">
			<details className="peer group/details min-w-0 flex-1 list-none">
				<summary className="flex cursor-pointer list-none items-center gap-3 p-3 marker:content-none group-open/details:justify-end sm:gap-4 sm:p-4 [&::-webkit-details-marker]:hidden">
					<div className="relative h-16 w-11 shrink-0 overflow-hidden rounded-lg bg-gray-100 group-open/details:hidden sm:h-20 sm:w-14">
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
						<p className="truncate text-sm font-bold text-gray-900 sm:text-base">
							{movie.title}
						</p>
						<p className="text-xs text-gray-500">
							{movie.release_year != null
								? `${movie.release_year}`
								: "Year TBD"}
							{movie.director?.trim() ? ` · ${movie.director}` : ""}
						</p>
					</div>
					<svg
						className="size-5 shrink-0 text-gray-400 transition-transform duration-300 group-open/details:rotate-180"
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
				</summary>

				<div className="border-t border-gray-100 px-3 py-5 sm:px-5 sm:py-6">
					<MovieDetailThreeColumn
						movie={movie}
						posterSrc={poster}
						posterSizes="(max-width: 1024px) 45vw, 220px"
						posterUnoptimized={poster.includes("placehold.co")}
						showMetadataAside={false}
						headerActions={
							<ModerationOpenRightSlot
								movie={movie}
								mode={mode}
								pending={pending}
								start={start}
								router={router}
								layout="header"
							/>
						}
						posterFooter={
							<MovieDetailPosterLinkRows
								movieId={movie.id}
								mode="admin"
								showEdit
							/>
						}
						bodyFooterLine={moderationFooterLine(movie, mode)}
					/>
				</div>
			</details>

			<div
				className={`${actionRailClass} peer-open:hidden peer-open:pointer-events-none`}
			>
				{mode === "pending" ? (
					<>
						<Button
							type="button"
							variant="success"
							disabled={pending}
							title="Approve"
							aria-label="Approve"
							className={iconBtnClass}
							onClick={() =>
								start(async () => {
									await approveMovie(movie.id);
									router.refresh();
								})
							}
						>
							<IconCheck />
						</Button>
						<Button
							type="button"
							variant="destructive"
							disabled={pending}
							title="Reject"
							aria-label="Reject"
							className={iconBtnClass}
							onClick={() =>
								start(async () => {
									await rejectMovie(movie.id);
									router.refresh();
								})
							}
						>
							<IconX />
						</Button>
					</>
				) : mode === "rejected" ? (
					<Button
						type="button"
						variant="secondary"
						disabled={pending}
						title="Return to pending queue"
						aria-label="Return to pending"
						className={iconBtnClass}
						onClick={() =>
							start(async () => {
								await returnRejectedToPending(movie.id);
								router.refresh();
							})
						}
					>
						<IconUndo />
					</Button>
				) : (
					<Button
						type="button"
						variant="secondary"
						disabled={pending}
						title="Dis-approve — return to pending queue"
						aria-label="Dis-approve"
						className={`${iconBtnClass} border-amber-300 bg-amber-50 text-amber-950 hover:bg-amber-100`}
						onClick={() =>
							start(async () => {
								await disapproveMovie(movie.id);
								router.refresh();
							})
						}
					>
						<IconUnpublish />
					</Button>
				)}
			</div>
		</div>
	);
}
