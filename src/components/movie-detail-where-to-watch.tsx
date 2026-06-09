"use client";

import type { MovieRow } from "@/types/movie";
import { WATCH_PROVIDERS } from "@/types/movie";

const AVAILABLE_SLUGS = new Set(["netflix", "prime-video", "apple-tv", "disney-plus"]);

export function MovieDetailWhereToWatch({ movie }: { movie: MovieRow }) {
	const current = movie.watch_provider?.trim().toLowerCase() ?? "";
	const rows = WATCH_PROVIDERS.slice(0, 5);

	return (
		<div className="mdc-sidebar-card p-5">
			<div className="mb-2 flex items-center justify-between gap-2">
				<h3 className="text-base font-semibold">Where to Watch</h3>
				<span className="cursor-default text-xs font-medium text-[var(--md-link)]">
					See All
				</span>
			</div>
			<ul>
				{rows.map((p, i) => {
					const isAvailable = current === p.slug || AVAILABLE_SLUGS.has(p.slug);
					return (
						<li
							key={p.slug}
							className={`flex items-center justify-between py-3 text-sm ${
								i < rows.length - 1 ? "border-b border-[var(--md-border)]" : ""
							}`}
						>
							<span className="font-medium">{p.label}</span>
							<span
								className={`font-semibold ${
									isAvailable ? "text-[#22c55e]" : "text-[var(--md-gold)]"
								}`}
							>
								{isAvailable ? "Available" : "Rent"}
							</span>
						</li>
					);
				})}
			</ul>
		</div>
	);
}
