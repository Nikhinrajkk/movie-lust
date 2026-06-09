export type MovieUserReviewRow = {
	id: string;
	movie_id: string;
	user_id: string;
	stars: number | null;
	comment: string;
	author_display_name: string;
	created_at: string;
	updated_at: string;
};

export type MovieUserReviewAggregate = {
	avgStars: number | null;
	ratingCount: number;
};
