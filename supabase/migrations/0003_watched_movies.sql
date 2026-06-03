-- Watched titles (used by app actions in src/app/actions/watched.ts)
create table if not exists public.watched_movies (
  user_id uuid not null references auth.users (id) on delete cascade,
  movie_id uuid not null references public.movies (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, movie_id)
);

create index if not exists watched_movies_user_id_idx on public.watched_movies (user_id);

alter table public.watched_movies enable row level security;

drop policy if exists "watched_movies_select_own" on public.watched_movies;
drop policy if exists "watched_movies_insert_own" on public.watched_movies;
drop policy if exists "watched_movies_delete_own" on public.watched_movies;

create policy "watched_movies_select_own"
  on public.watched_movies for select
  to authenticated
  using (user_id = (select auth.uid()));

create policy "watched_movies_insert_own"
  on public.watched_movies for insert
  to authenticated
  with check (user_id = (select auth.uid()));

create policy "watched_movies_delete_own"
  on public.watched_movies for delete
  to authenticated
  using (user_id = (select auth.uid()));
