"use client";

export function MovieDetailTrailerPill({ title }: { title: string }) {
	const q = encodeURIComponent(`${title} trailer`);
	const href = `https://www.youtube.com/results?search_query=${q}`;
	return (
		<a
			href={href}
			target="_blank"
			rel="noopener noreferrer"
			className="mdc-trailer-btn"
		>
			<svg className="size-4 shrink-0" viewBox="0 0 24 24" fill="currentColor" aria-hidden>
				<title>Play</title>
				<path d="M8 5v14l11-7z" />
			</svg>
			Watch Trailer
		</a>
	);
}
