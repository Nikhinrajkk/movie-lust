"use client";

import { useActionState } from "react";
import type { SeriesFormState } from "@/app/actions/series";
import { Button } from "@/components/ui/button";
import { FormCheckbox } from "@/components/ui/checkbox";
import { FieldLabel } from "@/components/ui/label";
import {
  GENRE_OPTIONS,
  WATCH_PROVIDERS,
  formatGenreLabel,
} from "@/types/movie";
import type { SeriesRow } from "@/types/series";
import { SERIES_STATUSES } from "@/types/series";

type Action = (
  prev: SeriesFormState,
  formData: FormData,
) => Promise<SeriesFormState>;

const inputClass =
  "w-full rounded-xl border border-[var(--md-input-border)] bg-[var(--md-input-bg)] px-3 py-2.5 text-sm text-[var(--md-input-fg)] outline-none placeholder:text-[var(--md-input-placeholder)] focus:border-[var(--md-gold)] focus:ring-2 focus:ring-[var(--md-gold-soft)]";

function dateInputValue(value: string | null | undefined) {
  if (!value) return "";
  return value.slice(0, 10);
}

export function SeriesForm({
  action,
  series,
}: {
  action: Action;
  series?: SeriesRow | null;
}) {
  const [state, formAction, pending] = useActionState(action, {});

  return (
    <form action={formAction} className="mx-auto max-w-2xl space-y-6">
      {series?.id ? <input type="hidden" name="id" value={series.id} /> : null}
      <input
        type="hidden"
        name="category"
        value={series?.category ?? "trending"}
      />
      {state.error && (
        <div className="mdc-moderation-rejected rounded-xl px-4 py-3 text-sm">
          {state.error}
        </div>
      )}
      <div className="grid gap-6 sm:grid-cols-2">
        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-title">Title</FieldLabel>
          <input
            id="series-title"
            name="title"
            required
            defaultValue={series?.title ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-creator">Creator / showrunner</FieldLabel>
          <input
            id="series-creator"
            name="creator"
            defaultValue={series?.creator ?? ""}
            placeholder="e.g. Vince Gilligan"
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-director">Director</FieldLabel>
          <input
            id="series-director"
            name="director"
            defaultValue={series?.director ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-network">Network / platform</FieldLabel>
          <input
            id="series-network"
            name="network"
            defaultValue={series?.network ?? ""}
            placeholder="e.g. HBO, Netflix"
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-language">Language</FieldLabel>
          <input
            id="series-language"
            name="language"
            defaultValue={series?.language ?? ""}
            placeholder="e.g. English"
            className={inputClass}
          />
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-watch-provider">
            Where to watch (OTT)
          </FieldLabel>
          <select
            id="series-watch-provider"
            name="watch_provider"
            defaultValue={series?.watch_provider ?? ""}
            className={inputClass}
          >
            <option value="">Not listed</option>
            {WATCH_PROVIDERS.map((p) => (
              <option key={p.slug} value={p.slug}>
                {p.label}
              </option>
            ))}
          </select>
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-poster">Poster URL</FieldLabel>
          <input
            id="series-poster"
            name="poster_url"
            type="url"
            defaultValue={series?.poster_url ?? ""}
            placeholder="https://image.tmdb.org/..."
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-start-date">First air date</FieldLabel>
          <input
            id="series-start-date"
            name="start_date"
            type="date"
            defaultValue={dateInputValue(series?.start_date)}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-end-date">Last air date</FieldLabel>
          <input
            id="series-end-date"
            name="end_date"
            type="date"
            defaultValue={dateInputValue(series?.end_date)}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-start-year">Start year</FieldLabel>
          <input
            id="series-start-year"
            name="start_year"
            type="number"
            min={1888}
            max={2100}
            defaultValue={series?.start_year ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-end-year">End year</FieldLabel>
          <input
            id="series-end-year"
            name="end_year"
            type="number"
            min={1888}
            max={2100}
            defaultValue={series?.end_year ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-seasons">Seasons</FieldLabel>
          <input
            id="series-seasons"
            name="season_count"
            type="number"
            min={0}
            defaultValue={series?.season_count ?? ""}
            className={inputClass}
          />
        </div>

        <div className="space-y-2">
          <FieldLabel htmlFor="series-status">Status</FieldLabel>
          <select
            id="series-status"
            name="status"
            defaultValue={series?.status ?? "ended"}
            className={inputClass}
          >
            {SERIES_STATUSES.map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </select>
        </div>

        <div className="space-y-2 sm:col-span-2">
          <FieldLabel htmlFor="series-rating">Your rating (0–10)</FieldLabel>
          <input
            id="series-rating"
            name="rating"
            type="number"
            step="0.1"
            min={0}
            max={10}
            defaultValue={series?.rating ?? ""}
            className={inputClass}
          />
        </div>
      </div>

      <fieldset className="space-y-3 rounded-2xl border border-[var(--md-border)] bg-[var(--app-surface-muted)] p-4">
        <legend className="px-1 text-xs font-semibold uppercase tracking-wider text-[var(--bms-red)]">
          Genres
        </legend>
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
          {GENRE_OPTIONS.map((g) => {
            const checked = series?.genres?.includes(g) ?? false;
            return (
              <FormCheckbox
                key={g}
                id={`series-genre-${g}`}
                name={`genre_${g}`}
                defaultChecked={checked}
                labelText={formatGenreLabel(g)}
              />
            );
          })}
        </div>
      </fieldset>

      <div className="space-y-2">
        <FieldLabel htmlFor="series-overview">Synopsis</FieldLabel>
        <textarea
          id="series-overview"
          name="overview"
          rows={4}
          defaultValue={series?.overview ?? ""}
          className={inputClass}
        />
      </div>

      <div className="space-y-2">
        <FieldLabel htmlFor="series-review">Your review</FieldLabel>
        <textarea
          id="series-review"
          name="review_text"
          rows={4}
          defaultValue={series?.review_text ?? ""}
          placeholder="What kept you watching?"
          className={inputClass}
        />
      </div>

      <Button
        type="submit"
        disabled={pending}
        className="w-full sm:w-auto sm:px-10"
      >
        {pending ? "Saving…" : series ? "Update series" : "Add"}
      </Button>
    </form>
  );
}
