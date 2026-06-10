"use client";

import { WatchProviderIcon } from "@/components/watch-provider-icon";
import type { MovieRow } from "@/types/movie";
import { WATCH_PROVIDERS } from "@/types/movie";

const AVAILABLE_SLUGS = new Set(["netflix", "prime-video", "apple-tv", "disney-plus"]);

export function MovieDetailWhereToWatch({ movie }: { movie: MovieRow }) {
	const current = movie.watch_provider?.trim().toLowerCase() ?? "";
	const rows = WATCH_PROVIDERS.slice(0, 5);

	return (
		<div className="mdc-sidebar-card p-5">
			<div className="mb-1 flex items-center justify-between gap-2">
				<h3 className="text-base font-semibold">Where to watch</h3>
				<span className="cursor-default text-xs font-semibold text-[var(--md-link)]">
					See all
				</span>
			</div>
			<ul>
				{rows.map((p, i) => {
					const isAvailable = current === p.slug || AVAILABLE_SLUGS.has(p.slug);
					return (
						<li
							key={p.slug}
							className={`flex items-center justify-between gap-2 py-2.5 ${
								i < rows.length - 1 ? "border-b border-[var(--md-border)]" : ""
							}`}
						>
							<span className="flex min-w-0 items-center gap-2.5">
								<WatchProviderIcon
									slug={p.slug}
									className="h-5 w-auto max-w-[3.5rem] shrink-0 object-contain"
									title={p.label}
								/>
								<span className="mdc-aside-row-value truncate text-sm font-medium">
									{p.label}
								</span>
							</span>
							<span
								className={`flex shrink-0 items-center gap-1 text-xs font-semibold ${
									isAvailable ? "text-[#22c55e]" : "text-[var(--md-gold)]"
								}`}
							>
								<span
									className={`size-1.5 rounded-full ${
										isAvailable ? "bg-[#22c55e]" : "bg-[var(--md-gold)]"
									}`}
								/>
								{isAvailable ? "Available" : "Rent"}
							</span>
						</li>
					);
				})}
			</ul>
			<a
				href="https://www.justwatch.com"
				target="_blank"
				rel="noopener noreferrer"
				className="mt-3 flex w-full items-center justify-center gap-1.5 rounded-xl border border-[var(--md-border)] py-2 text-xs font-medium text-[var(--md-text-muted)] transition hover:border-[var(--md-gold)] hover:text-[var(--md-gold)]"
			>
				All watch options
				<svg className="size-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
					<title>External link</title>
					<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
				</svg>
			</a>
		</div>
	);
}
