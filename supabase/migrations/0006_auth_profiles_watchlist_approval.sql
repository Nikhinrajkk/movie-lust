-- Auth profiles, personalized watchlist, movie moderation (admin approves user submissions)

-- ---------------------------------------------------------------------------
-- Profiles (linked to auth.users)
-- ---------------------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text not null default '',
  is_admin boolean not null default false,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- is_admin() — SECURITY DEFINER so RLS can evaluate without recursion issues
-- ---------------------------------------------------------------------------
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
-- Auto-create profile on signup
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
-- Movies: moderation columns
-- ---------------------------------------------------------------------------
alter table public.movies
  add column if not exists created_by uuid references auth.users (id) on delete set null;

alter table public.movies
  add column if not exists approval_status text not null default 'approved';

alter table public.movies
  drop constraint if exists movies_approval_status_check;

alter table public.movies
  add constraint movies_approval_status_check
  check (approval_status in ('approved', 'pending', 'rejected'));

update public.movies
set approval_status = 'approved'
where approval_status is null or approval_status = '';

create index if not exists movies_approval_status_idx on public.movies (approval_status);
create index if not exists movies_created_by_idx on public.movies (created_by);

-- ---------------------------------------------------------------------------
-- Watchlist (per-user favorites)
-- ---------------------------------------------------------------------------
create table if not exists public.watchlist (
  user_id uuid not null references auth.users (id) on delete cascade,
  movie_id uuid not null references public.movies (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, movie_id)
);

create index if not exists watchlist_user_id_idx on public.watchlist (user_id);

alter table public.watchlist enable row level security;

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

-- ---------------------------------------------------------------------------
-- Movies RLS (replace wide-open demo policies)
-- ---------------------------------------------------------------------------
drop policy if exists "Allow public read on movies" on public.movies;
drop policy if exists "Allow public insert on movies" on public.movies;
drop policy if exists "Allow public update on movies" on public.movies;
drop policy if exists "Allow public delete on movies" on public.movies;

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

-- Bootstrap an admin after first signup (Dashboard → Authentication → Users):
--   update public.profiles set is_admin = true where id = '<paste-user-uuid>';
