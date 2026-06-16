-- TV series catalogue (mirrors movies + season/episode/air-date fields).
-- Run after 0004_movie_moderation_gate.sql (uses same moderation pattern).

-- ---------------------------------------------------------------------------
-- series
-- ---------------------------------------------------------------------------
create table if not exists public.series (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  overview text default '',
  poster_url text default '',
  -- Air dates (first / last episode). end_date null when still airing.
  start_date date,
  end_date date,
  start_year int,
  end_year int,
  genres text[] not null default '{}',
  category text not null default 'trending',
  rating numeric(3, 1) check (rating is null or (rating >= 0 and rating <= 10)),
  review_text text default '',
  runtime_minutes int check (runtime_minutes is null or runtime_minutes > 0),
  season_count int check (season_count is null or season_count >= 0),
  episode_count int check (episode_count is null or episode_count >= 0),
  director text not null default '',
  creator text not null default '',
  language text not null default '',
  network text not null default '',
  watch_provider text,
  status text not null default 'ended',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users (id) on delete set null,
  approval_status text not null default 'pending',
  approved_by uuid references auth.users (id) on delete set null,
  constraint series_approval_status_check
    check (approval_status in ('approved', 'pending', 'rejected')),
  constraint series_status_check
    check (status in ('ongoing', 'ended', 'cancelled', 'upcoming'))
);

comment on table public.series is
  'TV series catalogue; field set mirrors movies with season/episode and air-date metadata.';

comment on column public.series.start_date is 'First episode air date.';
comment on column public.series.end_date is 'Last episode air date; null if ongoing or TBA.';
comment on column public.series.start_year is 'First air year (browse/filter convenience).';
comment on column public.series.end_year is 'Final air year; null if ongoing.';
comment on column public.series.season_count is 'Total seasons produced.';
comment on column public.series.episode_count is 'Total episodes across all seasons.';
comment on column public.series.runtime_minutes is 'Average episode runtime in minutes.';
comment on column public.series.creator is 'Show creator / showrunner.';
comment on column public.series.network is 'Original network or platform, e.g. HBO, Netflix.';
comment on column public.series.watch_provider is 'Streaming slug (netflix, disneyplus, …); null if unset.';
comment on column public.series.status is 'ongoing | ended | cancelled | upcoming';
comment on column public.series.approved_by is
  'Auth user id of the admin who approved the row (set by moderation UI).';

drop index if exists public.series_title_search;
create index series_title_search on public.series using gin (
  to_tsvector(
    'english',
    title || ' ' || coalesce(overview, '') || ' ' || coalesce(review_text, '')
      || ' ' || coalesce(director, '') || ' ' || coalesce(creator, '')
      || ' ' || coalesce(language, '') || ' ' || coalesce(network, '')
  )
);

create index if not exists series_genres_gin on public.series using gin (genres);
create index if not exists series_category_idx on public.series (category);
create index if not exists series_start_year_idx on public.series (start_year desc);
create index if not exists series_approval_status_idx on public.series (approval_status);
create index if not exists series_created_by_idx on public.series (created_by);
create index if not exists series_approved_by_idx on public.series (approved_by);
create index if not exists series_status_idx on public.series (status);

alter table public.series enable row level security;

-- ---------------------------------------------------------------------------
-- RLS (same visibility / moderation rules as movies)
-- ---------------------------------------------------------------------------
drop policy if exists "series_select_visible" on public.series;
drop policy if exists "series_insert_rules" on public.series;
drop policy if exists "series_update_admin" on public.series;
drop policy if exists "series_update_owner_pending" on public.series;
drop policy if exists "series_delete_admin" on public.series;
drop policy if exists "series_delete_owner_pending" on public.series;

create policy "series_select_visible"
  on public.series for select
  to anon, authenticated
  using (
    approval_status = 'approved'
    or (
      (select auth.uid()) is not null
      and created_by = (select auth.uid())
    )
    or (
      (select auth.uid()) is not null
      and public.is_admin()
    )
  );

create policy "series_insert_rules"
  on public.series for insert
  to authenticated
  with check (
    approval_status = 'pending'
    and created_by = (select auth.uid())
  );

create policy "series_update_admin"
  on public.series for update
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

create policy "series_update_owner_pending"
  on public.series for update
  to authenticated
  using (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  )
  with check (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  );

create policy "series_delete_admin"
  on public.series for delete
  to authenticated
  using (public.is_admin());

create policy "series_delete_owner_pending"
  on public.series for delete
  to authenticated
  using (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  );

-- ---------------------------------------------------------------------------
-- Moderation gate: new rows must be pending (UI or SQL editor)
-- ---------------------------------------------------------------------------
create or replace function public.series_insert_must_be_pending()
returns trigger
language plpgsql
as $$
begin
  if new.approval_status is distinct from 'pending' then
    raise exception
      'series: new rows must use approval_status = pending (got %). Approve via admin moderation.',
      new.approval_status;
  end if;
  new.approved_by := null;
  return new;
end;
$$;

drop trigger if exists trg_series_insert_must_be_pending on public.series;
create trigger trg_series_insert_must_be_pending
  before insert on public.series
  for each row
  execute function public.series_insert_must_be_pending();
