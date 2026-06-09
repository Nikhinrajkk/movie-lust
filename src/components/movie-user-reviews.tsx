"use client";

import { useRouter } from "next/navigation";
import { useMemo, useState, useTransition } from "react";
import {
	deleteMovieUserReview,
	upsertMovieUserReview,
} from "@/app/actions/movie-user-reviews";
import { StarMeter, StarMeterSlot } from "@/components/star-meter";
import { Button } from "@/components/ui/button";
import { ratingAfterStarClick, starFillFraction } from "@/lib/user-star-rating";
import type { MovieUserReviewRow } from "@/types/movie-user-review";

function StarPicker({
	value,
	onChange,
	disabled,
}: {
	value: number | null;
	onChange: (n: number | null) => void;
	disabled?: boolean;
}) {
	const display = value ?? 0;
	return (
		<div className="flex flex-wrap items-center gap-2">
			<fieldset
				disabled={disabled}
				className="m-0 flex min-w-0 items-center gap-1 border-0 p-0"
			>
				<legend className="sr-only">Your star rating</legend>
				{([1, 2, 3, 4, 5] as const).map((n) => {
					const fill = starFillFraction(n, display);
					return (
						<button
							key={n}
							type="button"
							disabled={disabled}
							onClick={() => onChange(ratingAfterStarClick(n, value))}
							className="rounded-md p-0.5 text-gray-300 transition hover:text-amber-300 disabled:opacity-50"
							aria-label={`Star ${n} of 5`}
							aria-pressed={fill >= 1}
						>
							<StarMeterSlot fill={fill} className="size-7 sm:size-8" />
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
		return (stars != null && stars >= 0.5) || comment.trim().length > 0;
	}, [stars, comment]);

	const signedIn = Boolean(currentUserId);

	return (
		<div className="space-y-3">
			<p className="text-sm leading-relaxed text-gray-700 sm:text-base">
				Click a star once for a half star, again for a full star (up to 5). You can also
				leave a short note.
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
							const starVal =
								r.stars == null ? null : Number(r.stars);
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
									{starVal != null && Number.isFinite(starVal) ? (
										<div>
											<StarMeter
												value={starVal}
												starClassName="size-4 sm:size-5"
												ariaLabel={`${starVal} out of 5 stars`}
											/>
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
