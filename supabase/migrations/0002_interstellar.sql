-- Run once in Supabase SQL Editor if you already applied 0001_init.sql without Interstellar.
-- Skips insert if a movie titled "Interstellar" already exists.

insert into public.movies (title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director)
select
  'Interstellar',
  'As Earth grows uninhabitable, a group of astronauts crosses a wormhole in search of a new home for humanity—and faces time itself.',
  'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg',
  2014,
  array['sci-fi', 'drama', 'adventure'],
  'classic',
  8.7,
  'Scope and emotion at a scale few films attempt; the docking sequence alone is worth the run time.',
  169,
  'Christopher Nolan'
where not exists (
  select 1 from public.movies m where m.title = 'Interstellar'
);
