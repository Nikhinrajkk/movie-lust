import type { AdminCatalogueKind } from "@/types/admin-catalogue";

export function CatalogueKindBadge({ kind }: { kind: AdminCatalogueKind }) {
  return (
    <span
      className={`inline-flex shrink-0 rounded-md px-1.5 py-0.5 text-[9px] font-bold uppercase tracking-wide ${
        kind === "series"
          ? "bg-violet-500/15 text-violet-700 dark:text-violet-300"
          : "bg-[var(--md-gold)]/15 text-[var(--md-gold)]"
      }`}
    >
      {kind === "series" ? "Series" : "Movie"}
    </span>
  );
}
