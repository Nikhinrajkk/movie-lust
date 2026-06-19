-- Catalogue seed: IMDb list ls000024621 (Marvel Films).
-- Source: data/imdb-list-ls000024621.json
-- Idempotent inserts (skip when title already exists). All rows approval_status = pending.

do $$
begin
  if exists (
    select 1 from pg_trigger t join pg_class c on c.oid = t.tgrelid join pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public' and c.relname = 'movies' and t.tgname = 'trg_movies_insert_must_be_pending' and not t.tgisinternal
  ) then execute 'alter table public.movies disable trigger trg_movies_insert_must_be_pending'; end if;
end $$;

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Howard the Duck',
  'A sarcastic humanoid duck is pulled from his homeworld to Earth where he must stop an alien invasion with the help of a nerdy scientist and a struggling female rock singer.',
  'https://m.media-amazon.com/images/M/MV5BZTA4ZjJkZjQtNzMwMy00YjJjLTkwYzgtZDY0YmNhZjYzMGExXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['superhero', 'action', 'adventure', 'comedy', 'romance', 'sci-fi']::text[],
  'trending',
  4.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  110,
  'Willard Huyck',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Howard the Duck');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Punisher (1989)',
  'When Frank Castle''s family is murdered by criminals, he wages war on crime as a vigilante assassin known only as The Punisher.',
  'https://m.media-amazon.com/images/M/MV5BYTk4NDEwM2ItOWJmYi00YjgxLTk5MTQtYTNlNzc1MmQzMmU4XkEyXkFqcGc@._V1_.jpg',
  1989,
  array['superhero', 'action', 'crime', 'thriller']::text[],
  'trending',
  5.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  89,
  'Mark Goldblatt',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Punisher (1989)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America (1990)',
  'Frozen in the ice for decades, Captain America is freed to battle against archcriminal The Red Skull.',
  'https://m.media-amazon.com/images/M/MV5BZjAwNGM0NWUtNmIwZC00OGEzLWFjZGEtMWE5ZjJjM2ZjZThhXkEyXkFqcGc@._V1_.jpg',
  1990,
  array['superhero', 'action', 'adventure', 'sci-fi', 'war']::text[],
  'trending',
  3.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  97,
  'Albert Pyun',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America (1990)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fantastic Four',
  'When dosed with cosmic rays, four intrepid explorers are given incredible powers.',
  'https://m.media-amazon.com/images/M/MV5BMTk2ODU4MDUtYWNiNy00MjIzLWFhM2UtMDkzZDE1MTBhOGEyXkEyXkFqcGc@._V1_.jpg',
  1994,
  array['superhero', 'action', 'adventure', 'family', 'sci-fi']::text[],
  'trending',
  3.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  90,
  'Oley Sassone',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Fantastic Four');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Blade',
  'A half-vampire, half-mortal man becomes a protector of the mortal race, while slaying evil vampires.',
  'https://m.media-amazon.com/images/M/MV5BNzAzMmY3OWMtNDgyMS00Y2U4LTlmM2UtY2YwMmM0MDI5ODJmXkEyXkFqcGc@._V1_.jpg',
  1998,
  array['superhero', 'action', 'horror', 'sci-fi']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  120,
  'Stephen Norrington',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Blade');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men',
  'In a world where mutants (evolved super-powered humans) exist and are discriminated against, two groups form for an inevitable clash: the supremacist Brotherhood, and the pacifist X-Men.',
  'https://m.media-amazon.com/images/M/MV5BNzNjZjQwOTAtNWQ3NC00MmJlLThlZDEtZmUyMWQ3NmE4Y2Y5XkEyXkFqcGc@._V1_.jpg',
  2000,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  104,
  'Bryan Singer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Blade II',
  'Blade forms an uneasy alliance with the vampire council in order to combat the Reapers, who are feeding on vampires.',
  'https://m.media-amazon.com/images/M/MV5BMGE5ZmY2NzEtZTEyMi00MWIyLThmOWYtYzJkOTQ0Y2U3ZWU1XkEyXkFqcGc@._V1_.jpg',
  2002,
  array['superhero', 'action', 'horror', 'sci-fi', 'thriller']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  117,
  'Guillermo del Toro',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Blade II');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man (2002)',
  'A shy teenager is bitten by a genetically modified spider and uses his new spider-like abilities to fight injustice as a masked superhero.',
  'https://m.media-amazon.com/images/M/MV5BZWM0OWVmNTEtNWVkOS00MzgyLTkyMzgtMmE2ZTZiNjY4MmFiXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  121,
  'Sam Raimi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man (2002)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Daredevil',
  'A man blinded by toxic waste which also enhanced his remaining senses fights crime as an acrobatic martial arts superhero.',
  'https://m.media-amazon.com/images/M/MV5BZGVjZjU3MmEtNDFjZS00N2ExLTk4YzktYjYzM2MzYTJjYmE0XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['superhero', 'action', 'crime', 'drama', 'sci-fi']::text[],
  'trending',
  5.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  103,
  'Mark Steven Johnson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Daredevil');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X2: X-Men United',
  'When anti-mutant Colonel William Stryker kidnaps Professor X and attacks his school, the X-Men must ally with their archenemy Magneto to stop him.',
  'https://m.media-amazon.com/images/M/MV5BNDk0NjYxMzIzOF5BMl5BanBnXkFtZTYwMTc1MjU3._V1_.jpg',
  2003,
  array['superhero', 'action', 'sci-fi', 'thriller']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  134,
  'Bryan Singer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X2: X-Men United');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hulk',
  'Bruce Banner, a genetics researcher with a tragic past, suffers a lab accident that makes him transform into a raging, giant green monster when angered, making him a target of forces seeking to abuse his power.',
  'https://m.media-amazon.com/images/M/MV5BNTQxMmVlMTItMGFjYi00MTc2LWE5MzMtYjFhZWJmZGY0MTY5XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  5.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  138,
  'Ang Lee',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Hulk');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Punisher (2004)',
  'An undercover FBI agent becomes a vigilante and sets out to unleash his wrath upon the corrupt businessman who slaughtered his entire family at a reunion.',
  'https://m.media-amazon.com/images/M/MV5BMjI5NjcwMTQxMV5BMl5BanBnXkFtZTcwODg5ODkwNQ@@._V1_.jpg',
  2004,
  array['superhero', 'action', 'crime', 'drama', 'thriller']::text[],
  'trending',
  6.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  124,
  'Jonathan Hensleigh',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Punisher (2004)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man 2',
  'Peter Parker is beset with troubles in his failing personal life as he battles a former brilliant scientist named Otto Octavius.',
  'https://m.media-amazon.com/images/M/MV5BNGQ0YTQyYTgtNWI2YS00NTE2LWJmNDItNTFlMTUwNmFlZTM0XkEyXkFqcGc@._V1_.jpg',
  2004,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  127,
  'Sam Raimi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Blade: Trinity',
  'Blade, now a wanted man by the FBI, must join forces with the Nightstalkers to face his most challenging enemy yet: Dracula.',
  'https://m.media-amazon.com/images/M/MV5BMjE0Nzg2MzI3MF5BMl5BanBnXkFtZTYwMjExODQ3._V1_.jpg',
  2004,
  array['superhero', 'action', 'horror', 'sci-fi']::text[],
  'trending',
  5.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  113,
  'David S. Goyer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Blade: Trinity');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Elektra',
  'An assassin''s change of heart leads her into a war against an evil crime syndicate.',
  'https://m.media-amazon.com/images/M/MV5BMTI3MTUwNzM5MV5BMl5BanBnXkFtZTcwNzczMDIzMw@@._V1_.jpg',
  2005,
  array['superhero', 'action', 'adventure', 'crime', 'fantasy']::text[],
  'trending',
  4.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  97,
  'Rob Bowman',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Elektra');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Man-Thing',
  'Agents of an oil tycoon vanish while exploring a swamp marked for drilling. The local sheriff investigates and faces a Seminole legend come to life: Man-Thing, a shambling swamp-monster whose touch burns those who feel fear.',
  'https://m.media-amazon.com/images/M/MV5BMDI0YTYxMDMtYmFjOS00ZmQ1LTgwZDUtOGQwMGIzMDhkNTVkXkEyXkFqcGc@._V1_.jpg',
  2005,
  array['superhero', 'action', 'adventure', 'horror', 'romance', 'sci-fi']::text[],
  'trending',
  4.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  97,
  'Brett Leonard',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Man-Thing');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fantastic Four (2005)',
  'A group of astronauts gain superpowers after a cosmic radiation exposure and must use them to oppose the plans of their enemy, Doctor Victor Von Doom.',
  'https://m.media-amazon.com/images/M/MV5BNjY2YmZmMzUtZWY5Mi00MzI3LTljOTgtYTMwMWY1ODI5ZWY5XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  5.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  106,
  'Tim Story',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Fantastic Four (2005)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men: The Last Stand',
  'The human government develops a cure for mutations, and Jean Grey becomes a darker uncontrollable persona called the Phoenix who allies with Magneto, causing escalation into an all-out battle for the X-Men.',
  'https://m.media-amazon.com/images/M/MV5BMThmOWE3OWEtODJmNC00ZDEzLTk4MWUtNzEzM2RiNmJiZmU3XkEyXkFqcGc@._V1_.jpg',
  2006,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  104,
  'Brett Ratner',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men: The Last Stand');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ghost Rider',
  'A motorcycle stuntman who sold his soul becomes a supernatural agent of vengeance.',
  'https://m.media-amazon.com/images/M/MV5BMzIyNDE5ODI1OV5BMl5BanBnXkFtZTcwNTIyNDE0MQ@@._V1_.jpg',
  2007,
  array['superhero', 'action', 'fantasy', 'thriller']::text[],
  'trending',
  5.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  110,
  'Mark Steven Johnson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Ghost Rider');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man 3',
  'A strange black entity from another world bonds with Peter Parker and causes inner turmoil as he contends with new villains, temptations, and revenge.',
  'https://m.media-amazon.com/images/M/MV5BODE2NzNhMDctYjUzMC00Y2M5LWI2Y2EtODJkZTFjN2Y5ODlmXkEyXkFqcGc@._V1_.jpg',
  2007,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  139,
  'Sam Raimi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man 3');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fantastic Four: Rise of the Silver Surfer',
  'The Fantastic Four learn that they aren''t the only super-powered beings in the universe when they square off against the powerful Silver Surfer and the planet-eating Galactus.',
  'https://m.media-amazon.com/images/M/MV5BNmZmMTU0OGQtOWRmNS00ZjA1LWJkM2EtYmUwNGEzMjIyZDM1XkEyXkFqcGc@._V1_.jpg',
  2007,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  5.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  92,
  'Tim Story',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Fantastic Four: Rise of the Silver Surfer');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Iron Man',
  'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.',
  'https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_.jpg',
  2008,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  126,
  'Jon Favreau',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Iron Man');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Incredible Hulk',
  'Bruce Banner, a scientist on the run from the U.S. Government, must find a cure for the monster he turns into whenever he loses his temper.',
  'https://m.media-amazon.com/images/M/MV5BMTUyNzk3MjA1OF5BMl5BanBnXkFtZTcwMTE1Njg2MQ@@._V1_.jpg',
  2008,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  112,
  'Louis Leterrier',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Incredible Hulk');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Punisher: War Zone',
  'Frank Castle, known as the Punisher, ruthlessly demolishes organized crime, but it starts an even bigger war.',
  'https://m.media-amazon.com/images/M/MV5BZTdlOTkyZjUtODE4NC00ODZmLTg5OGYtMjkwZDY0MTZhMTQ0XkEyXkFqcGc@._V1_.jpg',
  2008,
  array['superhero', 'action', 'crime', 'drama', 'thriller']::text[],
  'trending',
  5.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  103,
  'Lexi Alexander',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Punisher: War Zone');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men Origins: Wolverine',
  'The early years of James Logan, featuring his rivalry with his brother Victor Creed, his service in the special forces team Weapon X, and his experimentation into the metal-lined mutant Wolverine.',
  'https://m.media-amazon.com/images/M/MV5BZjQwOGEzNjUtNDgwYS00NzUzLWJhZjAtNmFlNzY2YTQyOTllXkEyXkFqcGc@._V1_.jpg',
  2009,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  6.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  107,
  'Gavin Hood',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men Origins: Wolverine');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Iron Man 2',
  'With the world now aware of his identity as Iron Man, Tony Stark must contend with both his declining health and a vengeful madman with ties to his father''s legacy.',
  'https://m.media-amazon.com/images/M/MV5BYWYyOGQzOGYtMGQ1My00ZWYxLTgzZjktZWYzN2IwYjkxYzM0XkEyXkFqcGc@._V1_.jpg',
  2010,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  6.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  124,
  'Jon Favreau',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Iron Man 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thor',
  'The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.',
  'https://m.media-amazon.com/images/M/MV5BNjRhNGZjZjEtYTQzYS00OWUxLThjNGEtMTIwMTE2ZDFlZTZkXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['superhero', 'action', 'fantasy']::text[],
  'trending',
  7.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  115,
  'Kenneth Branagh',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Thor');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men: First Class',
  'In the 1960s, superpowered humans Charles Xavier and Erik Lensherr work together to find others like them, but Erik''s vengeful pursuit of an ambitious mutant who ruined his life causes a schism to divide them.',
  'https://m.media-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_.jpg',
  2011,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  131,
  'Matthew Vaughn',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men: First Class');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America: The First Avenger',
  'Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a warmonger and a terrorist organization.',
  'https://m.media-amazon.com/images/M/MV5BNzUyM2YyY2MtNzNlMS00MWU5LTgxNjAtNzZlNmI2NjU2NDZlXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  124,
  'Joe Johnston',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America: The First Avenger');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ghost Rider: Spirit of Vengeance',
  'Johnny Blaze, tortured by the Ghost Rider''s curse, gets a chance of redemption through protecting the Devil''s son, whose father is pursuing him.',
  'https://m.media-amazon.com/images/M/MV5BN2FmZGVlNTgtYTllNC00YmUzLTk5YmUtNWNhMzk3ZmE2NmQ0XkEyXkFqcGc@._V1_.jpg',
  2011,
  array['superhero', 'animation', 'action', 'adventure', 'fantasy', 'sci-fi', 'thriller']::text[],
  'trending',
  4.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  96,
  'Mark Neveldine, Brian Taylor',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Ghost Rider: Spirit of Vengeance');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Avengers',
  'Earth''s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.',
  'https://m.media-amazon.com/images/M/MV5BNGE0YTVjNzUtNzJjOS00NGNlLTgxMzctZTY4YTE1Y2Y1ZTU4XkEyXkFqcGc@._V1_.jpg',
  2012,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  8.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  143,
  'Joss Whedon',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Avengers');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Amazing Spider-Man',
  'After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers and ventures out to save the city from the machinations of a mysterious reptilian foe.',
  'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_.jpg',
  2012,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  6.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  136,
  'Marc Webb',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Amazing Spider-Man');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Iron Man 3',
  'When Tony Stark''s world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.',
  'https://m.media-amazon.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_.jpg',
  2013,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  130,
  'Shane Black',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Iron Man 3');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Wolverine',
  'Wolverine comes to Japan to meet an old friend whose life he saved years ago, and gets embroiled in a conspiracy involving yakuza and mutants.',
  'https://m.media-amazon.com/images/M/MV5BNGU0MzRhMWEtYTBkNS00NzliLWJkMmUtMDFlMjkyOTkyYmZlXkEyXkFqcGc@._V1_.jpg',
  2013,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  126,
  'James Mangold',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Wolverine');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thor: The Dark World',
  'When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane Foster.',
  'https://m.media-amazon.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_.jpg',
  2013,
  array['superhero', 'animation', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  112,
  'Alan Taylor',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Thor: The Dark World');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America: The Winter Soldier',
  'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.',
  'https://m.media-amazon.com/images/M/MV5BNWY1NjFmNDItZDhmOC00NjI1LWE0ZDItMTM0MjBjZThiOTQ2XkEyXkFqcGc@._V1_.jpg',
  2014,
  array['superhero', 'action', 'adventure', 'sci-fi', 'thriller']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  136,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America: The Winter Soldier');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Amazing Spider-Man 2',
  'When New York is put under siege by Oscorp, it is up to Spider-Man to save the city he swore to protect as well as his loved ones.',
  'https://m.media-amazon.com/images/M/MV5BOTA5NDYxNTg0OV5BMl5BanBnXkFtZTgwODE5NzU1MTE@._V1_.jpg',
  2014,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  142,
  'Marc Webb',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Amazing Spider-Man 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men: Days of Future Past',
  'The X-Men send Wolverine to the past in a desperate effort to change history and prevent an event that results in doom for both humans and mutants.',
  'https://m.media-amazon.com/images/M/MV5BNzNiYWE4NjMtMTU4OS00NmM4LWE4ZjAtYmE5OTA5NjkzODExXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['superhero', 'action', 'adventure', 'sci-fi', 'thriller']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  132,
  'Bryan Singer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men: Days of Future Past');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Guardians of the Galaxy',
  'A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
  'https://m.media-amazon.com/images/M/MV5BM2ZmNjQ2MzAtNDlhNi00MmQyLWJhZDMtNmJiMjFlOWY4MzcxXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['superhero', 'action', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  8.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  121,
  'James Gunn',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Guardians of the Galaxy');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Big Hero 6',
  'A special bond develops between plus-sized inflatable robot Baymax and prodigy Hiro Hamada, who together team up with a group of friends to form a band of high-tech heroes.',
  'https://m.media-amazon.com/images/M/MV5BYjQ3YzUyOGQtNjdlYS00YmRhLWIyOWYtMGQ3YjkwMjJiYzRjXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['superhero', 'animation', 'action', 'adventure', 'comedy', 'crime', 'family', 'sci-fi']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  102,
  'Don Hall, Chris Williams',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Big Hero 6');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Avengers: Age of Ultron',
  'When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it''s up to Earth''s mightiest heroes to stop the villainous Ultron from enacting his terrible plan.',
  'https://m.media-amazon.com/images/M/MV5BODBhYTg1NGQtNGVmNS00ZTdiLThjYTYtZDFkNzRiNTZmNDZjXkEyXkFqcGc@._V1_.jpg',
  2015,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  141,
  'Joss Whedon',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Avengers: Age of Ultron');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ant-Man',
  'Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, pull off a plan that will save the world.',
  'https://m.media-amazon.com/images/M/MV5BMjM2NTQ5Mzc2M15BMl5BanBnXkFtZTgwNTcxMDI2NTE@._V1_.jpg',
  2015,
  array['superhero', 'action', 'comedy', 'sci-fi']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  117,
  'Peyton Reed',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Ant-Man');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fantastic Four (2015)',
  'Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.',
  'https://m.media-amazon.com/images/M/MV5BMTk0OTMyMDA0OF5BMl5BanBnXkFtZTgwMzY5NTkzNTE@._V1_.jpg',
  2015,
  array['superhero', 'animation', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  4.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  100,
  'Josh Trank',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Fantastic Four (2015)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Deadpool',
  'A wisecracking mercenary gets experimented on and becomes immortal yet hideously scarred, and sets out to track down the man who ruined his looks.',
  'https://m.media-amazon.com/images/M/MV5BNzY3ZWU5NGQtOTViNC00ZWVmLTliNjAtNzViNzlkZWQ4YzQ4XkEyXkFqcGc@._V1_.jpg',
  2016,
  array['superhero', 'action', 'comedy', 'sci-fi']::text[],
  'trending',
  8.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  108,
  'Tim Miller',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Deadpool');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America: Civil War',
  'Political involvement in the Avengers'' affairs causes a rift between Captain America and Iron Man.',
  'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_.jpg',
  2016,
  array['superhero', 'action', 'sci-fi']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  147,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America: Civil War');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men: Apocalypse',
  'In the 1980s, the X-Men must defeat an ancient all-powerful mutant, En Sabah Nur, who intends to thrive by bringing destruction to the world.',
  'https://m.media-amazon.com/images/M/MV5BNjVhNWY3NjItNmZjOS00NTU3LWFiZTctNzdjNGM5Y2Y0MDUwXkEyXkFqcGc@._V1_.jpg',
  2016,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  144,
  'Bryan Singer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men: Apocalypse');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Doctor Strange',
  'While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.',
  'https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_.jpg',
  2016,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  115,
  'Scott Derrickson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Doctor Strange');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Logan',
  'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.',
  'https://m.media-amazon.com/images/M/MV5BM2JjODdkMGMtNmY2YS00OGM2LThiY2YtZGYyNzE4Nzc2ODA0XkEyXkFqcGc@._V1_.jpg',
  2017,
  array['superhero', 'action', 'drama', 'sci-fi', 'thriller']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  137,
  'James Mangold',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Logan');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Guardians of the Galaxy: Vol. 2',
  'The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord''s encounter with his father, the ambitious celestial being Ego.',
  'https://m.media-amazon.com/images/M/MV5BNWE5MGI3MDctMmU5Ni00YzI2LWEzMTQtZGIyZDA5MzQzNDBhXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['superhero', 'action', 'adventure', 'comedy', 'fantasy', 'music', 'sci-fi']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  136,
  'James Gunn',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Guardians of the Galaxy: Vol. 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: Homecoming',
  'Peter Parker tries to stop Adrian ''The Vulture'' Toomes from selling weapons made with advanced Chitauri technology while trying to balance his life as an ordinary high school student.',
  'https://m.media-amazon.com/images/M/MV5BODY2MTAzOTQ4M15BMl5BanBnXkFtZTgwNzg5MTE0MjI@._V1_.jpg',
  2017,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  133,
  'Jon Watts',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: Homecoming');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thor: Ragnarok',
  'Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless villain Hela.',
  'https://m.media-amazon.com/images/M/MV5BMjMyNDkzMzI1OF5BMl5BanBnXkFtZTgwODcxODg5MjI@._V1_.jpg',
  2017,
  array['superhero', 'action', 'adventure', 'comedy', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  130,
  'Taika Waititi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Thor: Ragnarok');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Black Panther',
  'T''Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country''s past.',
  'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_.jpg',
  2018,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  134,
  'Ryan Coogler',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Black Panther');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Avengers: Infinity War',
  'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.',
  'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg',
  2018,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  149,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Avengers: Infinity War');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Deadpool 2',
  'Foul-mouthed mutant mercenary Wade Wilson (a.k.a. Deadpool) assembles a team of fellow mutant rogues to protect a young boy with abilities from the brutal, time-traveling cyborg Cable.',
  'https://m.media-amazon.com/images/M/MV5BNGY3N2ZhYmMtYTlmYi00ZWIzLWJiZWMtMjgxMjljYTk3MDAwXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['superhero', 'action', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  119,
  'David Leitch',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Deadpool 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ant-Man and the Wasp',
  'As Scott Lang balances being both a superhero and a father, Hope van Dyne and Dr. Hank Pym present an urgent new mission that finds the Ant-Man fighting alongside The Wasp to uncover secrets from their past.',
  'https://m.media-amazon.com/images/M/MV5BODVkY2ZmZTAtYzFhMi00YzZlLWE2YWMtMDBiYjY2OTU4ZWM0XkEyXkFqcGc@._V1_.jpg',
  2018,
  array['superhero', 'action', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  7.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  118,
  'Peyton Reed',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Ant-Man and the Wasp');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Venom',
  'A failed reporter is bonded to an alien entity, one of many symbiotes who have invaded Earth. But the being takes a liking to Earth and decides to protect it.',
  'https://m.media-amazon.com/images/M/MV5BNTYwMDg5MDItNjhmZi00NmVmLThjNWItMmNkMjVkMWRhNzI2XkEyXkFqcGc@._V1_.jpg',
  2018,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  112,
  'Ruben Fleischer',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Venom');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: Into the Spider-Verse',
  'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.',
  'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_.jpg',
  2018,
  array['superhero', 'animation', 'action', 'adventure', 'family', 'fantasy', 'sci-fi']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  117,
  'Bob Persichetti, Peter Ramsey, Rodney Rothman',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: Into the Spider-Verse');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain Marvel',
  'Carol Danvers becomes one of the universe''s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.',
  'https://m.media-amazon.com/images/M/MV5BZDI1NGU2ODAtNzBiNy00MWY5LWIyMGEtZjUxZjUwZmZiNjBlXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  123,
  'Anna Boden, Ryan Fleck',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain Marvel');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Avengers: Endgame',
  'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos'' actions and restore balance to the universe.',
  'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
  2019,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  181,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Avengers: Endgame');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X-Men: Dark Phoenix',
  'Jean Grey begins to develop incredible powers that corrupt and turn her into a Dark Phoenix, causing the X-Men to have to decide if her life is worth more than all of humanity.',
  'https://m.media-amazon.com/images/M/MV5BZjcwMDIyNjctMDVmNS00MzkyLTgxMDMtNTFmNTk0NDkyNzdjXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  5.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  113,
  'Simon Kinberg',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'X-Men: Dark Phoenix');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: Far from Home',
  'Peter Parker, the beloved superhero Spider-Man, faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.',
  'https://m.media-amazon.com/images/M/MV5BMzNhNTE0NWQtN2E1Ny00NjcwLTg1YTctMGY1NmMwODJmY2NmXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['superhero', 'action', 'adventure', 'comedy', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  129,
  'Jon Watts',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: Far from Home');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Venom: Let There Be Carnage',
  'Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.',
  'https://m.media-amazon.com/images/M/MV5BZGIxMTU1MjItM2FmMi00YmFiLTgwNDMtMTczYmVjYTBhNGZhXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'animation', 'action', 'adventure', 'crime', 'fantasy', 'horror', 'sci-fi', 'thriller']::text[],
  'trending',
  5.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  97,
  'Andy Serkis',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Venom: Let There Be Carnage');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Black Widow',
  'Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.',
  'https://m.media-amazon.com/images/M/MV5BZTMyZTA0ZTItYjY3Yi00ODNjLWExYTgtYzgxZTk0NTg0Y2FlXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  134,
  'Cate Shortland',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Black Widow');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Eternals',
  'The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.',
  'https://m.media-amazon.com/images/M/MV5BZTBiZjI2M2UtZTNiNy00NmU4LWJiMjYtZjk4MDIzMzhlMjFlXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  6.2::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  156,
  'Chloé Zhao',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Eternals');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Morbius',
  'Biochemist Michael Morbius tries to cure himself of a rare blood disease, but he inadvertently infects himself with a form of vampirism instead.',
  'https://m.media-amazon.com/images/M/MV5BY2UzYzFiZWUtOGU5ZC00YTIxLWFlNGUtMGU1YmI4OWUzN2FmXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['superhero', 'action', 'adventure', 'horror', 'sci-fi', 'thriller']::text[],
  'trending',
  5.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  104,
  'Daniel Espinosa',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Morbius');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Shang-Chi and the Legend of the Ten Rings',
  'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.',
  'https://m.media-amazon.com/images/M/MV5BZmY5MDcyNzAtYzg3MC00MGNlLTg3OGItNmRjYThkZGVlNzAyXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  132,
  'Destin Daniel Cretton',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Shang-Chi and the Legend of the Ten Rings');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The New Mutants',
  'Five young mutants, just discovering their abilities while held in a secret facility against their will, fight to escape their past sins and save themselves.',
  'https://m.media-amazon.com/images/M/MV5BZGVlMjBkYmMtZDhmYS00N2QyLWI2YTgtMDU2N2UwOWYzM2MxXkEyXkFqcGc@._V1_.jpg',
  2020,
  array['superhero', 'action', 'horror', 'mystery', 'sci-fi']::text[],
  'trending',
  5.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  94,
  'Josh Boone',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The New Mutants');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: No Way Home',
  'With Spider-Man''s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear.',
  'https://m.media-amazon.com/images/M/MV5BMmFiZGZjMmEtMTA0Ni00MzA2LTljMTYtZGI2MGJmZWYzZTQ2XkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  148,
  'Jon Watts',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: No Way Home');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Doctor Strange in the Multiverse of Madness',
  'Doctor Strange teams up with a mysterious teenage girl who can travel across multiverses, to battle other-universe versions of himself which threaten to wipe out the multiverse. They seek help from the Scarlet Witch, Wong and others.',
  'https://m.media-amazon.com/images/M/MV5BN2YxZGRjMzYtZjE1ZC00MDI0LThjZmQtZTZmMzVmMmQ2NzBmXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  126,
  'Sam Raimi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Doctor Strange in the Multiverse of Madness');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thor: Love and Thunder',
  'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct.',
  'https://m.media-amazon.com/images/M/MV5BZjRiMDhiZjQtNjk5Yi00ZDcwLTkyYTEtMDc1NjdmNjFhNGIzXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['superhero', 'action', 'adventure', 'comedy', 'romance', 'sci-fi']::text[],
  'trending',
  6.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  118,
  'Taika Waititi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Thor: Love and Thunder');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Black Panther: Wakanda Forever',
  'The people of Wakanda fight to protect their home from intervening world powers as they mourn the death of King T''Challa.',
  'https://m.media-amazon.com/images/M/MV5BYWY5NDY1ZjItZDQxMy00MTAzLTgyOGQtNTQxYjFiMzZjMjUyXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['superhero', 'animation', 'action', 'adventure', 'drama', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  161,
  'Ryan Coogler',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Black Panther: Wakanda Forever');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Marvels',
  'Carol Danvers gets her powers entangled with those of Kamala Khan and Monica Rambeau, forcing them to work together to save the universe.',
  'https://m.media-amazon.com/images/M/MV5BYzczOWM4MzItMWMyOS00ZDczLWIxMzctNzBmYTgzOTI1MzI3XkEyXkFqcGc@._V1_.jpg',
  2023,
  array['superhero', 'animation', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  5.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  105,
  'Nia DaCosta',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Marvels');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Guardians of the Galaxy Vol. 3',
  'Still reeling from the loss of Gamora, Peter Quill rallies his team to defend the universe and one of their own - a mission that could mean the end of the Guardians if not successful.',
  'https://m.media-amazon.com/images/M/MV5BOTJhOTMxMmItZmE0Ny00MDc3LWEzOGEtOGFkMzY4MWYyZDQ0XkEyXkFqcGc@._V1_.jpg',
  2023,
  array['superhero', 'action', 'adventure', 'comedy', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  150,
  'James Gunn',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Guardians of the Galaxy Vol. 3');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fantastic Four: First Steps',
  'Forced to balance their roles as heroes with the strength of their family bond, the Fantastic Four must defend Earth from a ravenous space god called Galactus and his enigmatic herald, the Silver Surfer.',
  'https://m.media-amazon.com/images/M/MV5BOGM5MzA3MDAtYmEwMi00ZDNiLTg4MDgtMTZjOTc0ZGMyNTIwXkEyXkFqcGc@._V1_.jpg',
  2025,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  115,
  'Matt Shakman',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'The Fantastic Four: First Steps');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ant-Man and the Wasp: Quantumania',
  'Scott Lang and Hope Van Dyne are dragged into the Quantum Realm, along with Hope''s parents and Scott''s daughter Cassie. Together they must find a way to escape, but what secrets is Hope''s mother hiding? And who is the mysterious Kang?',
  'https://m.media-amazon.com/images/M/MV5BMThkYWY5ZjQtYjJlMS00MDFmLWFkYzEtODEzZjg5YWFmMGY4XkEyXkFqcGc@._V1_.jpg',
  2023,
  array['superhero', 'animation', 'action', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  6.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  124,
  'Peyton Reed',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Ant-Man and the Wasp: Quantumania');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Deadpool & Wolverine',
  'Deadpool is offered a place in the Marvel Cinematic Universe by the Time Variance Authority, but instead recruits a variant of Wolverine to save his universe from extinction.',
  'https://m.media-amazon.com/images/M/MV5BZTk5ODY0MmQtMzA3Ni00NGY1LThiYzItZThiNjFiNDM4MTM3XkEyXkFqcGc@._V1_.jpg',
  2024,
  array['superhero', 'action', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  128,
  'Shawn Levy',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Deadpool & Wolverine');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: Across the Spider-Verse',
  'Traveling across the multiverse, Miles Morales meets a new team of Spider-People, made up of heroes from different dimensions. But when the heroes clash over how to deal with a new threat, Miles finds himself at a crossroads.',
  'https://m.media-amazon.com/images/M/MV5BNThiZjA3MjItZGY5Ni00ZmJhLWEwN2EtOTBlYTA4Y2E0M2ZmXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['superhero', 'animation', 'action', 'adventure', 'family', 'fantasy', 'sci-fi']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  140,
  'Joaquim Dos Santos, Kemp Powers, Justin K. Thompson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: Across the Spider-Verse');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kraven the Hunter',
  'Kraven''s complex relationship with his ruthless father, Nikolai Kravinoff, starts him down a path of vengeance with brutal consequences, motivating him to become not only the greatest hunter in the world, but also one of its most feared.',
  'https://m.media-amazon.com/images/M/MV5BZDU0YTI5ODAtN2NmMS00YTg3LTgyNDItN2RmOWEzOTkzZjcyXkEyXkFqcGc@._V1_.jpg',
  2024,
  array['superhero', 'action', 'adventure', 'thriller']::text[],
  'trending',
  5.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  127,
  'J.C. Chandor',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Kraven the Hunter');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Madame Web',
  'Forced to confront her past, Cassandra Webb, a Manhattan paramedic that may have clairvoyant abilities, forms a relationship with three young women destined for powerful futures, if they can survive their threatening present.',
  'https://m.media-amazon.com/images/M/MV5BODViOTZiOTQtOTc4ZC00ZjUxLWEzMjItY2ExMmNlNDliNjE4XkEyXkFqcGc@._V1_.jpg',
  2024,
  array['superhero', 'action', 'thriller']::text[],
  'trending',
  4.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  116,
  'S.J. Clarkson',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Madame Web');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America (1944)',
  'Superhero Captain America battles the evil forces of the archvillain called The Scarab, who poisons his enemies and steals a secret device capable of destroying buildings by sound vibrations.',
  'https://m.media-amazon.com/images/M/MV5BNTQzYTE1OGMtNmExYy00M2YzLWJjNWUtODY4MTI2OTMxNzVkXkEyXkFqcGc@._V1_.jpg',
  1944,
  array['superhero', 'action', 'adventure', 'sci-fi', 'thriller']::text[],
  'trending',
  5.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  244,
  'Elmer Clifton, John English',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America (1944)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Marvel One-Shot: A Funny Thing Happened on the Way to Thor''s Hammer',
  'Agent Coulson stops at a convenience store and deals with a coincidental robbery during his visit.',
  'https://m.media-amazon.com/images/M/MV5BNGQ4MmMxOTAtZDY5Yi00YjBmLThiMGEtYzc0MDA1YzI2NzI5XkEyXkFqcGc@._V1_.jpg',
  2011,
  array['superhero', 'tv-movie', 'action', 'adventure', 'comedy']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  4,
  'Leythum',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Marvel One-Shot: A Funny Thing Happened on the Way to Thor''s Hammer');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Marvel One-Shot: The Consultant',
  'Agents Coulson and Sitwell plan to derail General Thaddeus "Thunderbolt" Ross from interfering with S.H.I.E.L.D. affairs with a very special person.',
  'https://m.media-amazon.com/images/M/MV5BZGMxYzBkMTEtZDljYi00YjM2LTgxMTMtNjFiOWQwMTg0NjhmXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['superhero', 'tv-movie', 'comedy', 'drama', 'sci-fi', 'action']::text[],
  'trending',
  6.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  4,
  'Leythum',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Marvel One-Shot: The Consultant');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Marvel One-Shot: Item 47',
  'S.H.I.E.L.D. agent Sitwell is assigned to recover an abandoned Chitauri weapon being used by a young couple robbing a bank.',
  'https://m.media-amazon.com/images/M/MV5BMTI2NDI2MzgtNTMzNi00MmEyLWE0ZDYtZmQ2NjJjMjUyYzMzXkEyXkFqcGc@._V1_.jpg',
  2012,
  array['superhero', 'tv-movie', 'action', 'adventure', 'crime', 'drama', 'sci-fi']::text[],
  'trending',
  6.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  12,
  'Louis D''Esposito',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Marvel One-Shot: Item 47');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Marvel One-Shot: Agent Carter',
  'Agent Carter seeks the enigmatic "Zodiac" and also battles her misogynistic, bureaucratic boss. Frustrated at being marginalized at work, Peggy Carter goes on an unauthorized solo field mission.',
  'https://m.media-amazon.com/images/M/MV5BNzVmNmUyZTctM2VlNy00M2QzLWIwZmUtMTcxYjRhYjYzMGYxXkEyXkFqcGc@._V1_.jpg',
  2013,
  array['superhero', 'tv-movie', 'action', 'adventure', 'comedy', 'drama', 'sci-fi', 'thriller']::text[],
  'trending',
  7.4::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  15,
  'Louis D''Esposito',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Marvel One-Shot: Agent Carter');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Marvel One-Shot: All Hail the King',
  'A documentary filmmaker interviews the now-famous Trevor Slattery from behind bars.',
  'https://m.media-amazon.com/images/M/MV5BNDBiYzBhMTktMTM1Mi00NGE1LTg3NTUtZTNhYzNmYmJkOGJkXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['superhero', 'tv-movie', 'comedy', 'drama', 'thriller', 'action']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  14,
  'Drew Pearce',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Marvel One-Shot: All Hail the King');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Team Thor',
  'The story of what the hammer-wielding Nordic god Thor was up to while the rest of the Avengers were battling each other in "Captain America: Civil War". He moves into a flat with office worker Darryl Jacobson in Australia.',
  'https://m.media-amazon.com/images/M/MV5BNDZiNWVjZDMtOTNkOS00NzdiLTljMTEtOGM0NWExNGJjZjYzXkEyXkFqcGc@._V1_.jpg',
  2016,
  array['superhero', 'tv-movie', 'comedy', 'fantasy', 'sci-fi', 'action']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  4,
  'Taika Waititi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Team Thor');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Team Thor: Part 2',
  'Thor enjoys some time away from battle.',
  'https://m.media-amazon.com/images/M/MV5BZDVlZDNjNGUtOWI0ZS00YmJhLTg1YzEtOTE5MTk3YWJmYmRiXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['superhero', 'tv-movie', 'comedy', 'sci-fi', 'action']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  5,
  'Taika Waititi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Team Thor: Part 2');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America: Brave New World',
  'Sam Wilson, the new Captain America, finds himself in the middle of an international incident and must discover the motive behind a nefarious global plan.',
  'https://m.media-amazon.com/images/M/MV5BNDRjY2E0ZmEtN2QwNi00NTEwLWI3MWItODNkMGYwYWFjNGE0XkEyXkFqcGc@._V1_.jpg',
  2025,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  5.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  118,
  'Julius Onah',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Captain America: Brave New World');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thunderbolts*',
  'After finding themselves ensnared in a death trap, an unconventional team of antiheroes must go on a dangerous mission that will force them to confront the darkest corners of their pasts.',
  'https://m.media-amazon.com/images/M/MV5BNDIzNGUwZmYtODM0Yy00NjA3LTgxOGUtOTY0ZGM5MjBkM2I3XkEyXkFqcGc@._V1_.jpg',
  2025,
  array['superhero', 'action', 'adventure', 'crime', 'drama', 'fantasy', 'sci-fi']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  127,
  'Jake Schreier',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Thunderbolts*');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Avengers: Doomsday',
  'Plot under wraps.',
  'https://m.media-amazon.com/images/M/MV5BM2E1ZTJiZTgtZGI2Zi00MzAxLThhZjktMmU3M2E3Yzk3NjUxXkEyXkFqcGc@._V1_.jpg',
  2026,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  null::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  null,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Avengers: Doomsday');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Avengers: Secret Wars',
  'Plot Under Wraps',
  'https://m.media-amazon.com/images/M/MV5BYTQyZTQ5MWQtN2M4NC00YWQwLTg3ZTctM2JiZDE4NDBkZDJkXkEyXkFqcGc@._V1_.jpg',
  2027,
  array['superhero', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  null::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  null,
  'Anthony Russo, Joe Russo',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Avengers: Secret Wars');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Werewolf by Night',
  'Follows a lycanthrope superhero who fights evil using the abilities given to him by a curse brought on by his bloodline.',
  'https://m.media-amazon.com/images/M/MV5BODUzMGFkYzgtYzhjNC00ZmFjLTg3ZTYtYWJkMWRjMzJmYTQ2XkEyXkFqcGc@._V1_.jpg',
  2022,
  array['superhero', 'action', 'drama', 'fantasy', 'horror', 'mystery', 'thriller']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  52,
  'Michael Giacchino',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Werewolf by Night');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man (1978)',
  'Spider-Man teams up with an agent from Interpol to battle against the evil forces of the Iron Cross Army.',
  'https://m.media-amazon.com/images/M/MV5BNzZmNzdjMDMtNDVkMC00OWUwLTg5MTMtNTdkYzBkNjhmMDViXkEyXkFqcGc@._V1_.jpg',
  1978,
  array['superhero', 'tv-movie', 'action', 'sci-fi']::text[],
  'trending',
  6.3::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  24,
  'Kôichi Takemoto',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man (1978)');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Deadpool: No Good Deed',
  'Deadpool sees an opportunity to save the day, but it doesn''t go entirely as planned.',
  'https://m.media-amazon.com/images/M/MV5BM2IzODI5YTQtNTQ0NS00Y2U5LTk4ZWMtOTI0ZDI4OWUxZjdhXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['superhero', 'tv-movie', 'comedy', 'crime', 'action']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  4,
  'David Leitch',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Deadpool: No Good Deed');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Team Darryl',
  'With Thor gone, Darryl searches for a new roommate, but only the Grandmaster responds to his ad.',
  'https://m.media-amazon.com/images/M/MV5BMmI4MTgxYjEtZWNmMC00OWM2LTk3MzEtN2MzNmM1ODljODQ1XkEyXkFqcGc@._V1_.jpg',
  2018,
  array['superhero', 'tv-movie', 'comedy', 'sci-fi', 'action']::text[],
  'trending',
  6.5::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  6,
  'Taika Waititi',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Team Darryl');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Peter''s To-Do List',
  'On the eve of his departure to Europe, Peter Parker tells Ned Leeds that he has several things to do before they leave.',
  'https://m.media-amazon.com/images/M/MV5BY2MyMzFlYmMtYWEyZC00MjExLTk2ODItODEzZmQ1ZGUyNGQwXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['superhero', 'tv-movie', 'action', 'adventure', 'sci-fi']::text[],
  'trending',
  7.0::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  3,
  'Jon Watts',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Peter''s To-Do List');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Deadpool''s Maximum Reactions: Deadpool and Korg',
  'Deadpool and Korg react to the trailer for Free Guy.',
  'https://m.media-amazon.com/images/M/MV5BNmI3MDFhMGQtOGRhOS00ZGFhLWJlN2UtMjMxYjBmNThkM2NjXkEyXkFqcGc@._V1_.jpg',
  2021,
  array['superhero', 'tv-movie', 'comedy', 'action']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  5,
  '',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Deadpool''s Maximum Reactions: Deadpool and Korg');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man: Brand New Day',
  'A forgotten Peter Parker lives alone as a full-time Spider-Man until mounting pressure triggers a dangerous change and a powerful new enemy emerges.',
  'https://m.media-amazon.com/images/M/MV5BOWNjYWM3NWItOGE0ZS00MWRjLThiZWEtYjc4ZmNmMmU5ZTVmXkEyXkFqcGc@._V1_.jpg',
  2026,
  array['superhero', 'action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'trending',
  null::numeric,
  'Catalogue: IMDb list ls000024621 (Marvel Films).',
  150,
  'Destin Daniel Cretton',
  '',
  'pending',
  null::uuid
where not exists (select 1 from public.movies x where x.title = 'Spider-Man: Brand New Day');
