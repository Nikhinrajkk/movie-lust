-- Per-user star ratings (1–5) and comments on movie detail pages.

create table if not exists public.movie_user_reviews (
  id uuid primary key default gen_random_uuid(),
  movie_id uuid not null references public.movies (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  stars integer,
  comment text not null default '',
  author_display_name text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint movie_user_reviews_stars_range check (
    stars is null or (stars >= 1 and stars <= 5)
  ),
  constraint movie_user_reviews_has_content check (
    stars is not null or length(trim(comment)) > 0
  )
);

create unique index if not exists movie_user_reviews_one_per_user
  on public.movie_user_reviews (movie_id, user_id);

create index if not exists movie_user_reviews_movie_id_idx
  on public.movie_user_reviews (movie_id);

create or replace function public.touch_movie_user_reviews_updated_at()
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

drop trigger if exists movie_user_reviews_touch_updated_at on public.movie_user_reviews;
create trigger movie_user_reviews_touch_updated_at
  before update on public.movie_user_reviews
  for each row execute function public.touch_movie_user_reviews_updated_at();

alter table public.movie_user_reviews enable row level security;

drop policy if exists "movie_user_reviews_select" on public.movie_user_reviews;
drop policy if exists "movie_user_reviews_insert" on public.movie_user_reviews;
drop policy if exists "movie_user_reviews_update_own" on public.movie_user_reviews;
drop policy if exists "movie_user_reviews_delete_own_or_admin" on public.movie_user_reviews;

create policy "movie_user_reviews_select"
  on public.movie_user_reviews for select
  to anon, authenticated
  using (
    exists (
      select 1
      from public.movies m
      where m.id = movie_id
        and (
          m.approval_status = 'approved'
          or (
            (select auth.uid()) is not null
            and (
              m.created_by = (select auth.uid())
              or public.is_admin()
            )
          )
        )
    )
  );

create policy "movie_user_reviews_insert"
  on public.movie_user_reviews for insert
  to authenticated
  with check (
    user_id = (select auth.uid())
    and exists (
      select 1
      from public.movies m
      where m.id = movie_id
        and (
          m.approval_status = 'approved'
          or (
            m.created_by = (select auth.uid())
            or public.is_admin()
          )
        )
    )
  );

create policy "movie_user_reviews_update_own"
  on public.movie_user_reviews for update
  to authenticated
  using (user_id = (select auth.uid()))
  with check (
    user_id = (select auth.uid())
    and exists (
      select 1
      from public.movies m
      where m.id = movie_id
        and (
          m.approval_status = 'approved'
          or (
            m.created_by = (select auth.uid())
            or public.is_admin()
          )
        )
    )
  );

create policy "movie_user_reviews_delete_own_or_admin"
  on public.movie_user_reviews for delete
  to authenticated
  using (
    user_id = (select auth.uid())
    or public.is_admin()
  );
