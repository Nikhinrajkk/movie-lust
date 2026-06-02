-- MovieLust schema (DDL only). Run before 0002_data.sql.
-- Consolidates former 0001_init, 0003_add_director_column, 0006_auth_profiles_watchlist_approval, 0007_add_language_column.

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------------------
-- movies (structure + indexes; RLS policies after is_admin() exists)
-- ---------------------------------------------------------------------------
create table if not exists public.movies (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  overview text default '',
  poster_url text default '',
  release_year int,
  genres text[] not null default '{}',
  category text not null default 'trending',
  rating numeric(3, 1) check (rating is null or (rating >= 0 and rating <= 10)),
  review_text text default '',
  runtime_minutes int,
  director text not null default '',
  language text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users (id) on delete set null,
  approval_status text not null default 'approved',
  constraint movies_approval_status_check
    check (approval_status in ('approved', 'pending', 'rejected'))
);

drop index if exists public.movies_title_search;
create index movies_title_search on public.movies using gin (
  to_tsvector(
    'english',
    title || ' ' || coalesce(overview, '') || ' ' || coalesce(review_text, '')
      || ' ' || coalesce(director, '') || ' ' || coalesce(language, '')
  )
);
create index if not exists movies_genres_gin on public.movies using gin (genres);
create index if not exists movies_category_idx on public.movies (category);
create index if not exists movies_release_year_idx on public.movies (release_year desc);
create index if not exists movies_approval_status_idx on public.movies (approval_status);
create index if not exists movies_created_by_idx on public.movies (created_by);

alter table public.movies enable row level security;

-- ---------------------------------------------------------------------------
-- profiles + is_admin() (required by movies RLS)
-- ---------------------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text not null default '',
  is_admin boolean not null default false,
  created_at timestamptz not null default now()
);

create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select coalesce(
    (select p.is_admin from public.profiles p where p.id = (select auth.uid())),
    false
  );
$$;

alter table public.profiles enable row level security;

drop policy if exists "profiles_select_own_or_admin" on public.profiles;
drop policy if exists "profiles_update_own" on public.profiles;

create policy "profiles_select_own_or_admin"
  on public.profiles for select
  to authenticated
  using (id = (select auth.uid()) or public.is_admin());

create policy "profiles_update_own"
  on public.profiles for update
  to authenticated
  using (id = (select auth.uid()))
  with check (id = (select auth.uid()));

-- ---------------------------------------------------------------------------
-- movies RLS (replaces wide-open demo policies)
-- ---------------------------------------------------------------------------
drop policy if exists "Allow public read on movies" on public.movies;
drop policy if exists "Allow public insert on movies" on public.movies;
drop policy if exists "Allow public update on movies" on public.movies;
drop policy if exists "Allow public delete on movies" on public.movies;
drop policy if exists "movies_select_visible" on public.movies;
drop policy if exists "movies_insert_rules" on public.movies;
drop policy if exists "movies_update_admin" on public.movies;
drop policy if exists "movies_update_owner_pending" on public.movies;
drop policy if exists "movies_delete_admin" on public.movies;
drop policy if exists "movies_delete_owner_pending" on public.movies;

create policy "movies_select_visible"
  on public.movies for select
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

create policy "movies_insert_rules"
  on public.movies for insert
  to authenticated
  with check (
    (
      public.is_admin()
      and approval_status = 'approved'
      and (created_by is null or created_by = (select auth.uid()))
    )
    or (
      not public.is_admin()
      and approval_status = 'pending'
      and created_by = (select auth.uid())
    )
  );

create policy "movies_update_admin"
  on public.movies for update
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

create policy "movies_update_owner_pending"
  on public.movies for update
  to authenticated
  using (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  )
  with check (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  );

create policy "movies_delete_admin"
  on public.movies for delete
  to authenticated
  using (public.is_admin());

create policy "movies_delete_owner_pending"
  on public.movies for delete
  to authenticated
  using (
    created_by = (select auth.uid())
    and approval_status = 'pending'
  );

-- ---------------------------------------------------------------------------
-- signup profile trigger
-- ---------------------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, display_name)
  values (
    new.id,
    coalesce(
      new.raw_user_meta_data ->> 'display_name',
      split_part(coalesce(new.email, 'user'), '@', 1)
    )
  );
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ---------------------------------------------------------------------------
-- watchlist
-- ---------------------------------------------------------------------------
create table if not exists public.watchlist (
  user_id uuid not null references auth.users (id) on delete cascade,
  movie_id uuid not null references public.movies (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, movie_id)
);

create index if not exists watchlist_user_id_idx on public.watchlist (user_id);

alter table public.watchlist enable row level security;

drop policy if exists "watchlist_select_own" on public.watchlist;
drop policy if exists "watchlist_insert_own" on public.watchlist;
drop policy if exists "watchlist_delete_own" on public.watchlist;

create policy "watchlist_select_own"
  on public.watchlist for select
  to authenticated
  using (user_id = (select auth.uid()));

create policy "watchlist_insert_own"
  on public.watchlist for insert
  to authenticated
  with check (user_id = (select auth.uid()));

create policy "watchlist_delete_own"
  on public.watchlist for delete
  to authenticated
  using (user_id = (select auth.uid()));

-- Bootstrap an admin after first signup (Dashboard → Authentication → Users):
--   update public.profiles set is_admin = true where id = '<paste-user-uuid>';
