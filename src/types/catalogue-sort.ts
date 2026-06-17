export const CATALOGUE_SORT_OPTIONS = [
  "title_asc",
  "rating_desc",
  "user_rating_desc",
  "year_desc",
] as const;

export type CatalogueSortOption = (typeof CATALOGUE_SORT_OPTIONS)[number];

export function isCatalogueSortOption(v: string | null): v is CatalogueSortOption {
  return (
    v === "title_asc" ||
    v === "rating_desc" ||
    v === "user_rating_desc" ||
    v === "year_desc"
  );
}
