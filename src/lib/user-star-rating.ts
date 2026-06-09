const EPS = 1e-6;

/** Snap to nearest half step in [0.5, 5], or null if unusable. */
export function normalizeHalfStarRating(raw: number | null): number | null {
	if (raw == null || !Number.isFinite(raw)) return null;
	const stepped = Math.round(raw * 2) / 2;
	if (stepped < 0.5 || stepped > 5) return null;
	return stepped;
}

/**
 * Star buttons are indexed 1–5. First click on star `n` sets (n−0.5); second sets `n`;
 * further clicks on the same star toggle between half and full for that position.
 * Clicks on other stars follow the same half/full rules relative to current value.
 */
export function ratingAfterStarClick(
	n: number,
	current: number | null,
): number {
	const h = n - 0.5;
	const f = n;
	if (current == null || !Number.isFinite(current)) return h;
	const v = current;
	if (Math.abs(v - h) < EPS) return f;
	if (Math.abs(v - f) < EPS) return h;
	if (v < h - EPS) return h;
	if (v < f - EPS) return f;
	return f;
}

/** Fill fraction [0,1] for star index 1..5 at rating `value` (0..5). */
export function starFillFraction(starIndex: number, value: number): number {
	return Math.min(1, Math.max(0, value - (starIndex - 1)));
}
