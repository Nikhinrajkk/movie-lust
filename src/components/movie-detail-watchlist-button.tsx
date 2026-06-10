"use client";

import { useCallback, useEffect, useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { addToWatchlist, removeFromWatchlist } from "@/app/actions/watchlist";
import { markMovieWatched, unmarkMovieWatched } from "@/app/actions/watched";

/* ─── Watchlist button ───────────────────────────────────────────────── */

export function MovieDetailWatchlistButton({
	movieId,
	initialInList,
}: {
	movieId: string;
	initialInList: boolean;
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const [inList, setInList] = useState(initialInList);
	const [pop, setPop] = useState(false);
	const [ringToken, setRingToken] = useState(0);
	const initialRef = useRef(initialInList);

	useEffect(() => {
		initialRef.current = initialInList;
		setInList(initialInList);
	}, [initialInList]);

	const triggerPop = useCallback(() => {
		setPop(true);
		window.setTimeout(() => setPop(false), 520);
	}, []);

	function handleClick() {
		if (pending) return;
		const was = inList;
		const next = !inList;
		setInList(next);
		if (!was && next) {
			setRingToken((t) => t + 1);
			triggerPop();
		} else {
			triggerPop();
		}
		start(async () => {
			try {
				if (was) await removeFromWatchlist(movieId);
				else await addToWatchlist(movieId);
				router.refresh();
			} catch {
				setInList(initialRef.current);
			}
		});
	}

	const label = inList ? "Remove from Watchlist" : "Add to Watchlist";

	return (
		<div className="relative">
			{/* ring-out animation on add */}
			{ringToken > 0 && inList && (
				<span key={ringToken} className="pointer-events-none absolute inset-0 rounded-2xl" aria-hidden>
					<span className="watchlist-heart-ring absolute inset-0 rounded-2xl border-2 border-[var(--md-gold)]/70" />
				</span>
			)}
			<button
				type="button"
				aria-label={label}
				aria-pressed={inList}
				disabled={pending}
				onClick={handleClick}
				className={[
					"relative flex w-full items-center justify-center gap-2.5 rounded-2xl border py-3 text-sm font-semibold transition-all duration-150",
					"disabled:cursor-not-allowed disabled:opacity-50",
					pop ? "watchlist-heart-pop" : "",
					inList
						? "border-rose-500/60 bg-rose-500/10 text-rose-400 hover:bg-rose-500/20"
						: "border-[var(--md-gold)] bg-transparent text-[var(--md-gold)] hover:bg-[var(--md-gold-soft)]",
				]
					.filter(Boolean)
					.join(" ")}
			>
				{pending ? (
					<svg className="size-4 animate-spin" viewBox="0 0 24 24" fill="none" aria-hidden={true}>
						<circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
						<path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
					</svg>
				) : inList ? (
					<svg className="size-4 shrink-0" viewBox="0 0 24 24" fill="currentColor" aria-label="Saved">
						<path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
					</svg>
				) : (
					<svg className="size-4 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-label="Add">
						<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
					</svg>
				)}
				{pending ? "Saving…" : inList ? "In Watchlist · Remove" : "Add to Watchlist"}
			</button>
		</div>
	);
}

/* ─── Watched button ─────────────────────────────────────────────────── */

export function MovieDetailWatchedButton({
	movieId,
	initialWatched,
}: {
	movieId: string;
	initialWatched: boolean;
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const [watched, setWatched] = useState(initialWatched);
	const [pop, setPop] = useState(false);
	const initialRef = useRef(initialWatched);

	useEffect(() => {
		initialRef.current = initialWatched;
		setWatched(initialWatched);
	}, [initialWatched]);

	const triggerPop = useCallback(() => {
		setPop(true);
		window.setTimeout(() => setPop(false), 520);
	}, []);

	function handleClick() {
		if (pending) return;
		const was = watched;
		setWatched(!was);
		triggerPop();
		start(async () => {
			try {
				if (was) await unmarkMovieWatched(movieId);
				else await markMovieWatched(movieId);
				router.refresh();
			} catch {
				setWatched(initialRef.current);
			}
		});
	}

	const label = watched ? "Mark as not watched" : "Mark as watched";

	return (
		<button
			type="button"
			aria-label={label}
			aria-pressed={watched}
			disabled={pending}
			onClick={handleClick}
			className={[
				"mdc-link-row flex w-full items-center justify-between gap-2.5 rounded-xl border px-3 py-3 text-left text-sm font-medium transition-all duration-150 disabled:cursor-not-allowed disabled:opacity-50 sm:px-4",
				pop ? "round-media-pop" : "",
				watched ? "border-emerald-500/50 bg-emerald-500/10 text-emerald-400 hover:bg-emerald-500/20" : "",
			]
				.filter(Boolean)
				.join(" ")}
		>
			<span className="flex items-center gap-2.5">
				{pending ? (
					<svg className="size-4 animate-spin" viewBox="0 0 24 24" fill="none" aria-hidden={true}>
						<circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
						<path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
					</svg>
				) : watched ? (
					<svg className="size-4 shrink-0 text-emerald-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-label="Watched">
						<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
					</svg>
				) : (
					<svg className="size-4 shrink-0 text-[var(--md-gold)]" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-label="Not watched">
						<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7-10-7-10-7z" />
						<circle cx="12" cy="12" r="3.25" stroke="currentColor" strokeWidth={1.75} />
					</svg>
				)}
				{pending ? "Saving…" : watched ? "Watched · Unmark" : "Mark as Watched"}
			</span>
		</button>
	);
}
