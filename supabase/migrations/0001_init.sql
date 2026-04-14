-- MovieLust: run in Supabase SQL Editor or via CLI migrations
-- https://supabase.com/docs/guides/database/overview

create extension if not exists "pgcrypto";

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
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists movies_title_search on public.movies using gin (
  to_tsvector(
    'english',
    title || ' ' || coalesce(overview, '') || ' ' || coalesce(review_text, '') || ' ' || coalesce(director, '')
  )
);
create index if not exists movies_genres_gin on public.movies using gin (genres);
create index if not exists movies_category_idx on public.movies (category);
create index if not exists movies_release_year_idx on public.movies (release_year desc);

-- Demo RLS: public read/write with anon key. Tighten for production (auth + policies).
alter table public.movies enable row level security;

create policy "Allow public read on movies"
  on public.movies for select
  to anon, authenticated
  using (true);

create policy "Allow public insert on movies"
  on public.movies for insert
  to anon, authenticated
  with check (true);

create policy "Allow public update on movies"
  on public.movies for update
  to anon, authenticated
  using (true)
  with check (true);

create policy "Allow public delete on movies"
  on public.movies for delete
  to anon, authenticated
  using (true);

-- Optional seed (comment out if you prefer an empty library)
insert into public.movies (title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director)
values
  (
    'Inception',
    'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.',
    'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',
    2010,
    array['sci-fi', 'thriller', 'action'],
    'trending',
    8.8,
    'Layered, propulsive, and endlessly rewatchable.',
    148,
    'Christopher Nolan'
  ),
  (
    'The Dark Knight',
    'Batman faces the Joker, a criminal mastermind who plunges Gotham into anarchy.',
    'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    2008,
    array['action', 'crime', 'drama'],
    'classic',
    9.0,
    'Still the gold standard for superhero cinema.',
    152,
    'Christopher Nolan'
  ),
  (
    'Dune: Part Two',
    'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nhx1X.jpg',
    2024,
    array['sci-fi', 'adventure', 'drama'],
    'now_showing',
    8.5,
    'Epic scale with intimate character stakes.',
    166,
    'Denis Villeneuve'
  ),
  (
    'Interstellar',
    'As Earth grows uninhabitable, a group of astronauts crosses a wormhole in search of a new home for humanity—and faces time itself.',
    'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    2014,
    array['sci-fi', 'drama', 'adventure'],
    'classic',
    8.7,
    'Scope and emotion at a scale few films attempt; the docking sequence alone is worth the run time.',
    169,
    'Christopher Nolan'
  )
;
