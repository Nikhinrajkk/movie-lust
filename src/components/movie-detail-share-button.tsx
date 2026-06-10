"use client";

import { useCallback, useState } from "react";

export function MovieDetailShareButton({ title }: { title: string }) {
	const [done, setDone] = useState(false);

	const share = useCallback(async () => {
		setDone(false);
		const url = typeof window !== "undefined" ? window.location.href : "";
		try {
			if (navigator.share) {
				await navigator.share({ title, text: title, url });
				setDone(true);
				return;
			}
			await navigator.clipboard.writeText(url);
			setDone(true);
		} catch {
			setDone(false);
		}
	}, [title]);

	return (
		<button
			type="button"
			onClick={() => void share()}
			className="mdc-link-row flex w-full items-center gap-2.5 rounded-xl border px-3 py-3 text-left text-sm font-medium transition sm:px-4"
		>
			<svg className="size-4 shrink-0 text-[var(--md-gold)]" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
				<title>Share</title>
				<path
					strokeLinecap="round"
					strokeLinejoin="round"
					strokeWidth={2}
					d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m0-9a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"
				/>
			</svg>
			{done ? "Copied!" : "Share"}
		</button>
	);
}
