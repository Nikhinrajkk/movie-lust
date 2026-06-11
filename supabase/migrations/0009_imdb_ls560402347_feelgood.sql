-- Catalogue seed: IMDb list ls560402347 (The 50 Best Feel-Good Movies to Make You Happy).
-- Idempotent inserts (skip when title already exists). Run after 0004_movie_moderation_gate.sql.

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

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Pursuit of Happyness',
  'A struggling salesman takes custody of his son as he''s poised to begin a life-changing professional career.',
  'https://m.media-amazon.com/images/M/MV5BMTQ5NjQ0NDI3NF5BMl5BanBnXkFtZTcwNDI0MjEzMw@@._V1_.jpg',
  2006,
  array['drama', 'feelgood']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  117,
  'Gabriele Muccino',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Pursuit of Happyness');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dead Poets Society',
  'Maverick teacher John Keating returns in 1959 to the prestigious New England boys'' boarding school where he was once a star student, using poetry to embolden his pupils to new heights of self-expression.',
  'https://m.media-amazon.com/images/M/MV5BMDYwNGVlY2ItMWYxMS00YjZiLWE5MTAtYWM5NWQ2ZWJjY2Q3XkEyXkFqcGc@._V1_.jpg',
  1989,
  array['drama', 'feelgood']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  128,
  'Peter Weir',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Dead Poets Society');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Blind Side',
  'The story of Michael Oher, a homeless and traumatized boy who became an All-American football player and first-round NFL draft pick with the help of a caring woman and her family.',
  'https://m.media-amazon.com/images/M/MV5BMjEzOTE3ODM3OF5BMl5BanBnXkFtZTcwMzYyODI4Mg@@._V1_.jpg',
  2009,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  129,
  'John Lee Hancock',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Blind Side');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Moneyball',
  'Oakland A''s general manager Billy Beane''s successful attempt to assemble a baseball team on a lean budget by employing computer-generated analysis to acquire new players.',
  'https://m.media-amazon.com/images/M/MV5BMjAxOTU3Mzc1M15BMl5BanBnXkFtZTcwMzk1ODUzNg@@._V1_.jpg',
  2011,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  133,
  'Bennett Miller',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Moneyball');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Intouchables',
  'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.',
  'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_.jpg',
  2011,
  array['drama', 'feelgood']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  112,
  'Olivier Nakache, Éric Toledano',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Intouchables');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Jerry Maguire',
  'When a sports agent has a moral epiphany and is fired for expressing it, he decides to put his new philosophy to the test as an independent agent with the only athlete who stays with him and his former colleague.',
  'https://m.media-amazon.com/images/M/MV5BM2E1ZjU1MjctZjU2Yi00MGE1LWI1MDEtYzBlMWJlNDc1NTQxXkEyXkFqcGc@._V1_.jpg',
  1996,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  139,
  'Cameron Crowe',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Jerry Maguire');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Natural',
  'A middle-aged unknown comes seemingly out of nowhere to become a legendary baseball player with almost supernatural talent.',
  'https://m.media-amazon.com/images/M/MV5BMzljOTczYTYtNzM4YS00NDRlLWFiYTQtNjM3M2I4ODM3ZjgxXkEyXkFqcGc@._V1_.jpg',
  1984,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  138,
  'Barry Levinson',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Natural');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Yes Man',
  'A man challenges himself to say "yes" to everything.',
  'https://m.media-amazon.com/images/M/MV5BZWQ4YzBiMzgtM2ZhZC00ZDQ5LWFiZjgtNmFlNzZlMTBkZTJhXkEyXkFqcGc@._V1_.jpg',
  2008,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  104,
  'Peyton Reed',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Yes Man');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'October Sky',
  'The true story of Homer Hickam, a coal miner''s son who was inspired by the first Sputnik launch to take up rocketry against his father''s wishes.',
  'https://m.media-amazon.com/images/M/MV5BMDU0M2I3ODUtZDAyYy00NThhLWIwNjQtZGNmNTNjZDIxODM4XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['drama', 'feelgood']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  108,
  'Joe Johnston',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'October Sky');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Invictus',
  'Nelson Mandela, in his first term as President of South Africa, initiates a unique venture to unite the Apartheid-torn land: enlist the national rugby team on a mission to win the 1995 Rugby World Cup.',
  'https://m.media-amazon.com/images/M/MV5BMjAyMzExMDM1N15BMl5BanBnXkFtZTcwNTcyMTQ5Mg@@._V1_.jpg',
  2009,
  array['drama', 'feelgood']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  134,
  'Clint Eastwood',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Invictus');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Bucket List',
  'Two terminally ill men escape from a cancer ward and head off on a road trip with a wish list of to-dos before they die.',
  'https://m.media-amazon.com/images/M/MV5BMTY2NTUyMjIyNF5BMl5BanBnXkFtZTYwNzYwMDM4._V1_.jpg',
  2007,
  array['drama', 'feelgood']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  97,
  'Rob Reiner',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Bucket List');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Rocky',
  'A small-time Philadelphia boxer gets a supremely rare chance to fight the world heavyweight champion in a bout in which he strives to go the distance for his self-respect.',
  'https://m.media-amazon.com/images/M/MV5BZDEyY2M2MGMtYjg5OC00ZWFjLWFkZDQtNmQzZTdiYmYzZTBkXkEyXkFqcGc@._V1_.jpg',
  1976,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  120,
  'John G. Avildsen',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Rocky');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'School of Rock',
  'After being kicked out of his rock band, Dewey Finn becomes a substitute teacher at an uptight elementary private school, only to try and turn his class into a rock band.',
  'https://m.media-amazon.com/images/M/MV5BOTg2NDU4Mjg2NV5BMl5BanBnXkFtZTgwNjQ0MDIyMDI@._V1_.jpg',
  2003,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  109,
  'Richard Linklater',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'School of Rock');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The World''s Fastest Indian',
  'The story of New Zealander Burt Munro, who spent years rebuilding a 1920 Indian motorcycle, which helped him set the land speed world record at Utah''s Bonneville Salt Flats in 1967.',
  'https://m.media-amazon.com/images/M/MV5BN2IwYTI1MzMtYWYzMC00Y2I5LWJlODUtMTQwMTYwNjY4MTg3XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  127,
  'Roger Donaldson',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The World''s Fastest Indian');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Patch Adams',
  'The true story of the heroic Hunter "Patch" Adams who''s determined to become a medical doctor because of his desire to help other people. He ventures where no doctor ever ventured before utilizing humor and pathos.',
  'https://m.media-amazon.com/images/M/MV5BYjEwMTJhMDktZDFjZi00MzQ5LTg0NWMtMDlhNmNiYWRkMDk1XkEyXkFqcGc@._V1_.jpg',
  1998,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  6.9::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  115,
  'Tom Shadyac',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Patch Adams');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'CODA',
  'When the family''s fishing business is threatened, Ruby finds herself torn between pursuing her musical passion and her fear of abandoning her deaf parents.',
  'https://m.media-amazon.com/images/M/MV5BNzIzOTNjOTQtM2QzOC00NjFlLTljZDUtZmI4Yjg1YTkyMTBiXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['drama', 'feelgood']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  111,
  'Sian Heder',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'CODA');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Walk',
  'In 1974, high-wire artist Philippe Petit recruits a team of people to help him realize his dream: to walk the immense void between the World Trade Center towers.',
  'https://m.media-amazon.com/images/M/MV5BNTY4MzA4Mzc5Nl5BMl5BanBnXkFtZTgwNDIzMzk5NjE@._V1_.jpg',
  2015,
  array['drama', 'feelgood']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  123,
  'Robert Zemeckis',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Walk');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Molly''s Game',
  'The true story of Molly Bloom, an Olympic-class skier who ran the world''s most exclusive high-stakes poker game and became an FBI target.',
  'https://m.media-amazon.com/images/M/MV5BNmYxYTg1ZDktNjc1Yy00MjVlLTk2Y2MtNmMzZTBkZDNjZjdlXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['drama', 'feelgood']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  140,
  'Aaron Sorkin',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Molly''s Game');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Chocolat',
  'Single mother Vianne Rocher and her young daughter arrive in a rural French town in the winter of 1959, and open an unusual chocolate shop that disrupts the moral fiber of the strictly Catholic townsfolk and mayor.',
  'https://m.media-amazon.com/images/M/MV5BNGIwYzczYWItZmI5Yi00M2JiLTg4M2EtNzFhNjUzZTRjNmRhXkEyXkFqcGc@._V1_.jpg',
  2000,
  array['drama', 'feelgood']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  121,
  'Lasse Hallström',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Chocolat');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Full Monty',
  'Six unemployed steel workers form a male striptease act. The women cheer them on to go for "the full monty" - total nudity.',
  'https://m.media-amazon.com/images/M/MV5BYjZjNjU4YjItM2NhNS00NzIwLWIzMjMtMGMzZjcyMjYwYzE2XkEyXkFqcGc@._V1_.jpg',
  1997,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  91,
  'Peter Cattaneo',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Full Monty');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Flora and Son',
  'A single mom at war with her son is trying to find a hobby for him. One day, she rescues a guitar from a dumpster.',
  'https://m.media-amazon.com/images/M/MV5BYWNlODkxY2QtNDZmNS00NWIxLTg5NWMtYWMwNDAwZWE4ZTFiXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  97,
  'John Carney',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Flora and Son');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'About a Boy',
  'Will, who attends single parent meetings to woo women, meets Marcus, a troubled 12-year-old boy. As they become friends, Will learns to be responsible while he helps Marcus with his studies.',
  'https://m.media-amazon.com/images/M/MV5BMTQ2Mzg4MDAzNV5BMl5BanBnXkFtZTgwMjcxNTYxMTE@._V1_.jpg',
  2002,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  101,
  'Chris Weitz, Paul Weitz',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'About a Boy');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '50 First Dates',
  'A marine veterinarian thinks he''s met the girl of his dreams and they hit it off, but the next day he discovers she has short-term memory loss and doesn''t remember him.',
  'https://m.media-amazon.com/images/M/MV5BMjAwMzc4MDgxNF5BMl5BanBnXkFtZTYwNjUwMzE3._V1_.jpg',
  2004,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  99,
  'Peter Segal',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = '50 First Dates');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Billy Elliot',
  'A talented young boy becomes torn between his unexpected love of dance and the disintegration of his family.',
  'https://m.media-amazon.com/images/M/MV5BZThiYjczMmItNjBhZC00NzcwLTkyZjUtZGRiM2FiOGRiNDQ0XkEyXkFqcGc@._V1_.jpg',
  2000,
  array['drama', 'feelgood', 'sports']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb list ls560402347 (feel-good movies).',
  110,
  'Stephen Daldry',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Billy Elliot');

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
