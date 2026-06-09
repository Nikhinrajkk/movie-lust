"use client";

import { useRouter } from "next/navigation";
import { useMemo, useState, useTransition } from "react";
import {
	deleteMovieUserReview,
	upsertMovieUserReview,
} from "@/app/actions/movie-user-reviews";
import { Button } from "@/components/ui/button";
import type { MovieUserReviewRow } from "@/types/movie-user-review";

function IconStar({ className, filled }: { className?: string; filled?: boolean }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill={filled ? "currentColor" : "none"}
			stroke="currentColor"
			strokeWidth={filled ? 0 : 1.5}
			aria-hidden
		>
			<title>Star</title>
			<path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
		</svg>
	);
}

function StarPicker({
	value,
	onChange,
	disabled,
}: {
	value: number | null;
	onChange: (n: number | null) => void;
	disabled?: boolean;
}) {
	return (
		<div className="flex flex-wrap items-center gap-2">
			<fieldset
				disabled={disabled}
				className="m-0 flex min-w-0 items-center gap-1 border-0 p-0"
			>
				<legend className="sr-only">Your star rating</legend>
				{([1, 2, 3, 4, 5] as const).map((n) => {
					const active = value != null && n <= value;
					return (
						<button
							key={n}
							type="button"
							disabled={disabled}
							onClick={() => onChange(n)}
							className={`rounded-md p-1 transition ${
								active ? "text-amber-500" : "text-gray-300 hover:text-amber-300"
							} disabled:opacity-50`}
							aria-label={`${n} star${n === 1 ? "" : "s"}`}
							aria-pressed={active}
						>
							<IconStar className="size-7 sm:size-8" filled={active} />
						</button>
					);
				})}
			</fieldset>
			{value != null ? (
				<button
					type="button"
					disabled={disabled}
					onClick={() => onChange(null)}
					className="text-xs font-medium text-gray-500 underline-offset-2 hover:text-gray-800 hover:underline disabled:opacity-50"
				>
					Clear stars
				</button>
			) : null}
		</div>
	);
}

function ReviewStarsRow({ stars }: { stars: number }) {
	const s = Math.min(5, Math.max(1, Math.round(stars)));
	return (
		<div className="flex gap-0.5" role="img" aria-label={`${s} out of 5 stars`}>
			{([1, 2, 3, 4, 5] as const).map((i) => (
				<IconStar
					key={i}
					className={`size-4 sm:size-5 ${i <= s ? "text-amber-400" : "text-gray-200"}`}
					filled={i <= s}
				/>
			))}
		</div>
	);
}

export function MovieUserReviewsClient({
	movieId,
	reviews,
	currentUserId,
	isAdmin,
	initialStars,
	initialComment,
}: {
	movieId: string;
	reviews: MovieUserReviewRow[];
	currentUserId: string | null;
	isAdmin: boolean;
	initialStars: number | null;
	initialComment: string;
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const [stars, setStars] = useState<number | null>(initialStars);
	const [comment, setComment] = useState(initialComment);
	const [error, setError] = useState<string | null>(null);

	const canSubmit = useMemo(() => {
		return (stars != null && stars >= 1) || comment.trim().length > 0;
	}, [stars, comment]);

	const signedIn = Boolean(currentUserId);

	return (
		<div className="space-y-3">
			<p className="text-sm leading-relaxed text-gray-700 sm:text-base">
				Add a 1–5 star rating and/or a short note. You can update your entry anytime.
			</p>

			{error ? (
				<p
					className="text-sm leading-relaxed text-red-800 sm:text-base"
					role="alert"
				>
					{error}
				</p>
			) : null}

			{signedIn ? (
				<form
					className="space-y-3"
					onSubmit={(e) => {
						e.preventDefault();
						start(async () => {
							setError(null);
							try {
								await upsertMovieUserReview(movieId, {
									stars,
									comment,
								});
								router.refresh();
							} catch (err) {
								setError(
									err instanceof Error ? err.message : "Could not save your review.",
								);
							}
						});
					}}
				>
					<div className="space-y-2">
						<span className="text-xs font-semibold uppercase tracking-wider text-gray-500">
							Your stars
						</span>
						<StarPicker value={stars} onChange={setStars} disabled={pending} />
					</div>
					<div className="space-y-2">
						<label
							htmlFor="movie-user-review-comment"
							className="text-xs font-semibold uppercase tracking-wider text-gray-500"
						>
							Your note
						</label>
						<textarea
							id="movie-user-review-comment"
							name="comment"
							rows={4}
							maxLength={4000}
							disabled={pending}
							value={comment}
							onChange={(e) => setComment(e.target.value)}
							placeholder="What did you think?"
							className="w-full resize-y rounded-lg border border-gray-200 bg-white px-3 py-2.5 text-sm leading-relaxed text-gray-800 shadow-sm outline-none placeholder:text-gray-400 focus:border-violet-300 focus:ring-2 focus:ring-violet-100 disabled:opacity-60 sm:text-base"
						/>
					</div>
					<Button type="submit" disabled={pending || !canSubmit}>
						{pending ? "Saving…" : "Save"}
					</Button>
				</form>
			) : (
				<p className="text-sm leading-relaxed text-gray-700 sm:text-base">
					Sign in to add your rating or comment.
				</p>
			)}

			<div className="space-y-2 border-t border-gray-100 pt-3">
				<h3 className="text-xs font-semibold uppercase tracking-wider text-gray-500">
					From the community
				</h3>
				{reviews.length === 0 ? (
					<p className="text-sm leading-relaxed text-gray-700 sm:text-base">
						No reviews yet — be the first.
					</p>
				) : (
					<ul className="space-y-4">
						{reviews.map((r) => {
							const mine = currentUserId != null && r.user_id === currentUserId;
							const canRemove = isAdmin || mine;
							return (
								<li key={r.id} className="space-y-2">
									<div className="flex flex-wrap items-start justify-between gap-2">
										<div>
											<p className="text-sm font-semibold text-gray-900">
												{r.author_display_name || "Member"}
											</p>
											<p className="text-xs text-gray-500">
												{new Date(r.created_at).toLocaleString(undefined, {
													dateStyle: "medium",
													timeStyle: "short",
												})}
											</p>
										</div>
										{canRemove ? (
											<Button
												type="button"
												variant="ghost"
												className="shrink-0 px-2 py-1.5 text-xs text-red-700 hover:bg-red-50"
												disabled={pending}
												onClick={() =>
													start(async () => {
														setError(null);
														try {
															await deleteMovieUserReview(r.id, movieId);
															router.refresh();
														} catch (err) {
															setError(
																err instanceof Error
																	? err.message
																	: "Could not remove this entry.",
															);
														}
													})
												}
											>
												Remove
											</Button>
										) : null}
									</div>
									{r.stars != null ? (
										<div>
											<ReviewStarsRow stars={r.stars} />
										</div>
									) : null}
									{r.comment.trim() ? (
										<p className="whitespace-pre-wrap text-sm leading-relaxed text-gray-800 sm:text-base">
											{r.comment.trim()}
										</p>
									) : null}
								</li>
							);
						})}
					</ul>
				)}
			</div>
		</div>
	);
}
