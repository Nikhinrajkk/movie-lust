-- Original language(s) for catalogue entries (e.g. "Spanish", "Spanish, Catalan").
alter table public.movies add column if not exists language text not null default '';

drop index if exists public.movies_title_search;
create index movies_title_search on public.movies using gin (
  to_tsvector(
    'english',
    title || ' ' || coalesce(overview, '') || ' ' || coalesce(review_text, '')
      || ' ' || coalesce(director, '') || ' ' || coalesce(language, '')
  )
);
