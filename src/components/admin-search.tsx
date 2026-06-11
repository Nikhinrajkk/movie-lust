"use client";

import { useEffect, useState } from "react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { FieldLabel } from "@/components/ui/label";

const SEARCH_DEBOUNCE_MS = 320;

function buildAdminUrl(
  pathname: string,
  params: URLSearchParams,
  search: string,
): string {
  const next = new URLSearchParams(params.toString());
  const trimmed = search.trim();
  if (trimmed) next.set("q", trimmed);
  else next.delete("q");
  next.delete("page");
  const q = next.toString();
  return q ? `${pathname}?${q}` : pathname;
}

export function AdminSearch({
  initialSearch,
  tab,
}: {
  initialSearch: string;
  tab: "pending" | "approved" | "rejected" | "users";
}) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const [draftSearch, setDraftSearch] = useState(initialSearch);

  useEffect(() => {
    setDraftSearch(initialSearch);
  }, [initialSearch]);

  useEffect(() => {
    const trimmed = draftSearch.trim();
    const applied = initialSearch.trim();
    if (trimmed === applied) return;

    const id = window.setTimeout(() => {
      router.replace(buildAdminUrl(pathname, searchParams, trimmed), { scroll: false });
    }, SEARCH_DEBOUNCE_MS);

    return () => window.clearTimeout(id);
  }, [draftSearch, initialSearch, pathname, router, searchParams]);

  if (tab === "users") return null;

  const placeholder =
    tab === "pending"
      ? "Search pending submissions…"
      : tab === "rejected"
        ? "Search rejected titles…"
        : "Search approved catalogue…";

  return (
    <div className="relative min-w-0">
      <FieldLabel htmlFor="admin-search" className="sr-only">
        Search admin list
      </FieldLabel>
      <span
        className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-[var(--md-input-placeholder)]"
        aria-hidden
      >
        <svg
          className="size-4"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          strokeWidth={2}
          aria-hidden="true"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
          />
        </svg>
      </span>
      <input
        id="admin-search"
        type="search"
        value={draftSearch}
        onChange={(e) => setDraftSearch(e.target.value)}
        onBlur={() => {
          const trimmed = draftSearch.trim();
          if (trimmed !== initialSearch.trim()) {
            router.replace(buildAdminUrl(pathname, searchParams, trimmed), {
              scroll: false,
            });
          }
        }}
        placeholder={placeholder}
        className="box-border h-10 w-full min-w-0 rounded-lg border border-[var(--md-input-border)] bg-[var(--md-input-bg)] py-0 pl-9 pr-3 text-sm font-medium leading-10 text-[var(--md-input-fg)] outline-none transition placeholder:text-[var(--md-input-placeholder)] focus:border-[var(--md-gold)] focus:ring-2 focus:ring-[var(--md-gold-soft)]"
      />
    </div>
  );
}
