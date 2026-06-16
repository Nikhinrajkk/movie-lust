import Image from "next/image";
import type { ReactNode } from "react";
import { NavLinkButton } from "@/components/nav-link-button";
import { MovieDetailShareButton } from "@/components/movie-detail-share-button";
import { MovieDetailTrailerPill } from "@/components/movie-detail-trailer-pill";
import { MovieDetailWhereToWatch } from "@/components/movie-detail-where-to-watch";
import { WatchProviderIcon } from "@/components/watch-provider-icon";
import type { MovieUserReviewAggregate } from "@/types/movie-user-review";
import type { MovieRow } from "@/types/movie";
import {
	formatGenreLabel,
	getWatchProviderBySlug,
	MOVIE_CATEGORIES,
} from "@/types/movie";
import type { SeriesRow } from "@/types/series";
import { SERIES_STATUSES } from "@/types/series";

function formatSeriesDate(value: string | null | undefined) {
	if (!value) return null;
	const d = new Date(value);
	if (Number.isNaN(d.getTime())) return value;
	return d.toLocaleDateString(undefined, { dateStyle: "medium" });
}

function seriesStatusLabel(status: SeriesRow["status"]) {
	return SERIES_STATUSES.find((s) => s.value === status)?.label ?? status;
}

function categoryLabel(slug: string) {
	return MOVIE_CATEGORIES.find((c) => c.value === slug)?.label ?? slug;
}

/* ── inline SVG helpers ────────────────────────────────────────────── */

function IconClock({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Clock</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
		</svg>
	);
}

function IconStar({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="currentColor" aria-hidden>
			<title>Star</title>
			<path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
		</svg>
	);
}

function IconUsers({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Users</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2M9 11a4 4 0 100-8 4 4 0 000 8zm12 10v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75" />
		</svg>
	);
}

function IconTrend({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Category</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A2 2 0 013 12V7a4 4 0 014-4z" />
		</svg>
	);
}

function IconUser({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Person</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
		</svg>
	);
}

function IconCalendarSm({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Calendar</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
		</svg>
	);
}

function IconGlobe({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Language</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
		</svg>
	);
}

function IconTag({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Category</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A2 2 0 013 12V7a4 4 0 014-4z" />
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

export function MovieDetailStatsRow({
	movie,
	userReviewAggregate,
	series,
	catalogueKind,
}: {
	movie: MovieRow;
	userReviewAggregate?: MovieUserReviewAggregate;
	series?: SeriesRow;
	catalogueKind?: "movie" | "series";
}) {
	const isSeries = catalogueKind === "series" && series != null;
	const runtime = isSeries
		? series.runtime_minutes != null
			? `${series.runtime_minutes} min / ep`
			: "—"
		: movie.runtime_minutes != null
			? `${movie.runtime_minutes} min`
			: "—";
	const catalogueRating =
		movie.rating != null ? `${movie.rating.toFixed(1)}/10` : "—";

	const hasUserAgg = userReviewAggregate !== undefined;
	const userAvg = userReviewAggregate?.avgStars ?? null;
	const userCount = userReviewAggregate?.ratingCount ?? 0;
	const userScoreText =
		userAvg != null ? `${userAvg.toFixed(1)}/5` : "—";

	const gridClass = hasUserAgg
		? "grid w-full grid-cols-2 gap-4 sm:grid-cols-3"
		: "grid w-full grid-cols-2 gap-4 sm:grid-cols-2";

	if (isSeries) {
		const seasons =
			series.season_count != null ? String(series.season_count) : "—";
		const episodes =
			series.episode_count != null ? String(series.episode_count) : "—";

		return (
			<div className={gridClass}>
				<div className="mdc-stat-card px-4 py-3">
					<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-runtime)]">
						<IconTrend className="size-4 shrink-0" />
						<span className="mdc-section-title truncate text-sm font-semibold">
							{seasons}
						</span>
					</div>
					<div className="mdc-stat-label mt-1.5">Seasons</div>
				</div>
				<div className="mdc-stat-card px-4 py-3">
					<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-runtime)]">
						<IconUsers className="size-4 shrink-0" />
						<span className="mdc-section-title truncate text-sm font-semibold">
							{episodes}
						</span>
					</div>
					<div className="mdc-stat-label mt-1.5">Episodes</div>
				</div>
				<div className="mdc-stat-card px-4 py-3">
					<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-catalogue)]">
						<IconClock className="size-4 shrink-0" />
						<span className="mdc-section-title truncate text-sm font-semibold">
							{runtime}
						</span>
					</div>
					<div className="mdc-stat-label mt-1.5">Episode runtime</div>
				</div>
				<div className="mdc-stat-card px-4 py-3">
					<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-catalogue)]">
						<IconStar className="size-4 shrink-0" />
						<span className="mdc-section-title truncate text-sm font-semibold">
							{catalogueRating}
						</span>
					</div>
					<div className="mdc-stat-label mt-1.5">Catalogue</div>
				</div>
			</div>
		);
	}

	return (
		<div className={gridClass}>
			{/* Each card: [icon + value] on one line, label below */}
			<div className="mdc-stat-card px-4 py-3">
				<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-runtime)]">
					<IconClock className="size-4 shrink-0" />
					<span className="mdc-section-title truncate text-sm font-semibold">{runtime}</span>
				</div>
				<div className="mdc-stat-label mt-1.5">Runtime</div>
			</div>
			<div className="mdc-stat-card px-4 py-3">
				<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-catalogue)]">
					<IconStar className="size-4 shrink-0" />
					<span className="mdc-section-title truncate text-sm font-semibold">{catalogueRating}</span>
				</div>
				<div className="mdc-stat-label mt-1.5">Catalogue</div>
			</div>
			{hasUserAgg ? (
				<div className="mdc-stat-card px-4 py-3">
					<div className="flex min-w-0 items-center gap-2 text-[color:var(--md-stat-users)]">
						<IconUsers className="size-4 shrink-0" />
						<span className="mdc-section-title truncate text-sm font-semibold">{userScoreText}</span>
					</div>
					<div className="mdc-stat-label mt-1.5">
						Users{userCount > 0 ? ` (${userCount})` : ""}
					</div>
				</div>
			) : null}
		</div>
	);
}

