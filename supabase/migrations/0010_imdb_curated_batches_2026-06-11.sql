-- Catalogue seed: user curated IMDb batches (2026-06-11).
-- Sources: data/imdb-curated-batch-2026-06-11.json,
--          data/imdb-curated-batch-fantasy-adventure-2026-06-11.json,
--          data/imdb-curated-batch-animation-adventure-2026-06-11.json
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
  'Father Goose',
  'During World War II, a man who''s been persuaded to live on an isolated Pacific island and spot aircraft finds himself responsible for a teacher and several young female students.',
  'https://m.media-amazon.com/images/M/MV5BNWNiODllMzEtYTM0OC00NzIxLWI4ZDEtMjcwNTZkN2Y4MGE2XkEyXkFqcGc@._V1_.jpg',
  1964,
  array['comedy', 'drama']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  118,
  'Ralph Nelson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Father Goose');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Sting',
  'Two grifters team up to pull off the ultimate con.',
  'https://m.media-amazon.com/images/M/MV5BZGI4OTk4MDMtYmQ1Ni00YTUzLTkyYTktZGUwMjMyN2M4NjQ5XkEyXkFqcGc@._V1_.jpg',
  1973,
  array['comedy', 'drama']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  129,
  'George Roy Hill',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Sting');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Crocodile Dundee',
  'An American reporter travels to the Australian outback to meet eccentric poacher Mick "Crocodile" Dundee and invites him to New York City, where he comes face-to-face with the complexities of modern life.',
  'https://m.media-amazon.com/images/M/MV5BMDFkMTYyNWUtOGNjMy00MTMyLWFkMTQtYzZiMmY1NzBhN2I3XkEyXkFqcGc@._V1_.jpg',
  1986,
  array['comedy', 'drama']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  97,
  'Peter Faiman',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Crocodile Dundee');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Flight of the Navigator',
  'In 1978, a boy travels eight years into the future and has an adventure with an intelligent, wisecracking alien ship.',
  'https://m.media-amazon.com/images/M/MV5BZTJhYTMyNDMtMjAyYy00YTRkLWJmZGMtMDZlODc0NWZmZDRhXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['adventure', 'fantasy']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  90,
  'Randal Kleiser',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Flight of the Navigator');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Labyrinth',
  'Teenage Sarah journeys through a maze to save her baby brother from the Goblin King.',
  'https://m.media-amazon.com/images/M/MV5BMjM2MDE4OTQwOV5BMl5BanBnXkFtZTgwNjgxMTg2NzE@._V1_.jpg',
  1986,
  array['adventure', 'fantasy']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  101,
  'Jim Henson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Labyrinth');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Roxanne',
  'The large-nosed C.D. Bales is in love with the beautiful Roxanne; she falls for his personality but another man''s looks.',
  'https://m.media-amazon.com/images/M/MV5BZDkyMzFhYjktYWE5My00YTVhLWE1NjEtZWMyNzliMDMzYzJhXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  107,
  'Fred Schepisi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Roxanne');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Secret of My Success',
  'A talented young man can''t get an executive position without rising through the ranks, so he comes up with a shortcut, which also benefits his love life.',
  'https://m.media-amazon.com/images/M/MV5BYzhjZjlhYjYtNjhmOS00ZDNhLWFjNzktMWQ5N2ZkMGM1NTBlXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['comedy', 'drama']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  111,
  'Herbert Ross',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Secret of My Success');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Willow',
  'A young farmer is chosen to undertake a perilous journey in order to protect a special baby from an evil queen. Along the way, he teams up with a disgraced swordsman to defeat the evil sorceress.',
  'https://m.media-amazon.com/images/M/MV5BM2E5Mjg3NzItNTNlNy00NzJmLThjOGUtZjdjMTZiMGJkYTMzXkEyXkFqcGc@._V1_.jpg',
  1988,
  array['adventure', 'fantasy']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  126,
  'Ron Howard',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Willow');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Joe Versus the Volcano',
  'When a hypochondriac learns that he is dying, he accepts an offer to throw himself in a volcano at a tropical island, and along the way there, learns to truly live.',
  'https://m.media-amazon.com/images/M/MV5BNTVjMThjOWMtODQzYS00MzFmLTg1OWEtZTQzYTQ0YzA0N2Q1XkEyXkFqcGc@._V1_.jpg',
  1990,
  array['drama', 'adventure']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  102,
  'John Patrick Shanley',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Joe Versus the Volcano');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Doc Hollywood',
  'A young doctor on his way across the country to a job interview crashes his car in a small town and is sentenced to work for several days at the town hospital.',
  'https://m.media-amazon.com/images/M/MV5BZWQ2NDk0YWQtNGNkMy00Nzc4LTgwMGEtMmFlNDVhZTI2MTEzXkEyXkFqcGc@._V1_.jpg',
  1991,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  104,
  'Michael Caton-Jones',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Doc Hollywood');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Swingers',
  'A wannabe actor has a hard time moving on from a break-up, but he is lucky to have supportive friends.',
  'https://m.media-amazon.com/images/M/MV5BMWMyNzc3NGEtMzdlMy00OGFjLWIwN2ItYmUxNmVhN2Y0ODYyXkEyXkFqcGc@._V1_.jpg',
  1996,
  array['comedy', 'drama']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  96,
  'Doug Liman',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Swingers');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Twister',
  'Two storm chasers on the brink of divorce must work together to create an advanced weather alert system by putting themselves in the cross-hairs of extremely violent tornadoes.',
  'https://m.media-amazon.com/images/M/MV5BNGVhY2JjYzgtYjAyOC00ODg0LTliYWEtMzliZWYzMjA2NjYyXkEyXkFqcGc@._V1_.jpg',
  1996,
  array['adventure', 'fantasy']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  113,
  'Jan de Bont',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Twister');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Grosse Pointe Blank',
  'Professional assassin Martin Blank is sent on a mission to a small Detroit suburb, Grosse Pointe--where, by coincidence, his 10-year high-school reunion party is about to take place.',
  'https://m.media-amazon.com/images/M/MV5BZDJkMWJkMTgtZjljZS00ZDNlLWE2MjEtNjQ2NzI5NDk4MTRkXkEyXkFqcGc@._V1_.jpg',
  1997,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  107,
  'George Armitage',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Grosse Pointe Blank');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Edtv',
  'A video store clerk agrees to have his life filmed by a camera crew for a television show.',
  'https://m.media-amazon.com/images/M/MV5BN2UzMzljOGEtZjYzZS00ZmNmLTg4NzctYWI2NDI4NjEwOGEwXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['comedy', 'drama']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  122,
  'Ron Howard',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Edtv');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mumford',
  'In the small town of Mumford, a psychologist of the same name moves in and quickly becomes very popular, despite a questionable past.',
  'https://m.media-amazon.com/images/M/MV5BMzRiOGE3Y2UtNGYxNy00MDZmLWE3MDAtYWFjMTJlOTdjYmY3XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  112,
  'Lawrence Kasdan',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Mumford');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Treasure Planet',
  'Jim Hawkins is a teenager who finds the map of a great treasure hidden by a space pirate. Together with some friends, he sets off in a large spaceship, shaped like a caravel, on his quest.',
  'https://m.media-amazon.com/images/M/MV5BN2VjNjk5MTAtNDE3Ni00NjczLWFhN2EtNGQ1ZmZmOWRjZjIyXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['animation', 'adventure', 'fantasy']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  95,
  'Ron Clements, John Musker',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Treasure Planet');

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
  'Catalogue: curated IMDb batch (2026-06-11).',
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
  'Van Helsing',
  'The famed monster hunter is sent to Transylvania to stop Count Dracula, who is using Dr. Frankenstein''s research and a werewolf for nefarious purposes.',
  'https://m.media-amazon.com/images/M/MV5BNDk3NTdlYzQtMjhiMy00MWJkLWFjNDctMzE4ZGEwZWExNGViXkEyXkFqcGc@._V1_.jpg',
  2004,
  array['thriller', 'horror']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  131,
  'Stephen Sommers',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Van Helsing');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pride & Prejudice',
  'When Elizabeth Bennet meets the handsome Mr. Darcy, she believes he is the last man she could ever marry, but as their lives become intertwined, she finds herself captivated by the man she has sworn to hate forever.',
  'https://m.media-amazon.com/images/M/MV5BMTA1NDQ3NTcyOTNeQTJeQWpwZ15BbWU3MDA0MzA4MzE@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  129,
  'Joe Wright',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Pride & Prejudice');

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
  'Catalogue: curated IMDb batch (2026-06-11).',
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
  'Stranger Than Fiction',
  'I.R.S. auditor Harold Crick suddenly finds his mundane Chicago life to be the subject of narration only he can hear: narration that begins to affect his entire existence, from his work to his love life to his death.',
  'https://m.media-amazon.com/images/M/MV5BNzFmZjZhOTktYWIxZS00YzM1LWEzNmQtMDM2YjlhYmI2MDVlXkEyXkFqcGc@._V1_.jpg',
  2006,
  array['drama', 'adventure']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  113,
  'Marc Forster',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Stranger Than Fiction');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'No Country for Old Men',
  'Violence and mayhem ensue after a hunter stumbles upon the aftermath of a drug deal gone wrong and over two million dollars in cash near the Rio Grande.',
  'https://m.media-amazon.com/images/M/MV5BMjA5Njk3MjM4OV5BMl5BanBnXkFtZTcwMTc5MTE1MQ@@._V1_.jpg',
  2007,
  array['thriller', 'crime']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  122,
  'Ethan Coen, Joel Coen',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'No Country for Old Men');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Stardust',
  'In a countryside town bordering on a magical land, a young man makes a promise to his beloved that he''ll retrieve a fallen star by venturing into the magical realm.',
  'https://m.media-amazon.com/images/M/MV5BMjkyMTE1OTYwNF5BMl5BanBnXkFtZTcwMDIxODYzMw@@._V1_.jpg',
  2007,
  array['adventure', 'fantasy']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  127,
  'Matthew Vaughn',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Stardust');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Adventures of Tintin',
  'Intrepid reporter Tintin and Captain Haddock set off on a treasure hunt for a sunken ship commanded by Haddock''s ancestor.',
  'https://m.media-amazon.com/images/M/MV5BNDE5MDExNTQ1OF5BMl5BanBnXkFtZTcwMDIxMTM5Ng@@._V1_.jpg',
  2011,
  array['animation', 'adventure', 'fantasy']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  107,
  'Steven Spielberg',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Adventures of Tintin');

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
  'Catalogue: curated IMDb batch (2026-06-11).',
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
  'The Secret Life of Walter Mitty',
  'When both he and a colleague are about to lose their job, Walter takes action by embarking on an adventure more extraordinary than anything he ever imagined.',
  'https://m.media-amazon.com/images/M/MV5BODYwNDYxNDk1Nl5BMl5BanBnXkFtZTgwOTAwMTk2MDE@._V1_.jpg',
  2013,
  array['adventure', 'fantasy']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  114,
  'Ben Stiller',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Secret Life of Walter Mitty');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Chef',
  'When Chef Carl Casper faces a career crisis, he hits the road to rediscover his passion for cooking.',
  'https://m.media-amazon.com/images/M/MV5BODkyNTI4YjUtNjEyNC00NWQ5LTk4M2YtM2Q3NjBiYmJmMGUyXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  114,
  'Jon Favreau',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Chef');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Longest Ride',
  'Sophia and Luke make an unexpected and fateful connection with Ira, a 90-year-old man, when they save him from a car crash. Ira''s memories of his own decades-long romance with his beloved wife deeply inspire the young couple.',
  'https://m.media-amazon.com/images/M/MV5BMzIzMjg0NjQwNF5BMl5BanBnXkFtZTgwODAwOTE4MzE@._V1_.jpg',
  2015,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  123,
  'George Tillman Jr.',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Longest Ride');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Miss Peregrine''s Home for Peculiar Children',
  'When Jacob discovers clues to a mystery that stretches across time, he finds Miss Peregrine''s Home for Peculiar Children. But the danger deepens after he gets to know the residents and learns about their special powers.',
  'https://m.media-amazon.com/images/M/MV5BMTU0Nzc5NzI5NV5BMl5BanBnXkFtZTgwNTk1MDE4MDI@._V1_.jpg',
  2016,
  array['adventure', 'fantasy']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  127,
  'Tim Burton',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Miss Peregrine''s Home for Peculiar Children');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Little Forest',
  'A young woman grows tired of life in the city and returns to her hometown in the countryside.',
  'https://m.media-amazon.com/images/M/MV5BMGE1ZjdjN2ItMzFjMS00OTYwLTgwMTEtMmM1Y2YwYmYzYzVkXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['comedy', 'drama', 'feelgood']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  103,
  'Soon-rye Yim',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Little Forest');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Witch: Part 1 - The Subversion',
  'When a bright high school student with memory loss enters a national talent show to help her struggling family, she finds her ordinary life flipped upside down by the sudden arrival of mysterious strangers seemingly connected to her past.',
  'https://m.media-amazon.com/images/M/MV5BYjE4NTFjOGEtOWZkMC00YTBiLWE4ZDctZTdhMTkxY2FlMDBlXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['thriller', 'horror']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  125,
  'Park Hoon-jung',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Witch: Part 1 - The Subversion');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Knives Out',
  'When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate.',
  'https://m.media-amazon.com/images/M/MV5BZDU5ZTRkYmItZjg0Mi00ZTQwLThjMWItNWM3MTMxMzVjZmVjXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['comedy', 'crime', 'mystery']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  130,
  'Rian Johnson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Knives Out');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Puss in Boots: The Last Wish',
  'When Puss in Boots discovers that his passion for adventure has taken its toll and he has burned through eight of his nine lives, he launches an epic journey to restore them by finding the mythical Last Wish.',
  'https://m.media-amazon.com/images/M/MV5BMzg0MWUzMjctYjVlOS00NzVjLWIwZDMtNzg1YzNkYzdjNTMwXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['animation', 'adventure', 'fantasy']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  102,
  'Joel Crawford, Januel Mercado',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Puss in Boots: The Last Wish');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dungeons & Dragons: Honor Among Thieves',
  'A charming thief and a band of unlikely adventurers embark on an epic quest to retrieve a lost relic, but things go dangerously awry when they run afoul of the wrong people.',
  'https://m.media-amazon.com/images/M/MV5BOGRjMjQ0ZDAtODc0OS00MGY1LTkxMTMtODhhNjY5NTM4N2IwXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['adventure', 'fantasy']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  134,
  'John Francis Daley, Jonathan Goldstein',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Dungeons & Dragons: Honor Among Thieves');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Nimona',
  'When a knight in a futuristic medieval world is framed for a crime he didn''t commit, the only one who can help him prove his innocence is Nimona -- a mischievous teen who happens to be a shapeshifting creature he''s sworn to destroy.',
  'https://m.media-amazon.com/images/M/MV5BMjIyMmY0MWYtZGRkMC00MjhhLTgwNGUtYWVjZmQ4YjhjZWRmXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['animation', 'adventure', 'fantasy']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  101,
  'Nick Bruno, Troy Quane',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Nimona');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Killer',
  'Solitary, cold, methodical and unencumbered by scruples or regrets, a killer waits in the shadows, watching for his next target. Yet, the longer he waits, the more he thinks he''s losing his mind, if not his cool.',
  'https://m.media-amazon.com/images/M/MV5BYzU2MTlkMTctNWI3MC00ODUzLTlmYzQtMzZjYjVmMmYwZGU0XkEyXkFqcGc@._V1_.jpg',
  2023,
  array['thriller']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  118,
  'David Fincher',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Killer');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Borderlands',
  'An infamous bounty hunter returns to her childhood home, the chaotic planet Pandora, and forms an unlikely alliance with a team of misfits to find the missing daughter of the most powerful man in the universe.',
  'https://m.media-amazon.com/images/M/MV5BMDhkMzQzZmQtOGQ1NS00Y2FhLTkzYjAtNWE1MmRiOWM1MjUzXkEyXkFqcGc@._V1_.jpg',
  2024,
  array['thriller', 'horror']::text[],
  'trending',
  4.7::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  101,
  'Eli Roth',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Borderlands');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Caddo Lake',
  'When an 8-year-old girl disappears on Caddo Lake, a series of past deaths and disappearances begin to link together, altering a broken family''s history.',
  'https://m.media-amazon.com/images/M/MV5BZmIyOGI3NjgtZWJlYS00NzQ0LWJkMDUtNjhlYmFkYjI3NTM5XkEyXkFqcGc@._V1_.jpg',
  2024,
  array['thriller', 'horror']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  103,
  'Logan George, Celine Held',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Caddo Lake');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sinners',
  'Trying to leave their troubled lives behind, twin brothers return to their hometown to start again, only to discover that an even greater evil is waiting to welcome them back.',
  'https://m.media-amazon.com/images/M/MV5BNjIwZWY4ZDEtMmIxZS00NDA4LTg4ZGMtMzUwZTYyNzgxMzk5XkEyXkFqcGc@._V1_.jpg',
  2025,
  array['thriller']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  137,
  'Ryan Coogler',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Sinners');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Weapons',
  'When all but one child from the same class mysteriously vanish on the same night at exactly the same time, a community is left questioning who or what is behind their disappearance.',
  'https://m.media-amazon.com/images/M/MV5BNTBhNWJjZWItYzY3NS00M2NkLThmOWYtYTlmNzBmN2UxZWFjXkEyXkFqcGc@._V1_.jpg',
  2025,
  array['thriller', 'horror']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: curated IMDb batch (2026-06-11).',
  128,
  'Zach Cregger',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Weapons');

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
