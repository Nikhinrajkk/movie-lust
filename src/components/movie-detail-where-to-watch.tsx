"use client";

import { WatchProviderIcon } from "@/components/watch-provider-icon";
import type { MovieRow } from "@/types/movie";
import { getWatchProviderBySlug } from "@/types/movie";

export function MovieDetailWhereToWatch({ movie }: { movie: MovieRow }) {
	const provider = getWatchProviderBySlug(movie.watch_provider ?? null);

	return (
		<div className="mdc-sidebar-card p-5">
			<div className="mb-3 flex items-center justify-between gap-2">
				<h3 className="text-base font-semibold text-[var(--md-title)]">Where to watch</h3>
			</div>

			{provider ? (
				<div className="flex items-center justify-between gap-2 py-1">
					<span className="flex min-w-0 items-center gap-2.5">
						<WatchProviderIcon
							slug={provider.slug}
							className="h-5 w-auto max-w-[3.5rem] shrink-0 object-contain"
							title={provider.label}
						/>
						<span className="mdc-aside-row-value truncate text-sm font-medium">
							{provider.label}
						</span>
					</span>
					<span className="flex shrink-0 items-center gap-1 text-xs font-semibold text-[#22c55e]">
						<span className="size-1.5 rounded-full bg-[#22c55e]" />
						Available
					</span>
				</div>
			) : (
				<p className="py-1 text-sm text-[var(--md-text-muted)]">
					Not listed on streaming.
				</p>
			)}

			<a
				href={
					provider
						? `https://www.justwatch.com/us/search?q=${encodeURIComponent(movie.title)}`
						: "https://www.justwatch.com"
				}
				target="_blank"
				rel="noopener noreferrer"
				className="mt-4 flex w-full items-center justify-center gap-1.5 rounded-xl border border-[var(--md-border)] py-2 text-xs font-medium text-[var(--md-text-muted)] transition hover:border-[var(--md-gold)] hover:text-[var(--md-gold)]"
			>
				All watch options on JustWatch
				<svg className="size-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
					<title>External link</title>
					<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
				</svg>
			</a>
		</div>
	);
}
