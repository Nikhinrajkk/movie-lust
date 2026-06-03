-- Catalogue seed in the spirit of IMDb list ls000047280 (serial killer / investigation / crime).
-- New genre slugs in app + seeds: feelgood, investigation, mystery, serial-killer.
-- Run after 0004_movie_moderation_gate.sql. If the pending-insert trigger exists, it is disabled briefly
-- so these rows can load as approved catalogue seeds (same idea as running 0002 before 0004).

do $$
begin
  if exists (
    select 1
    from pg_trigger t
    join pg_class c on c.oid = t.tgrelid
    join pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relname = 'movies'
      and t.tgname = 'trg_movies_insert_must_be_pending'
      and not t.tgisinternal
  ) then
    execute 'alter table public.movies disable trigger trg_movies_insert_must_be_pending';
  end if;
end
$$;

-- ---- ls000047280-style catalogue (idempotent) ----

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'American Psycho',
  'A wealthy New York investment banking executive hides his alternate psychopathic ego from his co-workers and friends as he delves deeper into his violent fantasies.',
  'https://upload.wikimedia.org/wikipedia/en/6/6c/American_Psycho_poster.jpg',
  2000,
  array['crime', 'horror', 'serial-killer', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  101,
  'Mary Harron',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'American Psycho');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Monster',
  'Based on the life of Aileen Wuornos, a Daytona Beach prostitute who became a serial killer.',
  'https://upload.wikimedia.org/wikipedia/en/4/4d/Monster_movie.jpg',
  2003,
  array['crime', 'drama', 'serial-killer']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  109,
  'Patty Jenkins',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Monster');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Red Dragon',
  'A retired FBI agent with psychological gifts is asked to return to the field to track down a serial killer.',
  'https://upload.wikimedia.org/wikipedia/en/6/6b/Red_dragon_movie_poster.jpg',
  2002,
  array['crime', 'horror', 'investigation', 'serial-killer', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  124,
  'Brett Ratner',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Red Dragon');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Manhunter',
  'Former FBI profiler Will Graham returns to the field to pursue a serial killer known as the Tooth Fairy.',
  'https://upload.wikimedia.org/wikipedia/en/6/6c/ManhunterMichaelMann.jpg',
  1986,
  array['crime', 'investigation', 'mystery', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  119,
  'Michael Mann',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Manhunter');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Henry: Portrait of a Serial Killer',
  'Henry, a drifter, commits a series of murders with his sociopathic accomplice, loosely based on real killers.',
  '',
  1986,
  array['crime', 'horror', 'serial-killer']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  83,
  'John McNaughton',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Henry: Portrait of a Serial Killer');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Badlands',
  'A teenage girl and her twenty-something boyfriend embark on a Midwest killing spree loosely inspired by real events.',
  'https://upload.wikimedia.org/wikipedia/en/9/9b/Badlands_movie_poster.jpg',
  1973,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  94,
  'Terrence Malick',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Badlands');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Natural Born Killers',
  'Two victims of traumatic childhoods become lovers and serial murderers irresponsibly glorified by the mass media.',
  'https://upload.wikimedia.org/wikipedia/en/9/9d/Natural_Born_Killers_poster.jpg',
  1994,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  118,
  'Oliver Stone',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Natural Born Killers');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Lovely Bones',
  'Centers on a young girl who has been murdered and watches over her family from the in-between—and her killer.',
  'https://upload.wikimedia.org/wikipedia/en/8/8c/Lovely_bones_poster.jpg',
  2009,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  135,
  'Peter Jackson',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Lovely Bones');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Perfume: The Story of a Murderer',
  'Jean-Baptiste Grenouille, born with a superior olfactory sense, creates the world''s finest perfume—his search takes a dark turn.',
  'https://upload.wikimedia.org/wikipedia/en/3/33/Perfume_poster.jpg',
  2006,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  147,
  'Tom Tykwer',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Perfume: The Story of a Murderer');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Chaser',
  'An ex-detective turned pimp searches for missing prostitutes—only to find a serial killer targeting his girls.',
  '',
  2008,
  array['crime', 'investigation', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  125,
  'Na Hong-jin',
  'Korean',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Chaser');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Bone Collector',
  'A quadriplegic ex-homicide detective and his partner try to track down a serial killer who is terrorizing New York City.',
  'https://upload.wikimedia.org/wikipedia/en/0/0d/The_Bone_Collector_poster.jpg',
  1999,
  array['crime', 'investigation', 'mystery', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  118,
  'Phillip Noyce',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Bone Collector');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kiss the Girls',
  'Police hunting for a serial kidnapper are helped when one of his victims manages to escape for the first time.',
  'https://upload.wikimedia.org/wikipedia/en/6/6d/Kiss_the_girls.jpg',
  1997,
  array['crime', 'investigation', 'mystery', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  115,
  'Gary Fleder',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Kiss the Girls');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Along Came a Spider',
  'A detective is called out of retirement to help profile and track a kidnapper who abducts a senator''s daughter.',
  'https://upload.wikimedia.org/wikipedia/en/0/0d/Along_came_a_spider.jpg',
  2001,
  array['crime', 'investigation', 'mystery', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  104,
  'Lee Tamahori',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Along Came a Spider');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Copycat',
  'An agoraphobic psychologist and a female detective must work together to take down a serial killer who copies serial killers of the past.',
  'https://upload.wikimedia.org/wikipedia/en/8/8e/Copycat_movie_poster.jpg',
  1995,
  array['crime', 'drama', 'investigation', 'mystery', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  123,
  'Jon Amiel',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Copycat');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Untraceable',
  'FBI agent Jennifer Marsh works undercover to track a killer who posts live torture streams that speed up as more people watch.',
  'https://upload.wikimedia.org/wikipedia/en/8/8e/Untraceable_poster.jpg',
  2008,
  array['crime', 'investigation', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000047280 (serial killer / investigation).',
  101,
  'Gregory Hoblit',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Untraceable');

-- One feelgood anchor so the new slug appears in filters (optional catalogue colour).
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Little Miss Sunshine',
  'A family determined to get their young daughter into the finals of a beauty pageant take a cross-country trip in their VW bus.',
  'https://upload.wikimedia.org/wikipedia/en/3/3d/Little_miss_sunshine_poster.jpg',
  2006,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: feelgood / comedy counterpoint to ls000047280 crime batch.',
  101,
  'Jonathan Dayton and Valerie Faris',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Little Miss Sunshine');

do $$
begin
  if exists (
    select 1
    from pg_trigger t
    join pg_class c on c.oid = t.tgrelid
    join pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relname = 'movies'
      and t.tgname = 'trg_movies_insert_must_be_pending'
      and not t.tgisinternal
  ) then
    execute 'alter table public.movies enable trigger trg_movies_insert_must_be_pending';
  end if;
end
$$;
