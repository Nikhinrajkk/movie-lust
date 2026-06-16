const SCROLL_DURATION_MS = 480;

/** ease-out cubic — fast start, gentle landing */
function easeOutCubic(t: number) {
  return 1 - (1 - t) ** 3;
}

function prefersReducedMotion() {
  if (typeof window === "undefined") return false;
  return window.matchMedia("(prefers-reduced-motion: reduce)").matches;
}

/** Instant scroll to the document top. */
export function scrollPageToTop(behavior: ScrollBehavior = "auto") {
  window.scrollTo({ top: 0, left: 0, behavior });
  if (behavior === "auto") {
    document.documentElement.scrollTop = 0;
    document.body.scrollTop = 0;
  }
}

function isNearPageTop(threshold = 2) {
  return window.scrollY <= threshold;
}

/** Animated scroll to top with easing; returns cancel fn. */
export function animateScrollPageToTop(duration = SCROLL_DURATION_MS): () => void {
  if (typeof window === "undefined") return () => {};

  if (prefersReducedMotion()) {
    scrollPageToTop("auto");
    return () => {};
  }

  const startY = window.scrollY;
  if (startY <= 2) return () => {};

  const start = performance.now();
  let raf = 0;

  const step = (now: number) => {
    const t = Math.min((now - start) / duration, 1);
    const nextY = startY * (1 - easeOutCubic(t));
    window.scrollTo(0, nextY);

    if (t < 1) {
      raf = requestAnimationFrame(step);
    } else {
      scrollPageToTop("auto");
    }
  };

  raf = requestAnimationFrame(step);
  return () => cancelAnimationFrame(raf);
}

/**
 * Scroll to top with animation when paginating.
 * Re-checks once after content may have reflowed.
 */
export function scheduleScrollPageToTop() {
  const cancelAnim = animateScrollPageToTop();

  const t = window.setTimeout(() => {
    if (!isNearPageTop()) {
      animateScrollPageToTop(Math.min(280, SCROLL_DURATION_MS));
    }
  }, 520);

  return () => {
    cancelAnim();
    window.clearTimeout(t);
  };
}
