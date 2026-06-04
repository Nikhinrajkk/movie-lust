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
import { NavLinkButton } from "@/components/nav-link-button";
import { Button } from "@/components/ui/button";
import { WatchProviderIcon } from "@/components/watch-provider-icon";
import type { MovieRow } from "@/types/movie";
import {
	formatGenreLabel,
	getWatchProviderBySlug,
	MOVIE_CATEGORIES,
} from "@/types/movie";

function posterSrc(url: string | null) {
	if (url && url.trim().length > 0) return url;
	return "https://placehold.co/120x180/e5e5e5/737373?text=No+poster";
}

function categoryLabel(slug: string) {
	return MOVIE_CATEGORIES.find((c) => c.value === slug)?.label ?? slug;
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
				strokeWidth={2}
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
				strokeWidth={2}
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
				strokeWidth={2}
				d="M9 15 3 9m0 0 6-6M3 9h12a6 6 0 010 12h-3"
			/>
		</svg>
	);
}

/** Eye-off / hide — dis-approve from catalogue */
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
				strokeWidth={2}
				d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"
			/>
		</svg>
	);
}

/** Action icons always visible (hover-only hid them on touch / some hover chains). */
const actionRailClass =
	"relative z-10 flex shrink-0 flex-row items-center justify-center gap-1 self-stretch border-l border-gray-200 bg-gray-50/90 px-1.5 py-2 sm:gap-1.5 sm:px-2";

