/** HTML error pages (e.g. Cloudflare 521) sometimes surface as Postgrest `error.message`. */
export function isLikelyHtmlOrTransportBody(message: string): boolean {
  const m = message.trim();
  if (m.length > 800) return true;
  if (m.includes("<!DOCTYPE") || m.includes("<html")) return true;
  if (/^\s*</.test(m)) return true;
  return false;
}

export function sanitizeSupabaseErrorMessage(error: {
  message?: string | null;
}): string {
  const raw = String(error.message ?? "").trim();
  if (!raw) return "Database request failed.";
  if (isLikelyHtmlOrTransportBody(raw)) {
    return "Cannot reach the database right now. Please try again shortly.";
  }
  return raw.length > 500 ? `${raw.slice(0, 497)}…` : raw;
}

/** Server-side hint when Postgrest returns HTML (e.g. Cloudflare 521) instead of JSON. */
export function logSupabaseTransportFailure(scope: string): void {
  console.warn(`[${scope}] Supabase unreachable (non-JSON / HTML error body).`);
}
