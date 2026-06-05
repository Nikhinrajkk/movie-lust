import Image from "next/image";
import type { ReactNode } from "react";
import { NavLinkButton } from "@/components/nav-link-button";
import { WatchProviderIcon } from "@/components/watch-provider-icon";
import type { MovieRow } from "@/types/movie";
import {
	formatGenreLabel,
	getWatchProviderBySlug,
	MOVIE_CATEGORIES,
} from "@/types/movie";

function categoryLabel(slug: string) {
	return MOVIE_CATEGORIES.find((c) => c.value === slug)?.label ?? slug;
}

function IconClock({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Clock</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
			/>
		</svg>
	);
}

function IconStar({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="currentColor"
			aria-hidden
		>
			<title>Star</title>
			<path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
		</svg>
	);
}

function IconTrend({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Trend</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"
			/>
		</svg>
	);
}

function IconBook({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Book</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
			/>
		</svg>
	);
}

function IconQuote({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="currentColor"
			aria-hidden
		>
			<title>Quote</title>
			<path d="M4.583 17.321C3.553 16.227 3 15 3 13.011c0-3.5 2.457-6.637 6.03-8.188l.893 1.378c-3.335 1.804-3.987 4.145-4.247 5.621.537-.278 1.24-.375 1.929-.311 1.804.167 3.226 1.648 3.226 3.489a3.5 3.5 0 01-3.5 3.5c-1.073 0-2.099-.49-2.748-1.179zm10 0C13.553 16.227 13 15 13 13.011c0-3.5 2.457-6.637 6.03-8.188l.893 1.378c-3.335 1.804-3.987 4.145-4.247 5.621.537-.278 1.24-.375 1.929-.311 1.804.167 3.226 1.648 3.226 3.489a3.5 3.5 0 01-3.5 3.5c-1.073 0-2.099-.49-2.748-1.179z" />
		</svg>
	);
}

function IconChevronRight({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Chevron right</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M9 5l7 7-7 7"
			/>
		</svg>
	);
}

function IconUser({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>User</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
			/>
		</svg>
	);
}

function IconPencil({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Pencil</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M15.232 5.232l3.536 3.536m-2.036-5.036l2.036 2.036L7.5 20.5H4v-3.5L14.732 4.732z"
			/>
		</svg>
	);
}

function IconCalendar({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Calendar</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
			/>
		</svg>
	);
}

function IconGlobe({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Globe</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
			/>
		</svg>
	);
}

function IconEye({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Eye</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
			/>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
			/>
		</svg>
	);
}

function RatingStars({ rating }: { rating: number }) {
	const filled = Math.min(5, Math.max(0, Math.round((rating / 10) * 5)));
	return (
		<div
			role="img"
			aria-label={`${rating.toFixed(1)} out of 10`}
			className="flex gap-0.5"
		>
			{([1, 2, 3, 4, 5] as const).map((starIndex) => (
				<IconStar
					key={`rating-star-${starIndex}`}
					className={`size-5 ${starIndex <= filled ? "text-amber-400" : "text-gray-200"}`}
				/>
			))}
		</div>
	);
}

export function MovieDetailStatsRow({ movie }: { movie: MovieRow }) {
	const cat = movie.category;
	const isTrending = cat === "trending";
	const runtime =
		movie.runtime_minutes != null ? `${movie.runtime_minutes} min` : "—";
	const rating = movie.rating != null ? `${movie.rating.toFixed(1)}/10` : "—";

	return (
		<div className="grid w-full max-w-full gap-3 [grid-template-columns:repeat(auto-fit,minmax(11rem,1fr))]">
			<div className="flex min-w-0 flex-col gap-1 rounded-xl border border-gray-200 bg-white px-4 py-3 shadow-sm">
				<div className="flex min-w-0 items-center gap-2 text-violet-600">
					<IconClock className="size-5 shrink-0" />
					<span className="truncate text-sm font-semibold text-gray-900">
						{runtime}
					</span>
				</div>
				<span className="text-xs text-gray-500">Runtime</span>
			</div>
			<div className="flex min-w-0 flex-col gap-1 rounded-xl border border-gray-200 bg-white px-4 py-3 shadow-sm">
				<div className="flex min-w-0 items-center gap-2 text-amber-500">
					<IconStar className="size-5 shrink-0" />
					<span className="truncate text-sm font-semibold text-gray-900">
						{rating}
					</span>
				</div>
				<span className="text-xs text-gray-500">Rating</span>
			</div>
			<div className="flex min-w-0 flex-col gap-1 rounded-xl border border-gray-200 bg-white px-4 py-3 shadow-sm">
				<div className="flex min-w-0 items-center gap-2 text-sky-600">
					<IconTrend className="size-5 shrink-0" />
					<span className="truncate text-sm font-semibold text-gray-900">
						{isTrending ? "Trending" : categoryLabel(cat)}
					</span>
				</div>
				<span className="text-xs text-gray-500">
					{isTrending ? "Popular now" : "Category"}
				</span>
			</div>
		</div>
	);
}

