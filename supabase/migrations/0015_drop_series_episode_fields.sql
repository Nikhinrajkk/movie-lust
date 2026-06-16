-- Remove episode count and per-episode runtime from series catalogue.

alter table public.series
  drop column if exists episode_count,
  drop column if exists runtime_minutes;