const iconBtnClass =
	"inline-flex size-9 shrink-0 items-center justify-center rounded-lg p-0 text-current [&_svg]:size-[1.2rem]";

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
	const watch = getWatchProviderBySlug(movie.watch_provider ?? null);

	return (
		<div className="relative flex items-stretch overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm">
			{/*
			  Single poster: thumbnail in the collapsed row morphs into the large poster slot when open.
			  summary uses display:contents so poster + header participate in the details grid.
			*/}
			<details className="group/details grid min-w-0 flex-1 grid-cols-[2.75rem_minmax(0,1fr)] items-center gap-x-6 p-3 shadow-none open:grid-cols-[min(100%,140px)_minmax(0,1fr)] open:grid-rows-[auto_minmax(0,1fr)] open:items-start open:gap-x-6 open:gap-y-4 open:py-4 open:pl-3 open:pr-3 open:sm:grid-cols-[140px_minmax(0,1fr)] open:sm:px-4 open:sm:pb-5 open:sm:pt-4 [&:open]:bg-white">
				<summary className="contents cursor-pointer list-none marker:content-none [&::-webkit-details-marker]:hidden">
					{/* me-*: extra space between poster and title when collapsed (display:contents + grid gap can be thin in some browsers) */}
					<div className="relative col-start-1 row-start-1 me-5 h-16 w-11 shrink-0 overflow-hidden rounded-lg bg-gray-100 transition-[width,height,border-radius,box-shadow,margin] duration-300 ease-out will-change-[width,height] sm:me-6 sm:h-20 sm:w-14 group-open/details:z-10 group-open/details:me-0 group-open/details:row-span-2 group-open/details:h-[210px] group-open/details:w-full group-open/details:max-w-[140px] group-open/details:self-start group-open/details:rounded-xl group-open/details:border group-open/details:border-gray-200 group-open/details:shadow-sm">
						<Image
							src={poster}
							alt={`${movie.title} poster`}
							fill
							sizes="(max-width: 640px) 40vw, 140px"
							className="object-cover"
							unoptimized={poster.includes("placehold.co")}
						/>
					</div>
					<div className="col-start-2 row-start-1 flex min-w-0 items-center justify-between gap-2 group-open/details:min-h-0 group-open/details:self-start">
						<div className="min-w-0 flex-1 space-y-0.5 pr-1">
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
					</div>
				</summary>

				<div className="col-start-2 row-start-2 min-h-0 min-w-0 space-y-4 border-t border-gray-100 pt-4 group-open/details:border-gray-100 sm:group-open/details:border-transparent sm:group-open/details:pt-0">
					<div className="min-w-0 space-y-3 text-sm">
						<div className="flex flex-wrap gap-2 text-xs text-gray-600">
							{movie.runtime_minutes != null && (
								<span className="rounded-full border border-gray-200 bg-gray-50 px-2 py-0.5">
									{movie.runtime_minutes} min
								</span>
							)}
							{movie.rating != null && (
								<span className="rounded-full border border-gray-200 bg-gray-50 px-2 py-0.5 font-medium text-emerald-800">
									Rating {movie.rating.toFixed(1)}/10
								</span>
							)}
							<span className="rounded-full border border-gray-200 bg-gray-50 px-2 py-0.5">
								{categoryLabel(movie.category)}
							</span>
							{movie.language?.trim() ? (
								<span className="rounded-full border border-gray-200 bg-gray-50 px-2 py-0.5">
									{movie.language.trim()}
								</span>
							) : null}
						</div>

						{movie.genres?.length > 0 && (
							<div>
								<p className="mb-1 text-xs font-semibold uppercase tracking-wide text-gray-500">
									Genres
								</p>
								<div className="flex flex-wrap gap-1.5">
									{movie.genres.map((g) => (
										<span
											key={g}
											className="rounded-md border border-gray-200 bg-gray-50 px-2 py-0.5 text-xs text-gray-700"
										>
											{formatGenreLabel(g)}
										</span>
									))}
								</div>
							</div>
						)}

						{watch && (
							<div className="flex flex-wrap items-center gap-2">
								<span className="text-xs font-semibold uppercase tracking-wide text-gray-500">
									Where to watch
								</span>
								<WatchProviderIcon
									slug={watch.slug}
									className="h-5 w-auto max-w-[7rem] object-contain"
									title={watch.label}
								/>
								<span className="text-xs text-gray-700">{watch.label}</span>
							</div>
						)}

						<div>
							<p className="mb-1 text-xs font-semibold uppercase tracking-wide text-gray-500">
								Synopsis
							</p>
							<p className="text-sm leading-relaxed text-gray-700">
								{movie.overview?.trim() || "—"}
							</p>
						</div>

						<div>
							<p className="mb-1 text-xs font-semibold uppercase tracking-wide text-gray-500">
								Review
							</p>
							<p className="text-sm leading-relaxed text-gray-700">
								{movie.review_text?.trim() || "—"}
							</p>
						</div>

						<p className="text-xs text-gray-400">
							{mode === "approved" ? (
								<>
									Added {new Date(movie.created_at).toLocaleString()}
									{movie.updated_at && movie.updated_at !== movie.created_at ? (
										<>
											{" "}
											· Updated {new Date(movie.updated_at).toLocaleString()}
										</>
									) : null}
								</>
							) : mode === "rejected" ? (
								<>
									Submitted {new Date(movie.created_at).toLocaleString()}
									{movie.updated_at ? (
										<>
											{" "}
											· Rejected {new Date(movie.updated_at).toLocaleString()}
										</>
									) : null}
								</>
							) : (
								<>Submitted {new Date(movie.created_at).toLocaleString()}</>
							)}
						</p>

						<div className="flex flex-wrap gap-2 pt-1">
							<NavLinkButton
								href={`/movies/${movie.id}`}
								variant="outline"
								className="text-xs"
							>
								Public page
							</NavLinkButton>
							<NavLinkButton
								href={`/movies/${movie.id}/edit`}
								variant="outline"
								className="text-xs"
							>
								Edit
							</NavLinkButton>
						</div>
					</div>
				</div>
			</details>

			<div className={actionRailClass}>
				{mode === "pending" ? (
					<>
						<Button
							type="button"
							variant="success"
							disabled={pending}
							title="Approve"
							aria-label="Approve"
							className={`${iconBtnClass}`}
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
							className={`${iconBtnClass}`}
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
						className={`${iconBtnClass}`}
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
