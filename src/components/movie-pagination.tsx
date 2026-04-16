"use client";

import { useMovieFilters } from "@/stores/movie-filters";
import { Button } from "@/components/ui/button";
import { FieldLabel } from "@/components/ui/label";
import { UiSelect, UiSelectItem } from "@/components/ui/select";

export function MoviePagination({
  page,
  totalPages,
  disabled,
}: {
  page: number;
  totalPages: number;
  disabled?: boolean;
}) {
  const setPage = useMovieFilters((s) => s.setPage);
  const pageSize = useMovieFilters((s) => s.pageSize);
  const setPageSize = useMovieFilters((s) => s.setPageSize);

  return (
    <div className="flex flex-wrap items-center justify-between gap-3 border-t border-zinc-800 pt-6">
      <div className="flex flex-wrap items-center gap-3">
        <p className="text-xs text-zinc-500">
          Page {page} of {totalPages}
        </p>
        <div className="flex items-center gap-2">
          <FieldLabel htmlFor="page-size" className="whitespace-nowrap text-xs text-zinc-500">
            Per page
          </FieldLabel>
          <UiSelect
            value={String(pageSize)}
            onValueChange={(v) => setPageSize(Number(v))}
            disabled={disabled}
            id="page-size"
            aria-label="Results per page"
            triggerClassName="h-9 w-[4.5rem] border-zinc-700 bg-zinc-900 px-2 py-1 text-xs"
            contentClassName="min-w-[4.5rem]"
          >
            {[8, 12, 16, 24].map((n) => (
              <UiSelectItem key={n} value={String(n)}>
                {n}
              </UiSelectItem>
            ))}
          </UiSelect>
        </div>
      </div>
      <div className="flex gap-2">
        <Button
          type="button"
          variant="secondary"
          disabled={disabled || page <= 1}
          onClick={() => setPage(Math.max(1, page - 1))}
        >
          Previous
        </Button>
        <Button
          type="button"
          variant="secondary"
          disabled={disabled || page >= totalPages}
          onClick={() => setPage(Math.min(totalPages, page + 1))}
        >
          Next
        </Button>
      </div>
    </div>
  );
}
