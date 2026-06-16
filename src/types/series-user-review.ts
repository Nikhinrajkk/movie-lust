export type SeriesUserReviewRow = {
	id: string;
	series_id: string;
	user_id: string;
	stars: number | null;
	comment: string;
	author_display_name: string;
	created_at: string;
	updated_at: string;
};

export type SeriesUserReviewAggregate = {
	avgStars: number | null;
	ratingCount: number;
};
