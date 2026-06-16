-- Catalogue seed: user curated series batch (2026-06-11).
-- Source: data/series-curated-batch-2026-06-11.json
-- Idempotent inserts (skip when title already exists). Run after 0013_series.sql.

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Game of Thrones',
  'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night''s Watch, is all that stands between the realms of men and icy horrors beyond.',
  'https://image.tmdb.org/t/p/w500/1XS5okHuS4Kv3CFTPUad6qx297w.jpg',
  '2011-04-17'::date,
  '2019-05-19'::date,
  2011,
  2019,
  array['fantasy', 'drama', 'adventure', 'action']::text[],
  'trending',
  9.2::numeric,
  'Catalogue: user curated series batch (2026-06-11).',
  8,
  '',
  'David Benioff, D.B. Weiss',
  'English',
  'HBO',
  'max',
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series s where s.title = 'Game of Thrones');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dark',
  'A missing child sets four families on a frantic hunt for answers as they unearth a mind-bending mystery that spans three generations.',
  'https://image.tmdb.org/t/p/w500/appl9ZtcRm1HHVs1Uqgdxs8p2NU.jpg',
  '2017-12-01'::date,
  '2020-06-27'::date,
  2017,
  2020,
  array['sci-fi', 'mystery', 'thriller', 'drama', 'mind-fuck']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: user curated series batch (2026-06-11).',
  3,
  'Baran bo Odar',
  'Baran bo Odar, Jantje Friese',
  'German',
  'Netflix',
  'netflix',
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series s where s.title = 'Dark');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Better Call Saul',
  'Six years before Saul Goodman meets Walter White, Jimmy McGill is a small-time lawyer hustling to make ends meet. Working alongside — and often against — fixer Mike Ehrmantraut, Jimmy''s transformation into Saul Goodman unfolds across the criminal underworld of Albuquerque.',
  'https://image.tmdb.org/t/p/w500/fC2IDpITeAhQPPZQse5xCptAESt.jpg',
  '2015-02-08'::date,
  '2022-08-15'::date,
  2015,
  2022,
  array['crime', 'drama', 'neo-noir']::text[],
  'trending',
  9.0::numeric,
  'Catalogue: user curated series batch (2026-06-11).',
  6,
  '',
  'Vince Gilligan, Peter Gould',
  'English',
  'AMC',
  'netflix',
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series s where s.title = 'Better Call Saul');
