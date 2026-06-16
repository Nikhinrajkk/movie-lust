"use client";

import { useEffect, useRef } from "react";
import { scheduleScrollPageToTop } from "@/lib/scroll-page-to-top";

/**
 * Scroll to top when any dependency changes (e.g. page, pageSize).
 * Skips the first run so direct loads / hydration don't jump.
 */
export function useScrollToTopOnChange(deps: readonly unknown[]) {
  const skipInitial = useRef(true);

  useEffect(() => {
    if (skipInitial.current) {
      skipInitial.current = false;
      return;
    }
    return scheduleScrollPageToTop();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, deps);
}

/**
 * For client-fetched lists: re-scroll after loading finishes so late content
 * doesn't leave the viewport partway down.
 */
export function useScrollToTopAfterLoad(
  loading: boolean,
  scrollKey: unknown,
) {
  const pending = useRef(false);
  const skipInitial = useRef(true);

  useEffect(() => {
    if (skipInitial.current) {
      skipInitial.current = false;
      return;
    }
    pending.current = true;
    return scheduleScrollPageToTop();
  }, [scrollKey]);

  useEffect(() => {
    if (!pending.current || loading) return;
    pending.current = false;
    return scheduleScrollPageToTop();
  }, [loading, scrollKey]);
}
