"use client";

import { useSearchParams } from "next/navigation";
import { useScrollToTopOnChange } from "@/lib/use-scroll-to-top-on-change";

/** Scrolls to the top when admin list page / tab / page-size / search changes. */
export function AdminScrollToTop() {
  const searchParams = useSearchParams();
  const page = searchParams.get("page") ?? "1";
  const perPage = searchParams.get("perPage") ?? "10";
  const tab = searchParams.get("tab") ?? "pending";
  const q = searchParams.get("q") ?? "";

  useScrollToTopOnChange([page, perPage, tab, q]);

  return null;
}
