"use client";

import { useMemo } from "react";
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

  const pageSizeOptions = useMemo(() => {
    const base = [8, 15, 24, 48];
    return [...new Set([...base, pageSize])].sort((a, b) => a - b);
  }, [pageSize]);

  return (
    <div className="flex flex-wrap items-center justify-between gap-3 border-t border-gray-200 bg-white px-1 pt-5">
      <div className="flex flex-wrap items-center gap-3">
        <p className="text-xs font-medium text-gray-600">
          Page {page} of {totalPages}
        </p>
        <div className="flex items-center gap-2">
          <FieldLabel htmlFor="page-size" className="whitespace-nowrap text-xs text-gray-500">
            Per page
          </FieldLabel>
          <UiSelect
            value={String(pageSize)}
            onValueChange={(v) => setPageSize(Number(v))}
            disabled={disabled}
            id="page-size"
            aria-label="Results per page"
            triggerClassName="h-9 w-[4.5rem] rounded-lg px-2 py-1 text-xs"
            contentClassName="min-w-[4.5rem]"
          >
            {pageSizeOptions.map((n) => (
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
