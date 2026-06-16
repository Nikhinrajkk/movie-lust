/** Scroll the document to the top (works across browsers / soft navigations). */
export function scrollPageToTop() {
  window.scrollTo({ top: 0, left: 0, behavior: "auto" });
  document.documentElement.scrollTop = 0;
  document.body.scrollTop = 0;
}

/** Scroll now and again after paint — helps when list content swaps in late. */
export function scheduleScrollPageToTop() {
  scrollPageToTop();

  const raf = requestAnimationFrame(() => {
    requestAnimationFrame(scrollPageToTop);
  });
  const t1 = window.setTimeout(scrollPageToTop, 50);
  const t2 = window.setTimeout(scrollPageToTop, 150);

  return () => {
    cancelAnimationFrame(raf);
    window.clearTimeout(t1);
    window.clearTimeout(t2);
  };
}
