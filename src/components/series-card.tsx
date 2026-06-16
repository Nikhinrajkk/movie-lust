import Image from "next/image";
import Link from "next/link";
import { WatchProviderIcon } from "@/components/watch-provider-icon";
import {
  formatGenreLabel,
  getWatchProviderBySlug,
} from "@/types/movie";
import type { SeriesRow } from "@/types/series";
import { SERIES_STATUSES } from "@/types/series";

function posterSrc(url: string | null) {
  if (url && url.trim().length > 0) return url;
  return "https://placehold.co/400x600/e5e5e5/737373?text=No+poster";
}

function formatSeasonEpisode(
  seasonCount: number | null,
  episodeCount: number | null,
): string | null {
  const parts: string[] = [];
  if (seasonCount != null && seasonCount > 0) {
    parts.push(`${seasonCount} season${seasonCount === 1 ? "" : "s"}`);
  }
  if (episodeCount != null && episodeCount > 0) {
    parts.push(`${episodeCount} ep${episodeCount === 1 ? "" : "s"}`);
  }
  return parts.length > 0 ? parts.join(" · ") : null;
}

function statusLabel(status: SeriesRow["status"]) {
  return SERIES_STATUSES.find((s) => s.value === status)?.label ?? status;
}

export function SeriesCard({ series }: { series: SeriesRow }) {
  const metaBits: string[] = [];
  if (series.start_year != null) metaBits.push(String(series.start_year));
  const creator = series.creator?.trim() || series.director?.trim();
  if (creator) metaBits.push(creator);
  const seasonEp = formatSeasonEpisode(
    series.season_count,
    series.episode_count,
  );
  if (seasonEp) metaBits.push(seasonEp);
  if (series.language?.trim()) metaBits.push(series.language.trim());

  const watch = getWatchProviderBySlug(series.watch_provider ?? null);

  return (
    <Link
      href={`/series/${series.id}`}
      className="group relative flex min-w-0 flex-col overflow-hidden rounded-xl border border-[var(--md-border)] bg-[var(--app-surface)] shadow-sm transition hover:-translate-y-0.5 hover:border-[var(--md-gold)]/40 hover:shadow-md"
    >
      <div className="relative aspect-[2/3] w-full overflow-hidden bg-[var(--app-surface-muted)]">
        <Image
          src={posterSrc(series.poster_url)}
          alt={series.title}
          fill
          sizes="(max-width: 640px) 45vw, (max-width: 1024px) 22vw, 18vw"
          className="object-cover transition duration-500 group-hover:scale-105"
          unoptimized={
            posterSrc(series.poster_url).includes("placehold.co") ? true : false
          }
        />
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-t from-black/55 via-transparent to-transparent" />
        {(series.approval_status === "pending" ||
          series.approval_status === "rejected") && (
          <div className="absolute bottom-12 left-1.5 rounded bg-amber-400 px-1.5 py-0.5 text-[9px] font-bold uppercase tracking-wide text-amber-950">
            {series.approval_status === "pending" ? "Pending" : "Rejected"}
          </div>
        )}
        {series.status !== "ended" && (
          <div className="absolute left-1.5 top-1.5 rounded-md bg-black/60 px-1.5 py-0.5 text-[9px] font-bold uppercase tracking-wide text-white shadow-sm ring-1 ring-white/10 backdrop-blur-sm">
            {statusLabel(series.status)}
          </div>
        )}
        {series.rating != null && (
          <div className="absolute right-1.5 top-1.5 rounded-md bg-black/60 px-1.5 py-0.5 text-[10px] font-bold text-white shadow-sm ring-1 ring-white/10 backdrop-blur-sm">
            {series.rating.toFixed(1)}
            <span className="font-medium text-white/60">/10</span>
          </div>
        )}
      </div>
      <div className="flex flex-1 flex-col gap-1.5 p-3">
        <h3 className="line-clamp-2 text-sm font-bold leading-snug text-[var(--md-title)] group-hover:text-[var(--bms-red)]">
          {series.title}
        </h3>
        {metaBits.length > 0 && (
          <p className="line-clamp-2 text-[10px] text-[var(--md-text-muted)]">
            {metaBits.join(" · ")}
          </p>
        )}
        <p className="line-clamp-2 text-[11px] leading-snug text-[var(--md-text-muted)]">
          {series.overview || series.review_text || "No synopsis yet."}
        </p>
        <div className="mt-auto flex flex-col gap-1.5 pt-0.5">
          {series.genres?.length > 0 && (
            <div className="flex flex-wrap gap-1">
              {series.genres.slice(0, 3).map((g) => (
                <span
                  key={g}
                  className="rounded border border-[var(--md-border)] bg-[var(--app-surface-muted)] px-1.5 py-0.5 text-[9px] text-[var(--md-text-muted)]"
                >
                  {formatGenreLabel(g)}
                </span>
              ))}
            </div>
          )}
          {watch && (
            <div className="flex items-center gap-1.5 border-t border-[var(--md-border)] pt-1.5">
              <span className="text-[9px] font-medium uppercase tracking-wide text-[var(--md-text-muted)]">
                Watch
              </span>
              <WatchProviderIcon
                slug={watch.slug}
                className="h-4 w-auto max-w-[5rem] shrink-0 object-contain object-left"
                title={watch.label}
              />
            </div>
          )}
        </div>
      </div>
    </Link>
  );
}