export function SeriesDetailExtraSection({ series }: { series: SeriesRow }) {
	const facts: { label: string; value: string }[] = [];

	if (series.creator?.trim()) {
		facts.push({ label: "Creator", value: series.creator.trim() });
	}
	if (series.director?.trim()) {
		facts.push({ label: "Director", value: series.director.trim() });
	}
	if (series.network?.trim()) {
		facts.push({ label: "Network", value: series.network.trim() });
	}

	const startDate = formatSeriesDate(series.start_date);
	const endDate = formatSeriesDate(series.end_date);
	if (startDate) facts.push({ label: "First aired", value: startDate });
	if (endDate) facts.push({ label: "Last aired", value: endDate });

	if (facts.length === 0) return null;

	return (
		<section className="mdc-content-card">
			<h3 className="mb-3 text-lg font-semibold">Series details</h3>
			<dl className="grid gap-4 sm:grid-cols-2">
				{facts.map(({ label, value }) => (
					<div key={label}>
						<dt className="mdc-aside-row-label text-xs">{label}</dt>
						<dd className="mdc-aside-row-value mt-1 text-base font-medium leading-snug">
							{value}
						</dd>
					</div>
				))}
			</dl>
		</section>
	);
}

export function MovieDetailMetadataAside({
	movie,
	catalogueKind,
}: {
	movie: MovieRow;
	catalogueKind?: "movie" | "series";
}) {
	const watch = getWatchProviderBySlug(movie.watch_provider ?? null);
	const rows: { icon: ReactNode; label: string; value: ReactNode }[] = [];
	if (movie.director?.trim() && catalogueKind !== "series") {
		rows.push({ icon: <IconUser className="size-4" />, label: "Director", value: movie.director.trim() });
	}
	if (movie.release_year != null && catalogueKind !== "series") {
		rows.push({ icon: <IconCalendarSm className="size-4" />, label: "Release", value: String(movie.release_year) });
	}
	if (movie.language?.trim()) {
		rows.push({ icon: <IconGlobe className="size-4" />, label: "Language", value: movie.language.trim() });
	}
	if (watch && catalogueKind !== "series") {
		rows.push({
			icon: (
				<WatchProviderIcon slug={watch.slug} className="h-4 w-auto max-w-[3rem] object-contain opacity-80" title={watch.label} />
			),
			label: "Streaming",
			value: watch.label,
		});
	}
	rows.push({ icon: <IconTag className="size-4" />, label: "Category", value: categoryLabel(movie.category) });

	return (
		<div className="mdc-sidebar-card p-5">
			{rows.map((r, i) => (
				<div
					key={r.label}
					className={`flex items-start gap-3 ${i < rows.length - 1 ? "border-b border-[var(--md-border)]" : ""} ${i === 0 ? "pb-4" : i === rows.length - 1 ? "pt-4" : "py-4"}`}
				>
					<span className="mdc-aside-icon mt-0.5 shrink-0">{r.icon}</span>
					<div className="min-w-0">
						<p className="mdc-aside-row-label text-xs">{r.label}</p>
						<p className="mdc-aside-row-value mt-1 text-base font-medium leading-snug">{r.value}</p>
					</div>
				</div>
			))}
		</div>
	);
}