export function MovieDetailMetadataAside({ movie }: { movie: MovieRow }) {
	const watch = getWatchProviderBySlug(movie.watch_provider ?? null);
	const rows: { icon: ReactNode; label: string; value: string }[] = [];
	if (movie.director?.trim()) {
		rows.push({
			icon: <IconUser className="size-4 text-gray-400" />,
			label: "Director",
			value: movie.director.trim(),
		});
	}
	if (movie.release_year != null) {
		rows.push({
			icon: <IconCalendar className="size-4 text-gray-400" />,
			label: "Release",
			value: String(movie.release_year),
		});
	}
	if (movie.language?.trim()) {
		rows.push({
			icon: <IconGlobe className="size-4 text-gray-400" />,
			label: "Language",
			value: movie.language.trim(),
		});
	}
	if (watch) {
		rows.push({
			icon: (
				<WatchProviderIcon
					slug={watch.slug}
					className="h-5 w-auto max-w-[4.5rem] object-contain opacity-80"
					title={watch.label}
				/>
			),
			label: "Streaming",
			value: watch.label,
		});
	}
	rows.push({
		icon: <IconPencil className="size-4 text-gray-400" />,
		label: "Category",
		value: categoryLabel(movie.category),
	});

	return (
		<aside className="space-y-0 border-t border-gray-100 pt-4 lg:border-l lg:border-t-0 lg:pt-0 lg:pl-5">
			<ul className="divide-y divide-gray-100">
				{rows.map((r) => (
					<li key={r.label} className="flex gap-3 py-3 first:pt-0">
						<span className="mt-0.5 shrink-0">{r.icon}</span>
						<div className="min-w-0">
							<p className="text-xs font-medium text-gray-500">{r.label}</p>
							<p className="text-sm text-gray-900">{r.value}</p>
						</div>
					</li>
				))}
			</ul>
		</aside>
	);
}

const posterLinkRowClass =
	"flex w-full items-center justify-between gap-3 rounded-xl border border-gray-200 bg-white px-4 py-3 text-left text-sm font-medium shadow-sm transition hover:border-gray-300 hover:bg-gray-50";

function IconHome({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="none"
			stroke="currentColor"
			aria-hidden
		>
			<title>Home</title>
			<path
				strokeLinecap="round"
				strokeLinejoin="round"
				strokeWidth={2}
				d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
			/>
		</svg>
	);
}

export function MovieDetailPosterLinkRows({
	movieId,
	mode,
	showEdit,
}: {
	movieId: string;
	mode: "admin" | "public";
	showEdit: boolean;
}) {
	return (
		<div className="flex w-full flex-col gap-2">
			{mode === "admin" ? (
				<NavLinkButton
					href={`/movies/${movieId}`}
					variant="outline"
					className={`${posterLinkRowClass} text-teal-700`}
				>
					<span className="flex items-center gap-2">
						<IconEye className="size-5 text-teal-600" />
						View public page
					</span>
					<IconChevronRight className="size-4 shrink-0 text-gray-400" />
				</NavLinkButton>
			) : (
				<NavLinkButton
					href="/"
					variant="outline"
					className={`${posterLinkRowClass} text-gray-800`}
				>
					<span className="flex items-center gap-2">
						<IconHome className="size-5 text-gray-500" />
						Browse catalogue
					</span>
					<IconChevronRight className="size-4 shrink-0 text-gray-400" />
				</NavLinkButton>
			)}
			{showEdit && (
				<NavLinkButton
					href={`/movies/${movieId}/edit`}
					variant="outline"
					className={`${posterLinkRowClass} text-gray-800`}
				>
					<span className="flex items-center gap-2">
						<IconPencil className="size-5 text-gray-500" />
						Edit details
					</span>
					<IconChevronRight className="size-4 shrink-0 text-gray-400" />
				</NavLinkButton>
			)}
		</div>
	);
}

