-- Catalogue list views with user review aggregates (for sort by user rating).

create or replace view public.movies_with_user_rating
with (security_invoker = true) as
select
  m.*,
  stats.user_avg_stars,
  coalesce(stats.user_rating_count, 0) as user_rating_count
from public.movies m
left join (
  select
    movie_id,
    round(avg(stars)::numeric, 1) as user_avg_stars,
    count(*)::int as user_rating_count
  from public.movie_user_reviews
  where stars is not null
  group by movie_id
) stats on stats.movie_id = m.id;

create or replace view public.series_with_user_rating
with (security_invoker = true) as
select
  s.*,
  stats.user_avg_stars,
  coalesce(stats.user_rating_count, 0) as user_rating_count
from public.series s
left join (
  select
    series_id,
    round(avg(stars)::numeric, 1) as user_avg_stars,
    count(*)::int as user_rating_count
  from public.series_user_reviews
  where stars is not null
  group by series_id
) stats on stats.series_id = s.id;

comment on view public.movies_with_user_rating is
  'Approved catalogue listing helper; includes avg user star rating for browse sort.';
comment on view public.series_with_user_rating is
  'Approved catalogue listing helper; includes avg user star rating for browse sort.';
