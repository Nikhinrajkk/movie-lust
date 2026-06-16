-- Catalogue seed: IMDb list ls021615613 (Best Feel-Good Movies).
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
  'Forrest Gump',
  'The history of the United States from the 1950s to the ''70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.',
  'https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_.jpg',
  1994,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  142,
  'Robert Zemeckis',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Forrest Gump');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Green Book',
  'A working-class Italian-American bouncer becomes the driver for an African-American classical pianist on a tour of venues through the 1960s American South.',
  'https://m.media-amazon.com/images/M/MV5BNDU5YTNmMmItN2QxNy00OGQ0LTg5MTctNzFmYjEzZjcwN2UwXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  130,
  'Peter Farrelly',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Green Book');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Intouchables',
  'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.',
  'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_.jpg',
  2011,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  112,
  'Olivier Nakache, Éric Toledano',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Intouchables');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'City Lights',
  'With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a blind flower girl accumulates money to be able to help her medically.',
  'https://m.media-amazon.com/images/M/MV5BM2U4NjgzODUtODkyOC00YTE2LTlhNTItYzFlYmM1NTEzZDA2XkEyXkFqcGc@._V1_.jpg',
  1931,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  87,
  'Charles Chaplin',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'City Lights');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Straight Story',
  'Alvin Straight, a 73-year-old, learns that his estranged brother, Lyle is critically ill. Unable to drive, Alvin embarks on a journey from Iowa to Mt. Zion by riding a lawn mower.',
  'https://m.media-amazon.com/images/M/MV5BZjdjNWZhY2UtMDRiYS00M2NhLThiZmQtYTA0MzI4ZWIyYzY4XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  112,
  'David Lynch',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Straight Story');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain Fantastic',
  'A widower who lives in the forest takes his six children into the outside world for the first time.',
  'https://m.media-amazon.com/images/M/MV5BMjE5OTM0OTY5NF5BMl5BanBnXkFtZTgwMDcxOTQ3ODE@._V1_.jpg',
  2016,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  118,
  'Matt Ross',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Captain Fantastic');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Breakfast Club',
  'Five high school students meet in Saturday detention and discover how they have a great deal more in common than they thought.',
  'https://m.media-amazon.com/images/M/MV5BZTZiMGU1MWMtNjk0Yi00ZjNjLTljMDEtMDhkNGE2OWY3YzZiXkEyXkFqcGc@._V1_.jpg',
  1985,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  97,
  'John Hughes',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Breakfast Club');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'About Time',
  'At the age of 21, Tim discovers he can travel in time and change what happens and has happened in his own life. His decision to make his world a better place by getting a girlfriend turns out not to be as easy as you might think.',
  'https://m.media-amazon.com/images/M/MV5BMTA1ODUzMDA3NzFeQTJeQWpwZ15BbWU3MDgxMTYxNTk@._V1_.jpg',
  2013,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  123,
  'Richard Curtis',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'About Time');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Terminal',
  'An Eastern European tourist unexpectedly finds himself stranded at JFK airport and must take up temporary residence there.',
  'https://m.media-amazon.com/images/M/MV5BMTM1MTIwNTMxOF5BMl5BanBnXkFtZTcwNjIxMjQyMw@@._V1_.jpg',
  2004,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  128,
  'Steven Spielberg',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Terminal');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Guess Who''s Coming to Dinner',
  'A White couple''s attitudes are challenged when their daughter introduces them to her Black fiancé.',
  'https://m.media-amazon.com/images/M/MV5BNmMwNjRiYTUtNjM5Yy00ZDk2LWJiZjEtYjRjMzVmYmM1OGQ5XkEyXkFqcGc@._V1_.jpg',
  1967,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  108,
  'Stanley Kramer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Guess Who''s Coming to Dinner');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'It''s a Wonderful Life',
  'An angel is sent from Heaven to help a desperately frustrated businessman see the value of his own life.',
  'https://m.media-amazon.com/images/M/MV5BMDM4OWFhYjEtNTE5Yy00NjcyLTg5N2UtZDQwNDZlYjlmNDU5XkEyXkFqcGc@._V1_.jpg',
  1946,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  130,
  'Frank Capra',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'It''s a Wonderful Life');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ferris Bueller''s Day Off',
  'A brash, cocky high school senior, tired of skipping school to spend a boring day at home, is determined to enjoy an epic day roaring around his favorite Chicago sites, enlisting his best friend and girlfriend to join him on the adventure.',
  'https://m.media-amazon.com/images/M/MV5BZWYwMjUxNjMtMzE0MC00NDM3LWIxMmQtYmEyNWVjNjdlZGZjXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  103,
  'John Hughes',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Ferris Bueller''s Day Off');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Harold and Maude',
  'Young, rich, and obsessed with death, Harold finds himself changed forever when he meets lively septuagenarian Maude at a funeral.',
  'https://m.media-amazon.com/images/M/MV5BZWQ2YTQ4N2ItMzBmZC00ODIyLWIwNWEtODk2M2FjNjZhMDlmXkEyXkFqcGc@._V1_.jpg',
  1971,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  91,
  'Hal Ashby',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Harold and Maude');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Second Mother',
  'When the estranged daughter of a hard-working live-in housekeeper suddenly appears, the unspoken class barriers that exist within the home are thrown into disarray.',
  'https://m.media-amazon.com/images/M/MV5BMzU0MzE5Mjk3OF5BMl5BanBnXkFtZTgwMjM3NjQzNjE@._V1_.jpg',
  2015,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  112,
  'Anna Muylaert',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Second Mother');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'October Sky',
  'The true story of Homer Hickam, a coal miner''s son who was inspired by the first Sputnik launch to take up rocketry against his father''s wishes.',
  'https://m.media-amazon.com/images/M/MV5BMDU0M2I3ODUtZDAyYy00NThhLWIwNjQtZGNmNTNjZDIxODM4XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  108,
  'Joe Johnston',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'October Sky');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'La La Land',
  'When Sebastian, a pianist, and Mia, an actress, follow their passion and achieve success in their respective fields, they find themselves torn between their love for each other and their careers.',
  'https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg',
  2016,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  128,
  'Damien Chazelle',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'La La Land');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Temple Grandin',
  'A biopic of Temple Grandin, an autistic woman who has become one of the top scientists in the humane livestock handling industry.',
  'https://m.media-amazon.com/images/M/MV5BMjQwOTQ4NDk5OF5BMl5BanBnXkFtZTcwNzM0Mjk3Mw@@._V1_.jpg',
  2010,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  107,
  'Mick Jackson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Temple Grandin');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Life Is Beautiful',
  'When an open-minded Jewish waiter and his son become victims of the Holocaust, he uses a perfect mixture of will, humor and imagination to protect his son from the dangers around their camp.',
  'https://m.media-amazon.com/images/M/MV5BZTBhOGYzZjQtYzE0Mi00MGIwLWE0MWYtNzMxNTM2OTFkM2NjXkEyXkFqcGc@._V1_.jpg',
  1997,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  116,
  'Roberto Benigni',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Life Is Beautiful');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Good Will Hunting',
  'A therapist counsels Will Hunting, a janitor with a genius IQ.',
  'https://m.media-amazon.com/images/M/MV5BNDdjZGQ5YzEtNTc2My00Mjc0LWFlMTctYzkwMzZlNzdiZWYzXkEyXkFqcGc@._V1_.jpg',
  1997,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  126,
  'Gus Van Sant',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Good Will Hunting');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A River Runs Through It',
  'Two sons of a stern minister - one reserved, one rebellious - grow up in rural 1920s Montana while devoted to fly fishing.',
  'https://m.media-amazon.com/images/M/MV5BNjRlYWIwNWEtZjMxYy00N2JjLWFiNzMtM2NlZDU2ZjhjMWY2XkEyXkFqcGc@._V1_.jpg',
  1992,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  123,
  'Robert Redford',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'A River Runs Through It');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Blind Side',
  'The story of Michael Oher, a homeless and traumatized boy who became an All-American football player and first-round NFL draft pick with the help of a caring woman and her family.',
  'https://m.media-amazon.com/images/M/MV5BMjEzOTE3ODM3OF5BMl5BanBnXkFtZTcwMzYyODI4Mg@@._V1_.jpg',
  2009,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  129,
  'John Lee Hancock',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Blind Side');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Odd Couple',
  'After separating from his wife, fastidious Felix Unger moves in with his divorced poker pal and best friend, slovenly Oscar Madison.',
  'https://m.media-amazon.com/images/M/MV5BYjgwOTg4NDQtMWQxNy00OTlkLTkzMGQtZjJmYTAxMWY2MGU5XkEyXkFqcGc@._V1_.jpg',
  1968,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  105,
  'Gene Saks',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Odd Couple');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Big',
  'After wishing to be made big, a teenage boy wakes the next morning to find himself mysteriously in the body of an adult.',
  'https://m.media-amazon.com/images/M/MV5BNzE3ZTc2ZDgtMzQ4MS00NjEyLWJkMDYtZmMzZmY5ODJhMDdmXkEyXkFqcGc@._V1_.jpg',
  1988,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  104,
  'Penny Marshall',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Big');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Smoke',
  'A Brooklyn smoke shop is the center of neighborhood activity, and the stories of its customers.',
  'https://m.media-amazon.com/images/M/MV5BMzgwMGQ1NjAtMWZmYi00NDRhLWFkN2EtN2FjNmFlYWRhNzliXkEyXkFqcGc@._V1_.jpg',
  1995,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  112,
  'Wayne Wang',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Smoke');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Great Debaters',
  'A drama based on the true story of Melvin B. Tolson, a professor at Wiley College Texas. In 1935, he inspired students to form the school''s first debate team, which went on to challenge Harvard in the national championship.',
  'https://m.media-amazon.com/images/M/MV5BMTQxMDc1NzkwMF5BMl5BanBnXkFtZTcwMDI5MjU1MQ@@._V1_.jpg',
  2007,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  126,
  'Denzel Washington',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Great Debaters');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Cinema Paradiso',
  'Salvatore, a famous film director, returns to his hometown for the funeral of the local theater''s film projectionist, Alfredo. He reminisces about his life as a young boy falling in love with cinema.',
  'https://m.media-amazon.com/images/M/MV5BMTljNzc4YWEtYTZlMS00ODMyLWIwMTAtNWQxY2VkMDEwYTk5XkEyXkFqcGc@._V1_.jpg',
  1988,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  174,
  'Giuseppe Tornatore',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Cinema Paradiso');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Down by Law',
  'Two men are framed and sent to jail, where they meet a murderer who helps them escape and leave the state.',
  'https://m.media-amazon.com/images/M/MV5BNjAxNDRhM2UtYTRkNS00YzlkLTkxZDMtYzg4MDAyZGQwM2Q4XkEyXkFqcGc@._V1_.jpg',
  1986,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  107,
  'Jim Jarmusch',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Down by Law');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The World''s Fastest Indian',
  'The story of New Zealander Burt Munro, who spent years rebuilding a 1920 Indian motorcycle, which helped him set the land speed world record at Utah''s Bonneville Salt Flats in 1967.',
  'https://m.media-amazon.com/images/M/MV5BN2IwYTI1MzMtYWYzMC00Y2I5LWJlODUtMTQwMTYwNjY4MTg3XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  127,
  'Roger Donaldson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The World''s Fastest Indian');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Holdovers',
  'In 1970, a curmudgeonly history teacher at a New England boarding school remains on campus during Christmas break to supervise held over students, and ends up forming an unlikely bond with a brainy but damaged troublemaker.',
  'https://m.media-amazon.com/images/M/MV5BOWY3MjUzZTctOTI5ZC00MDA5LTk4ZTMtZWJjNjRmMzE4ZmI2XkEyXkFqcGc@._V1_.jpg',
  2023,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  133,
  'Alexander Payne',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Holdovers');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'August Rush',
  'A musically gifted orphan, Evan, runs away from his orphanage and searches New York City for his birth parents. On his journey, he''s taken under the wing of the Wizard, a homeless man who lives in an abandoned theater.',
  'https://m.media-amazon.com/images/M/MV5BNDIwNjE3NjU2NV5BMl5BanBnXkFtZTcwNTQ2NjQzMw@@._V1_.jpg',
  2007,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  114,
  'Kirsten Sheridan',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'August Rush');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Help',
  'An aspiring author during the civil rights movement of the 1960s decides to write a book detailing the African American maids'' point of view on the white families for which they work, and the hardships they go through on a daily basis.',
  'https://m.media-amazon.com/images/M/MV5BMTM5OTMyMjIxOV5BMl5BanBnXkFtZTcwNzU4MjIwNQ@@._V1_.jpg',
  2011,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  146,
  'Tate Taylor',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Help');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dead Poets Society',
  'Maverick teacher John Keating returns in 1959 to the prestigious New England boys'' boarding school where he was once a star student, using poetry to embolden his pupils to new heights of self-expression.',
  'https://m.media-amazon.com/images/M/MV5BMDYwNGVlY2ItMWYxMS00YjZiLWE5MTAtYWM5NWQ2ZWJjY2Q3XkEyXkFqcGc@._V1_.jpg',
  1989,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  128,
  'Peter Weir',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Dead Poets Society');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Little Miss Sunshine',
  'A family determined to get their young daughter into the finals of a beauty pageant take a cross-country trip in their VW bus.',
  'https://m.media-amazon.com/images/M/MV5BMTgzNTgzODU0NV5BMl5BanBnXkFtZTcwMjEyMjMzMQ@@._V1_.jpg',
  2006,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  101,
  'Jonathan Dayton, Valerie Faris',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Little Miss Sunshine');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'When Harry Met Sally...',
  'Harry and Sally have known each other for years, and are very good friends, but they fear sex would ruin the friendship.',
  'https://m.media-amazon.com/images/M/MV5BMjE0ODEwNjM2NF5BMl5BanBnXkFtZTcwMjU2Mzg3NA@@._V1_.jpg',
  1989,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  95,
  'Rob Reiner',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'When Harry Met Sally...');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'My Uncle',
  'Monsieur Hulot visits the technology-driven world of his sister, brother-in-law, and nephew, but he can''t quite fit into the surroundings.',
  'https://m.media-amazon.com/images/M/MV5BZjdiZjAwMDUtNjBkMy00MGMzLWI4NTYtODJkNjk5OTQ3NTlkXkEyXkFqcGc@._V1_.jpg',
  1958,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  116,
  'Jacques Tati',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'My Uncle');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pleasantville',
  'Two 1990s teenage siblings find themselves transported to a 1950s sitcom where their influence begins to profoundly change that colorless, complacent world.',
  'https://m.media-amazon.com/images/M/MV5BYmM4ZThmNzAtYzRmNi00ZjZmLThhYjAtYjU2YTcwMmY3MzRmXkEyXkFqcGc@._V1_.jpg',
  1998,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  124,
  'Gary Ross',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Pleasantville');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Groundhog Day',
  'A curmudgeonly weatherman finds himself stuck in a time loop and is forced to relive the same day over and over again.',
  'https://m.media-amazon.com/images/M/MV5BOWE3MjQ3ZDAtNDQ2MC00YjBjLTk0ZWYtNjQ0YzQ4YWE3YTEyXkEyXkFqcGc@._V1_.jpg',
  1993,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  101,
  'Harold Ramis',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Groundhog Day');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Singin'' in the Rain',
  'When Hollywood''s silent era gives way to talkies, a dashing screen idol and a gifted newcomer navigate romance, rivalry, and the comic chaos of reinventing the movies.',
  'https://m.media-amazon.com/images/M/MV5BMGQzZDFjZWUtZDU4ZS00ZjM3LTgyYmItYjA3YmIwYzRkZWY3XkEyXkFqcGc@._V1_.jpg',
  1952,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  103,
  'Stanley Donen, Gene Kelly',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Singin'' in the Rain');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Coach Carter',
  'Controversy surrounds high school basketball coach Ken Carter after he benches his entire team for breaking their academic contract with him.',
  'https://m.media-amazon.com/images/M/MV5BNjk0M2Y4ZTUtNzA3MS00MWYwLThmYjktMmYzNzVkYzQ3NmFlXkEyXkFqcGc@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  136,
  'Thomas Carter',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Coach Carter');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Love Actually',
  'Follows the lives of eight very different couples in dealing with their love lives in various loosely interrelated tales all set during a frantic month before Christmas in London, England.',
  'https://m.media-amazon.com/images/M/MV5BYWRlZjcwYTgtYWJkOS00MGYwLTk3Y2ItNmU4NTg5Nzg2YTQ2XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  135,
  'Richard Curtis',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Love Actually');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Princess Bride',
  'A bedridden boy''s grandfather reads him the story of a farmboy-turned-pirate who encounters numerous obstacles, enemies and allies in his quest to be reunited with his true love.',
  'https://m.media-amazon.com/images/M/MV5BMjFiOTEyNGMtN2E4MC00ZjZlLTk3ZDQtNTU1ZGNiZTA1MzJlXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  98,
  'Rob Reiner',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Princess Bride');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sing Street',
  'A young lad notices a beautiful girl who begins to occupy his thoughts. While struggling with poverty, personal relationships and life''s woes, he starts a band, hoping to catch her attention.',
  'https://m.media-amazon.com/images/M/MV5BMjEzODA3MDcxMl5BMl5BanBnXkFtZTgwODgxNDk3NzE@._V1_.jpg',
  2016,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  106,
  'John Carney',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Sing Street');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Amélie',
  'Despite being caught in her imaginative world, young waitress Amelie decides to help people find happiness. Her quest to spread joy leads her on a journey during which she finds true love.',
  'https://m.media-amazon.com/images/M/MV5BOTNmYzY0MWQtZGZmNy00Y2Y4LWFmMDQtMTZjYTdiYzEwZGQ2XkEyXkFqcGc@._V1_.jpg',
  2001,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  122,
  'Jean-Pierre Jeunet',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Amélie');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'You''ve Got Mail',
  'Book superstore magnate Joe Fox and independent book shop owner Kathleen Kelly fall in love in the anonymity of the Internet, both blissfully unaware that he''s trying to put her out of business.',
  'https://m.media-amazon.com/images/M/MV5BN2FhMWRiODYtMTQwMy00OTE2LTlhZjMtNWRmYmIyZjYwYTk1XkEyXkFqcGc@._V1_.jpg',
  1998,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  119,
  'Nora Ephron',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'You''ve Got Mail');

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
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  104,
  'Peyton Reed',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Yes Man');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Paddington 2',
  'Paddington, now happily settled with the Brown family and a popular member of the local community, picks up a series of odd jobs to buy the perfect present for his Aunt Lucy''s 100th birthday, only for the gift to be stolen.',
  'https://m.media-amazon.com/images/M/MV5BNTk1YzlhMTUtZmU5MC00NmRmLTlkZjItYzQ0NTY4Y2NiNzc4XkEyXkFqcGc@._V1_.jpg',
  2017,
  array['comedy', 'drama', 'feelgood']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).',
  103,
  'Paul King',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Paddington 2');

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
