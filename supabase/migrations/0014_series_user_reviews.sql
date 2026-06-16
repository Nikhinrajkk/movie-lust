-- Per-user star ratings and comments on series detail pages.

create table if not exists public.series_user_reviews (
  id uuid primary key default gen_random_uuid(),
  series_id uuid not null references public.series (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  stars numeric(3, 1),
  comment text not null default '',
  author_display_name text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint series_user_reviews_stars_range check (
    stars is null
    or (
      stars >= 0.5
      and stars <= 5
      and stars * 2 = trunc(stars * 2)
    )
  ),
  constraint series_user_reviews_has_content check (
    stars is not null or length(trim(comment)) > 0
  )
);

create unique index if not exists series_user_reviews_one_per_user
  on public.series_user_reviews (series_id, user_id);

create index if not exists series_user_reviews_series_id_idx
  on public.series_user_reviews (series_id);

create or replace function public.touch_series_user_reviews_updated_at()
returns trigger
language plpgsql
security invoker
set search_path = public
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists series_user_reviews_touch_updated_at on public.series_user_reviews;
create trigger series_user_reviews_touch_updated_at
  before update on public.series_user_reviews
  for each row execute function public.touch_series_user_reviews_updated_at();

alter table public.series_user_reviews enable row level security;

drop policy if exists "series_user_reviews_select" on public.series_user_reviews;
drop policy if exists "series_user_reviews_insert" on public.series_user_reviews;
drop policy if exists "series_user_reviews_update_own" on public.series_user_reviews;
drop policy if exists "series_user_reviews_delete_own_or_admin" on public.series_user_reviews;

create policy "series_user_reviews_select"
  on public.series_user_reviews for select
  to anon, authenticated
  using (
    exists (
      select 1
      from public.series s
      where s.id = series_id
        and (
          s.approval_status = 'approved'
          or (
            (select auth.uid()) is not null
            and (
              s.created_by = (select auth.uid())
              or public.is_admin()
            )
          )
        )
    )
  );

create policy "series_user_reviews_insert"
  on public.series_user_reviews for insert
  to authenticated
  with check (
    user_id = (select auth.uid())
    and exists (
      select 1
      from public.series s
      where s.id = series_id
        and (
          s.approval_status = 'approved'
          or (
            s.created_by = (select auth.uid())
            or public.is_admin()
          )
        )
    )
  );

create policy "series_user_reviews_update_own"
  on public.series_user_reviews for update
  to authenticated
  using (user_id = (select auth.uid()))
  with check (
    user_id = (select auth.uid())
    and exists (
      select 1
      from public.series s
      where s.id = series_id
        and (
          s.approval_status = 'approved'
          or (
            s.created_by = (select auth.uid())
            or public.is_admin()
          )
        )
    )
  );

create policy "series_user_reviews_delete_own_or_admin"
  on public.series_user_reviews for delete
  to authenticated
  using (
    user_id = (select auth.uid())
    or public.is_admin()
  );
