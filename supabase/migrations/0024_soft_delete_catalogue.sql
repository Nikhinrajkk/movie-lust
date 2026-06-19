-- Soft delete for movies and series (hide from catalogue without hard DELETE).

alter table public.movies
  add column if not exists deleted_at timestamptz;

alter table public.series
  add column if not exists deleted_at timestamptz;

comment on column public.movies.deleted_at is
  'When set, row is hidden from catalogue lists and detail pages.';
comment on column public.series.deleted_at is
  'When set, row is hidden from catalogue lists and detail pages.';

create index if not exists movies_not_deleted_idx
  on public.movies (approval_status, created_at desc)
  where deleted_at is null;

create index if not exists series_not_deleted_idx
  on public.series (approval_status, created_at desc)
  where deleted_at is null;

-- Hide soft-deleted rows from catalogue reads.
drop policy if exists "movies_select_visible" on public.movies;
create policy "movies_select_visible"
  on public.movies for select
  to anon, authenticated
  using (
    deleted_at is null
    and (
      approval_status = 'approved'
      or (
        (select auth.uid()) is not null
        and created_by = (select auth.uid())
      )
      or (
        (select auth.uid()) is not null
        and public.is_admin()
      )
    )
  );

drop policy if exists "series_select_visible" on public.series;
create policy "series_select_visible"
  on public.series for select
  to anon, authenticated
  using (
    deleted_at is null
    and (
      approval_status = 'approved'
      or (
        (select auth.uid()) is not null
        and created_by = (select auth.uid())
      )
      or (
        (select auth.uid()) is not null
        and public.is_admin()
      )
    )
  );

-- Soft delete uses existing UPDATE policies (admin / owner-pending).
drop policy if exists "movies_delete_admin" on public.movies;
drop policy if exists "movies_delete_owner_pending" on public.movies;
drop policy if exists "series_delete_admin" on public.series;
drop policy if exists "series_delete_owner_pending" on public.series;

-- User-rating sort views: exclude soft-deleted catalogue rows.
-- Must DROP + CREATE (not REPLACE) when base table columns change via m.*.
drop view if exists public.movies_with_user_rating;
create view public.movies_with_user_rating
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
) stats on stats.movie_id = m.id
where m.deleted_at is null;

drop view if exists public.series_with_user_rating;
create view public.series_with_user_rating
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
) stats on stats.series_id = s.id
where s.deleted_at is null;

comment on view public.movies_with_user_rating is
  'Catalogue listing helper; includes avg user star rating; excludes soft-deleted rows.';
comment on view public.series_with_user_rating is
  'Catalogue listing helper; includes avg user star rating; excludes soft-deleted rows.';
