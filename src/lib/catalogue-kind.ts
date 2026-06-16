export type CatalogueKind = "movies" | "series";

export function catalogueKindFromPathname(pathname: string): CatalogueKind {
  return pathname.startsWith("/series") ? "series" : "movies";
}

export function addHrefForKind(kind: CatalogueKind): string {
  return kind === "series" ? "/series/new" : "/movies/new";
}

export function browseHrefForKind(kind: CatalogueKind): string {
  return kind === "series" ? "/series" : "/";
}
