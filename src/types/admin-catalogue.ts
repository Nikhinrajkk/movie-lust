import type { MovieRow } from "@/types/movie";
import type { SeriesRow } from "@/types/series";

export type AdminCatalogueKind = "movie" | "series";

export type AdminCatalogueItem =
  | { kind: "movie"; row: MovieRow }
  | { kind: "series"; row: SeriesRow };

export type AdminCataloguePageResult = {
  items: AdminCatalogueItem[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
};