const posterLinkRowClass =
	"mdc-link-row flex w-full items-center justify-between gap-2 rounded-xl border px-3 py-3 text-left text-sm font-medium transition sm:gap-3 sm:px-4";

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
	catalogueKind = "movie",
}: {
	movieId: string;
	mode: "admin" | "public";
	showEdit: boolean;
	catalogueKind?: "movie" | "series";
}) {
	const basePath = catalogueKind === "series" ? "/series" : "/movies";
	return (
		<div className="flex w-full flex-col gap-2">
		{mode === "admin" ? (
			<NavLinkButton
				href={`${basePath}/${movieId}`}
				variant="outline"
				className={posterLinkRowClass}
			>
				<span className="flex items-center gap-2.5">
					<IconEye className="size-4 shrink-0 text-[var(--md-gold)]" />
					Public page
				</span>
				<IconChevronRight className="size-4 shrink-0 text-[var(--md-text-muted)]" />
			</NavLinkButton>
		) : (
			<NavLinkButton
				href={catalogueKind === "series" ? "/series" : "/"}
				variant="outline"
				className={posterLinkRowClass}
			>
				<span className="flex items-center gap-2.5">
					<IconHome className="size-4 shrink-0 text-[var(--md-gold)]" />
					{catalogueKind === "series" ? "Browse series" : "Browse catalogue"}
				</span>
				<IconChevronRight className="size-4 shrink-0 text-[var(--md-text-muted)]" />
			</NavLinkButton>
		)}
		{showEdit && catalogueKind === "movie" && (
			<NavLinkButton
				href={`/movies/${movieId}/edit`}
				variant="outline"
				className={posterLinkRowClass}
			>
				<span className="flex items-center gap-2.5">
					<IconPencil className="size-4 shrink-0 text-[var(--md-gold)]" />
					Edit details
				</span>
				<IconChevronRight className="size-4 shrink-0 text-[var(--md-text-muted)]" />
			</NavLinkButton>
		)}
		</div>
	);
}