export function MovieDetailBody({
	movie,
	footerLine,
}: {
	movie: MovieRow;
	footerLine?: string;
}) {
	const submitted =
		footerLine ??
		`Submitted ${new Date(movie.created_at).toLocaleString(undefined, {
			dateStyle: "medium",
			timeStyle: "medium",
		})}`;

	return (
		<div className="min-w-0 space-y-6">
			<header className="space-y-2 border-b border-gray-100 pb-5">
				<h1 className="text-2xl font-bold tracking-tight text-slate-900 sm:text-3xl lg:text-[2rem] lg:leading-tight">
					{movie.title}
				</h1>
				<div className="flex flex-wrap items-center gap-2 text-sm text-gray-600">
					{movie.release_year != null && (
						<span className="font-medium text-gray-800">
							{movie.release_year}
						</span>
					)}
					<span className="rounded-md border border-gray-200 bg-gray-50 px-2 py-0.5 text-xs font-medium text-gray-600">
						Catalogue
					</span>
				</div>
			</header>

			<MovieDetailStatsRow movie={movie} />

			{movie.genres?.length > 0 && (
				<section className="space-y-2">
					<h2 className="text-xs font-semibold uppercase tracking-wider text-gray-500">
						Genres
					</h2>
					<div className="flex flex-wrap gap-2">
						{movie.genres.map((g) => (
							<span
								key={g}
								className="rounded-full border border-violet-200 bg-violet-50 px-3 py-1 text-xs font-medium text-violet-900"
							>
								{formatGenreLabel(g)}
							</span>
						))}
					</div>
				</section>
			)}

			<section className="space-y-2 border-t border-gray-100 pt-5">
				<h2 className="flex items-center gap-2 text-sm font-semibold text-gray-900">
					<span className="flex size-8 items-center justify-center rounded-lg bg-emerald-100 text-emerald-700">
						<IconBook className="size-4" />
					</span>
					Synopsis
				</h2>
				<p className="text-sm leading-relaxed text-gray-700 sm:text-base">
					{movie.overview?.trim() ? movie.overview : "No synopsis added yet."}
				</p>
			</section>

			<section className="space-y-3 border-t border-gray-100 pt-5">
				<h2 className="flex items-center gap-2 text-sm font-semibold text-gray-900">
					<span className="flex size-8 items-center justify-center rounded-lg bg-violet-100 text-violet-700">
						<IconQuote className="size-4" />
					</span>
					Review
				</h2>
				<p className="text-sm leading-relaxed text-gray-800 sm:text-base">
					{movie.review_text?.trim()
						? movie.review_text
						: "No review yet — add your take from the edit screen."}
				</p>
				{movie.rating != null && <RatingStars rating={movie.rating} />}
			</section>

			<p className="flex items-center gap-2 border-t border-gray-100 pt-4 text-xs text-gray-500">
				<IconCalendar className="size-4 shrink-0 text-gray-400" />
				{submitted}
			</p>
		</div>
	);
}

export function MovieDetailThreeColumn({
	movie,
	posterSrc,
	posterSizes,
	posterUnoptimized,
	rightBottomSlot,
	posterFooter,
	bodyFooterLine,
	topBanner,
}: {
	movie: MovieRow;
	posterSrc: string;
	posterSizes: string;
	posterUnoptimized: boolean;
	/** e.g. Approve/Reject — shown below metadata, pinned to bottom of the column on large screens */
	rightBottomSlot?: ReactNode;
	posterFooter?: ReactNode;
	bodyFooterLine?: string;
	topBanner?: ReactNode;
}) {
	return (
		<div className="w-full min-w-0">
			{topBanner}
			<div className="grid grid-cols-1 items-stretch gap-8 lg:grid-cols-[minmax(0,200px)_minmax(0,1fr)_minmax(0,220px)] lg:gap-10 xl:grid-cols-[220px_1fr_240px]">
				<aside className="mx-auto flex w-full max-w-[220px] flex-col gap-4 lg:mx-0 lg:max-w-none">
					<div className="relative aspect-[2/3] w-full overflow-hidden rounded-2xl border border-gray-200 bg-gray-100 shadow-md">
						<Image
							src={posterSrc}
							alt={movie.title}
							fill
							priority
							className="object-cover"
							sizes={posterSizes}
							unoptimized={posterUnoptimized}
						/>
					</div>
					{posterFooter}
				</aside>

				<main className="min-w-0 lg:border-r lg:border-gray-100 lg:pr-8">
					<MovieDetailBody movie={movie} footerLine={bodyFooterLine} />
				</main>

				<aside className="flex min-h-0 flex-col self-stretch lg:pl-0">
					<div className="min-h-0 flex-1">
						<MovieDetailMetadataAside movie={movie} />
					</div>
					{rightBottomSlot ? (
						<div className="shrink-0 border-t border-gray-200 pt-6">
							{rightBottomSlot}
						</div>
					) : null}
				</aside>
			</div>
		</div>
	);
}
