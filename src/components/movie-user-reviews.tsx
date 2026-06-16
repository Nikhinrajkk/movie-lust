"use client";

import { useRouter } from "next/navigation";
import { useMemo, useState, useTransition } from "react";
import {
	deleteMovieUserReview,
	upsertMovieUserReview,
} from "@/app/actions/movie-user-reviews";
import {
	deleteSeriesUserReview,
	upsertSeriesUserReview,
} from "@/app/actions/series-user-reviews";
import { StarMeter, StarMeterSlot } from "@/components/star-meter";
import { ratingAfterStarClick, starFillFraction } from "@/lib/user-star-rating";
import type { MovieUserReviewRow } from "@/types/movie-user-review";
import type { SeriesUserReviewRow } from "@/types/series-user-review";

const NOTE_MAX = 500;

type ReviewRow = {
	id: string;
	user_id: string;
	stars: number | null;
	comment: string;
	author_display_name: string;
	created_at: string;
};

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
							className="rounded-md p-0.5 text-[var(--md-star-empty)] transition hover:opacity-90 disabled:opacity-50"
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
					className="mdc-clear-stars disabled:opacity-50"
				>
					Clear stars
				</button>
			) : null}
		</div>
	);
}

function CatalogueUserReviewsClient({
	entityId,
	reviews,
	currentUserId,
	isAdmin,
	initialStars,
	initialComment,
	upsertReview,
	deleteReview,
	commentFieldId,
}: {
	entityId: string;
	reviews: ReviewRow[];
	currentUserId: string | null;
	isAdmin: boolean;
	initialStars: number | null;
	initialComment: string;
	upsertReview: (
		input: { stars: number | null; comment: string },
	) => Promise<void>;
	deleteReview: (reviewId: string) => Promise<void>;
	commentFieldId: string;
}) {
	const router = useRouter();
	const [pending, start] = useTransition();
	const [stars, setStars] = useState<number | null>(initialStars);
	const [comment, setComment] = useState(initialComment.slice(0, NOTE_MAX));
	const [error, setError] = useState<string | null>(null);

	const canSubmit = useMemo(() => {
		return (stars != null && stars >= 0.5) || comment.trim().length > 0;
	}, [stars, comment]);

	const signedIn = Boolean(currentUserId);

	return (
		<div className="space-y-3">
			<p className="mdc-prose text-sm leading-[1.8]">
				Click a star once for a half star, again for a full star (up to 5). You can also
				leave a short note.
			</p>

			{error ? (
				<p className="mdc-error text-sm leading-[1.8]" role="alert">
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
								await upsertReview({ stars, comment });
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
						<span className="mdc-label text-xs font-semibold uppercase tracking-wider">
							Your rating
						</span>
						<StarPicker value={stars} onChange={setStars} disabled={pending} />
					</div>
					<div className="space-y-2">
						<label
							htmlFor={commentFieldId}
							className="mdc-label text-xs font-semibold uppercase tracking-wider"
						>
							Your note
						</label>
						<div className="relative">
							<textarea
								id={commentFieldId}
								name="comment"
								rows={4}
								maxLength={NOTE_MAX}
								disabled={pending}
								value={comment}
								onChange={(e) => setComment(e.target.value.slice(0, NOTE_MAX))}
								placeholder="What did you think?"
								className="mdc-textarea w-full resize-y rounded-lg px-3 py-2.5 pr-14 text-sm leading-[1.8] outline-none disabled:opacity-60"
							/>
							<span className="mdc-label pointer-events-none absolute bottom-2 right-2 text-xs tabular-nums">
								{comment.length}/{NOTE_MAX}
							</span>
						</div>
					</div>
					<button
						type="submit"
						disabled={pending || !canSubmit}
						className="mdc-btn-gold font-sans disabled:pointer-events-none"
					>
						{pending ? "Saving…" : "Save"}
					</button>
				</form>
			) : (
				<p className="mdc-prose text-sm leading-[1.8]">
					Sign in to add your rating or comment.
				</p>
			)}

			<div className="mdc-divider space-y-2 border-t pt-3">
				<h3 className="mdc-label text-xs font-semibold uppercase tracking-wider">
					From the community
				</h3>
				{reviews.length === 0 ? (
					<p className="mdc-prose text-sm leading-[1.8]">
						No reviews yet — be the first.
					</p>
				) : (
					<ul className="space-y-4">
						{reviews.map((r) => {
							const mine = currentUserId != null && r.user_id === currentUserId;
							const canRemove = isAdmin || mine;
							const starVal = r.stars == null ? null : Number(r.stars);
							return (
								<li key={r.id} className="space-y-2">
									<div className="flex flex-wrap items-start justify-between gap-2">
										<div>
											<p className="mdc-section-title text-sm font-semibold">
												{r.author_display_name || "Member"}
											</p>
											<p className="mdc-label text-xs">
												{new Date(r.created_at).toLocaleString("en-US", {
													dateStyle: "medium",
													timeStyle: "short",
												})}
											</p>
										</div>
										{canRemove ? (
											<button
												type="button"
												className="mdc-btn-remove font-sans disabled:opacity-50"
												disabled={pending}
												onClick={() =>
													start(async () => {
														setError(null);
														try {
															await deleteReview(r.id);
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
											</button>
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
										<p className="mdc-review-quote whitespace-pre-wrap text-sm leading-[1.8]">
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
	return (
		<CatalogueUserReviewsClient
			entityId={movieId}
			reviews={reviews}
			currentUserId={currentUserId}
			isAdmin={isAdmin}
			initialStars={initialStars}
			initialComment={initialComment}
			commentFieldId="movie-user-review-comment"
			upsertReview={(input) => upsertMovieUserReview(movieId, input)}
			deleteReview={(reviewId) => deleteMovieUserReview(reviewId, movieId)}
		/>
	);
}

export function SeriesUserReviewsClient({
	seriesId,
	reviews,
	currentUserId,
	isAdmin,
	initialStars,
	initialComment,
}: {
	seriesId: string;
	reviews: SeriesUserReviewRow[];
	currentUserId: string | null;
	isAdmin: boolean;
	initialStars: number | null;
	initialComment: string;
}) {
	return (
		<CatalogueUserReviewsClient
			entityId={seriesId}
			reviews={reviews}
			currentUserId={currentUserId}
			isAdmin={isAdmin}
			initialStars={initialStars}
			initialComment={initialComment}
			commentFieldId="series-user-review-comment"
			upsertReview={(input) => upsertSeriesUserReview(seriesId, input)}
			deleteReview={(reviewId) => deleteSeriesUserReview(reviewId, seriesId)}
		/>
	);
}