export function MovieDetailBody({
	movie,
	footerLine,
	headerActions,
	userReviewAggregate,
	reviewsSlot,
	catalogueKind,
	series,
}: {
	movie: MovieRow;
	footerLine?: string;
	/** e.g. moderation approve/reject — shown to the right of the title row */
	headerActions?: ReactNode;
	userReviewAggregate?: MovieUserReviewAggregate;
	/** User ratings & comments (same layout as former catalogue Review block). */
	reviewsSlot?: ReactNode;
	catalogueKind?: "movie" | "series";
	series?: SeriesRow;
}) {
	const submitted =
		footerLine ??
		`Submitted ${new Date(movie.created_at).toLocaleString(undefined, {
			dateStyle: "medium",
			timeStyle: "medium",
		})}`;

	return (
		<div className="min-w-0 space-y-6">
			<header>
				<div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between sm:gap-4">
					<div className="min-w-0 flex-1">
						<h1 className="mdc-h1 text-[clamp(1.75rem,3.5vw,2.5rem)] font-extrabold leading-tight tracking-tight">
							{movie.title}
						</h1>
						<div className="mt-3 flex flex-wrap items-center gap-2">
							{catalogueKind === "series" && series ? (
								<span className="mdc-muted text-base font-medium">
									{series.start_year != null
										? series.end_year != null &&
												series.end_year !== series.start_year
											? `${series.start_year}–${series.end_year}`
											: String(series.start_year)
										: "Year TBD"}
								</span>
							) : (
								movie.release_year != null && (
									<span className="mdc-muted text-base font-medium">
										{movie.release_year}
									</span>
								)
							)}
							<span className="mdc-badge rounded-full px-3 py-1.5 text-sm font-medium">
								{catalogueKind === "series" ? "Series" : "Movie"}
							</span>
							{catalogueKind === "series" && series ? (
								<span className="mdc-badge rounded-full px-3 py-1.5 text-sm font-medium">
									{seriesStatusLabel(series.status)}
								</span>
							) : null}
						</div>
					</div>
					{headerActions ? (
						<div className="flex shrink-0 flex-row flex-wrap items-center justify-start gap-2 sm:justify-end">
							{headerActions}
						</div>
					) : null}
				</div>
			</header>

			<MovieDetailStatsRow
				movie={movie}
				userReviewAggregate={userReviewAggregate}
				series={series}
				catalogueKind={catalogueKind}
			/>

			{catalogueKind === "series" && series ? (
				<SeriesDetailExtraSection series={series} />
			) : null}

			{movie.genres?.length > 0 && (
				<section className="space-y-3">
					<h2 className="mdc-label text-xs font-semibold uppercase tracking-widest">
						Genres
					</h2>
					<div className="flex flex-wrap gap-2">
						{movie.genres.map((g) => (
							<span
								key={g}
								className="mdc-genre-pill rounded-full border px-4 py-2 text-sm font-medium"
							>
								{formatGenreLabel(g)}
							</span>
						))}
					</div>
				</section>
			)}

			<section className="mdc-content-card">
				<h3 className="mb-3 text-lg font-semibold">📖 Synopsis</h3>
				<p className="mdc-prose text-sm leading-[1.8]">
					{movie.overview?.trim()
						? movie.overview
						: movie.review_text?.trim() || "No synopsis added yet."}
				</p>
			</section>

			{reviewsSlot ? (
				<section className="mdc-content-card space-y-4">
					<h3 className="text-lg font-semibold">💬 Reviews</h3>
					<div>{reviewsSlot}</div>
				</section>
			) : null}

			<p className="mdc-footer-line flex items-center gap-2 pt-1 text-xs">
				<IconCalendar className="size-4 shrink-0" />
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
	showMetadataAside = true,
	headerActions,
	userReviewAggregate,
	reviewsSlot,
	shareTitle,
	catalogueKind,
	series,
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
	/** When false, the right column only shows `rightBottomSlot` (e.g. admin actions; centre already lists year/category). */
	showMetadataAside?: boolean;
	/** Shown to the right of the title in the main column (e.g. inline moderation actions when expanded). */
	headerActions?: ReactNode;
	/** When set, stats row includes aggregate user star average for this movie. */
	userReviewAggregate?: MovieUserReviewAggregate;
	/** User reviews UI (rendered under the Reviews heading in the main column). */
	reviewsSlot?: ReactNode;
	/** When set with a right column, shows Share in the sidebar (uses current page URL on the client). */
	shareTitle?: string;
	catalogueKind?: "movie" | "series";
	series?: SeriesRow;
}) {
	const hasRightCol =
		showMetadataAside !== false || Boolean(rightBottomSlot);
	const posterFooterInAside = hasRightCol && Boolean(posterFooter);

	return (
		<div className="w-full min-w-0">
			{topBanner}
			<div
				className={
					hasRightCol
						? "grid grid-cols-1 items-start gap-8 lg:grid-cols-[200px_1fr_240px] lg:gap-x-8 lg:gap-y-0 xl:grid-cols-[220px_1fr_260px] xl:gap-x-10"
						: "grid grid-cols-1 items-start gap-8 lg:grid-cols-[200px_1fr] lg:gap-x-8 xl:grid-cols-[220px_1fr]"
				}
			>
				{/* Left: sticky poster + trailer button */}
				<div className="lg:sticky lg:top-8 lg:col-start-1 lg:row-start-1 lg:self-start">
					<div className="mdc-poster-frame relative aspect-[2/3] w-full overflow-hidden rounded-3xl shadow-[0_30px_60px_rgba(0,0,0,.45)]">
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
					<MovieDetailTrailerPill title={movie.title} />
				</div>

				{/* Center: body */}
				<main className="min-w-0 lg:col-start-2 lg:row-start-1">
					<MovieDetailBody
						movie={movie}
						footerLine={bodyFooterLine}
						headerActions={headerActions}
						userReviewAggregate={userReviewAggregate}
						reviewsSlot={reviewsSlot}
						catalogueKind={catalogueKind}
						series={series}
					/>
				</main>

				{/* Right sidebar */}
				{hasRightCol ? (
					<aside className="flex min-w-0 flex-col gap-5 lg:col-start-3 lg:row-start-1 lg:sticky lg:top-8 lg:self-start">
						{showMetadataAside !== false ? (
							<MovieDetailMetadataAside
								movie={movie}
								catalogueKind={catalogueKind}
							/>
						) : null}
						{catalogueKind !== "series" ? (
							<MovieDetailWhereToWatch movie={movie} />
						) : null}
						{posterFooterInAside ? (
							<div className="flex flex-col gap-3">{posterFooter}</div>
						) : null}
						{shareTitle ? <MovieDetailShareButton title={shareTitle} /> : null}
						{rightBottomSlot ? (
							<div className="flex flex-col gap-3 border-t border-[var(--md-border)] pt-4">
								{rightBottomSlot}
							</div>
						) : null}
					</aside>
				) : null}

				{/* Fallback: poster footer outside aside (no right column) */}
				{posterFooter && !posterFooterInAside ? (
					<div className="flex flex-col gap-3 lg:col-start-1 lg:row-start-2">
						{posterFooter}
					</div>
				) : null}
			</div>
		</div>
	);
}
