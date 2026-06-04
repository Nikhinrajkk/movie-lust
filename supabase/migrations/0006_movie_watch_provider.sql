-- Where to watch (OTT / streaming). App validates slugs; nullable = not listed.
-- Run after 0005 (or any prior movies DDL).

alter table public.movies
  add column if not exists watch_provider text;

comment on column public.movies.watch_provider is
  'Streaming service slug (e.g. netflix, disneyplus). Null if not set.';
