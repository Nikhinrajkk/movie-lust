-- Catalogue seed: IMDb TVmeter most popular TV shows (2026-06-11).
-- Source: https://www.imdb.com/chart/tvmeter/?view=detailed
-- Data: data/imdb-tvmeter-2026-06-11.json
-- Idempotent inserts (skip when title already exists). All rows approval_status = pending.

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Off Campus',
  'A college-set romantic drama chronicling the unexpected love story between a music student and the university''s star hockey player, exploring themes of love and the complexities of adulthood through deep friendships and enduring bonds.',
  'https://m.media-amazon.com/images/M/MV5BMDA0NzAzNDktYjBiOS00ZjFjLThhZTYtNzlkMDMzOTgxZTk5XkEyXkFqcGc@._V1_.jpg',
  '2026-05-13'::date,
  null,
  2026,
  null,
  array['drama', 'romance', 'sports']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Louisa Levy',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Off Campus');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Widow''s Bay',
  'A skeptical mayor leads the superstitious residents of a cursed New England island.',
  'https://m.media-amazon.com/images/M/MV5BZDBiMWZlMDQtNzkzMi00YzQzLTkwNTUtNzYwOGY3YmUxNDJjXkEyXkFqcGc@._V1_.jpg',
  '2026-04-29'::date,
  null,
  2026,
  null,
  array['comedy', 'drama', 'horror']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Katie Dippold',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Widow''s Bay');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Cape Fear',
  'A happily married couple faces a growing threat when a notorious killer from their past, Max Cady, is released from prison and seeks revenge.',
  'https://m.media-amazon.com/images/M/MV5BYmZkOTkxNjAtZDY2MS00NTM3LTgwYWItMmNhMzFjMTBlOGI5XkEyXkFqcGc@._V1_.jpg',
  '2026-06-05'::date,
  null,
  2026,
  null,
  array['crime', 'drama', 'thriller']::text[],
  'trending',
  7.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Cape Fear');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'From',
  'A town with a hidden secret experiences strange occurrences that intensify at night. Mysterious forces disrupt everyday routines as residents try to preserve stability and community while attempting to comprehend their surroundings.',
  'https://m.media-amazon.com/images/M/MV5BNDAwNDljNWEtNWE1Zi00YjFlLWEzM2UtY2E3ZTM1MTcxMTcyXkEyXkFqcGc@._V1_.jpg',
  '2022-02-20'::date,
  null,
  2022,
  null,
  array['drama', 'horror', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'John Griffin',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'From');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Spider-Noir',
  'Ben Reilly, a seasoned, down-on-his-luck private investigator in 1930s New York, is forced to grapple with his past life, following a deeply personal tragedy, as the city''s one and only superhero.',
  'https://m.media-amazon.com/images/M/MV5BYjU3NjEwNTItMzc1Mi00Y2QyLTljNDItOTQ4YjU4NjZjN2EyXkEyXkFqcGc@._V1_.jpg',
  '2026-05-25'::date,
  null,
  2026,
  null,
  array['action', 'adventure', 'crime', 'drama', 'fantasy', 'mystery']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Spider-Noir');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dutton Ranch',
  'Beth Dutton and Rip Wheeler fight to survive on their cherished 7,000-acre ranch amid tough times and stiff competition, while ensuring young Carter becomes the man he''s supposed to be.',
  'https://m.media-amazon.com/images/M/MV5BMzk0YTExY2EtYzI1NS00M2ZlLWFjOGUtMTQyMDY1MmE2ZGViXkEyXkFqcGc@._V1_.jpg',
  '2026-05-15'::date,
  null,
  2026,
  null,
  array['drama', 'western']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dutton Ranch');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Every Year After',
  'Two lifelong friends explore the enduring question: what if your first love was destined to be your soulmate? A sweeping romantic tale about love''s timeless possibilities.',
  'https://m.media-amazon.com/images/M/MV5BODJmYjdlMGEtZTVhZS00MDAyLTkxMDMtZWJmMDFhMmQ2ODgyXkEyXkFqcGc@._V1_.jpg',
  '2026-06-10'::date,
  null,
  2026,
  null,
  array['drama', 'romance']::text[],
  'trending',
  6.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Every Year After');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Boroughs',
  'In a seemingly picturesque retirement community, a group of unlikely heroes must band together to stop an otherworldly threat from stealing the one thing they don''t have - time.',
  'https://m.media-amazon.com/images/M/MV5BZjc1Mjg0YjItN2M2Zi00ZDlhLWJhZDYtYjI2NmFmOGQ1ZmMxXkEyXkFqcGc@._V1_.jpg',
  '2026-05-21'::date,
  null,
  2026,
  null,
  array['adventure', 'comedy', 'drama', 'fantasy', 'horror', 'mystery']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Boroughs');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Teach You a Lesson',
  'The collapse of teachers'' Authority, the establishment of the Teachers'' Authority Protection Bureau under the Ministry of Education, and the dispatch of supervisors to problem schools to punish students and parents who cross the line.',
  'https://m.media-amazon.com/images/M/MV5BNzFjNmFjNzgtYmM0ZS00ODZmLWJiNTktOWNiYWZiMTE5MWRiXkEyXkFqcGc@._V1_.jpg',
  '2026-06-05'::date,
  null,
  2026,
  null,
  array['action', 'drama']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Teach You a Lesson');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Boys',
  'A group of vigilantes set out to take down corrupt superheroes who abuse their superpowers.',
  'https://m.media-amazon.com/images/M/MV5BZjU4OWNiYzQtMzc1NS00NjZlLTgyYTctZWY4ZmEzMTkxYjA4XkEyXkFqcGc@._V1_.jpg',
  '2019-07-26'::date,
  null,
  2019,
  2026,
  array['action', 'comedy', 'crime', 'drama', 'sci-fi']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Eric Kripke',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Boys');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Euphoria',
  'A dark coming-of-age drama exploring love, addiction, friendship and identity in a world full of temptation and uncertainty.',
  'https://m.media-amazon.com/images/M/MV5BYzg5MTVmNjgtMGQ3Zi00YThlLWFjMzgtYzc2NGUyMzE2MWQ1XkEyXkFqcGc@._V1_.jpg',
  '2019-06-16'::date,
  null,
  2019,
  2026,
  array['drama']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Sam Levinson',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Euphoria');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Game of Thrones',
  'Noble families vie for control of Westeros and its Iron Throne, while an ancient threat beyond the Wall begins to stir.',
  'https://m.media-amazon.com/images/M/MV5BMTNhMDJmNmYtNDQ5OS00ODdlLWE0ZDAtZTgyYTIwNDY3OTU3XkEyXkFqcGc@._V1_.jpg',
  '2011-04-17'::date,
  null,
  2011,
  2019,
  array['drama', 'fantasy']::text[],
  'trending',
  9.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Game of Thrones');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'House of the Dragon',
  'An internal succession war within House Targaryen at the height of its power, 172 years before the birth of Daenerys Targaryen.',
  'https://m.media-amazon.com/images/M/MV5BZGM4MTczODQtNGIxOC00Y2U2LTk1YmItNzA2N2VhYmE0Y2YwXkEyXkFqcGc@._V1_.jpg',
  '2022-08-21'::date,
  null,
  2022,
  null,
  array['action', 'adventure', 'drama', 'fantasy']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'House of the Dragon');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Your Friends & Neighbors',
  'A hedge fund manager resorts to burglary after losing his job, targeting wealthy neighbors to maintain his family''s lifestyle.',
  'https://m.media-amazon.com/images/M/MV5BMjM0ZWFhMzEtOWVlYS00Y2VkLTk1MzEtZWQwM2E1YjFkNjlmXkEyXkFqcGc@._V1_.jpg',
  '2025-04-11'::date,
  null,
  2025,
  null,
  array['crime', 'drama']::text[],
  'trending',
  7.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Jonathan Tropper',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Your Friends & Neighbors');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Four Seasons',
  'Three suburban couples vacation together each season, but tensions arise when one couple splits up and the husband brings a much younger woman on subsequent trips.',
  'https://m.media-amazon.com/images/M/MV5BY2ZlNDBmOTctM2RhMS00NmU4LTg4NWQtZTA2ODdmMDNlZDg2XkEyXkFqcGc@._V1_.jpg',
  '2025-05-01'::date,
  null,
  2025,
  2026,
  array['comedy', 'romance']::text[],
  'trending',
  7.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Four Seasons');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Witness',
  'In 1992, Rachel Nickell was murdered on Wimbledon Common and her son, Alex, just three weeks from his third birthday, was the only witness. The drama is based on the memoir and experiences of Alex and his father, André Hanscombe.',
  'https://m.media-amazon.com/images/M/MV5BYjg4YzFlZjgtYjljZC00YjNiLWE1ZTUtNGYyODA0NzZkZDYwXkEyXkFqcGc@._V1_.jpg',
  '2026-06-04'::date,
  null,
  2026,
  2026,
  array['crime', 'drama']::text[],
  'trending',
  6.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Witness');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Pitt',
  'The daily lives of healthcare professionals in a Pittsburgh hospital as they juggle personal crises, workplace politics, and the emotional toll of treating critically ill patients, revealing the resilience required in their noble calling.',
  'https://m.media-amazon.com/images/M/MV5BMThjMjYxM2YtM2IzZC00NDdmLThiNDYtNzEyNzA0YTRmYTk3XkEyXkFqcGc@._V1_.jpg',
  '2025-01-09'::date,
  null,
  2025,
  null,
  array['drama']::text[],
  'trending',
  8.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'R. Scott Gemmill',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Pitt');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Legends',
  'Customs agents go undercover to infiltrate Britain''s most dangerous drug gangs, following a thrilling criminal investigation based on extensive research and interviews with those involved in the top-secret operation.',
  'https://m.media-amazon.com/images/M/MV5BYTI2NzI3OTgtNjJmNS00Yjk3LTliMTMtZDA1MWM4MDA0N2QzXkEyXkFqcGc@._V1_.jpg',
  '2026-05-07'::date,
  null,
  2026,
  null,
  array['crime', 'drama']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Legends');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Breaking Bad',
  'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student to secure his family''s future.',
  'https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_.jpg',
  '2008-01-20'::date,
  null,
  2008,
  2013,
  array['crime', 'drama', 'thriller']::text[],
  'trending',
  9.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Vince Gilligan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Breaking Bad');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Re: Zero - Starting Life in Another World',
  'After being suddenly transported to another world, Subaru Natsuki and his new female partner are brutally murdered. However, Subaru awakens to a familiar scene, meeting the same girl again. The day begins to mysteriously repeat itself.',
  'https://m.media-amazon.com/images/M/MV5BZWI4OTVkNDgtOTBmMC00M2I3LTk3NTctOWY3NmRkODIxMDViXkEyXkFqcGc@._V1_.jpg',
  '2016-04-03'::date,
  null,
  2016,
  null,
  array['animation', 'adventure', 'drama', 'fantasy', 'horror', 'mystery']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Re: Zero - Starting Life in Another World');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Not Suitable for Work',
  'Explores the next stage in young people''s lives after high school. Five work-obsessed twenty-somethings professionals living in Manhattan''s Murray Hill neighborhood focused on achieving career success and find time for personal happiness.',
  'https://m.media-amazon.com/images/M/MV5BMWFiMTA4M2EtZDkyNC00MDg4LTg5OWUtNDkxMGM2M2ZmMDQ1XkEyXkFqcGc@._V1_.jpg',
  '2026-06-02'::date,
  null,
  2026,
  null,
  array['comedy']::text[],
  'trending',
  6.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Not Suitable for Work');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Tip Toe',
  'Neighbors Leo, a Canal Street bar owner, and Clive, an electrician with two sons, find their lives unraveling as social tensions rise. Simple disagreements escalate into dangerous hostility in their Manchester suburb.',
  'https://m.media-amazon.com/images/M/MV5BMGVmMWZjNzItY2RmNi00Yjc3LThiOWQtMzYzMmY1MDgxMjgyXkEyXkFqcGc@._V1_.jpg',
  '2026-05-31'::date,
  null,
  2026,
  null,
  array['drama']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Tip Toe');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Rivals',
  'Follows Rupert Campbell-Black and Tony Baddingham as they have a longstanding rivalry that comes to a head.',
  'https://m.media-amazon.com/images/M/MV5BZTc1NTcwNWEtN2NiZC00NGM3LTliNWEtZjY2YWZiOGUzNGRhXkEyXkFqcGc@._V1_.jpg',
  '2024-10-18'::date,
  null,
  2024,
  null,
  array['drama']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Rivals');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Rick and Morty',
  'The fractured domestic lives of a nihilistic mad scientist and his anxious grandson are further complicated by their inter-dimensional misadventures.',
  'https://m.media-amazon.com/images/M/MV5BZGQyZjk2MzMtMTcyNC00NGU3LTlmNjItNDExMWM4ZDFhYmQ2XkEyXkFqcGc@._V1_.jpg',
  '2013-12-02'::date,
  null,
  2013,
  null,
  array['animation', 'adventure', 'comedy', 'sci-fi']::text[],
  'trending',
  9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Rick and Morty');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Yellowstone',
  'A ranching family in Montana faces off against others encroaching on their land.',
  'https://m.media-amazon.com/images/M/MV5BZTYxYTdjZjEtNTc0My00NDU2LTkwZmQtNjhhNmJiMzQ3Zjc1XkEyXkFqcGc@._V1_.jpg',
  '2018-06-20'::date,
  null,
  2018,
  2024,
  array['drama', 'western']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Yellowstone');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Among Us',
  'Eccentric, monochromatic crewmates of a ship transporting junk across the galaxy must root out an impostor in their midst before they fall victim to its villainous designs.',
  'https://m.media-amazon.com/images/M/MV5BNTdhZjMyOGItZTVlZS00NTEzLTlkYmYtMDM2MDgwNTYwZDNiXkEyXkFqcGc@._V1_.jpg',
  '2026-06-05'::date,
  null,
  2026,
  null,
  array['animation', 'adventure', 'comedy', 'horror', 'mystery', 'sci-fi']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Owen Dennis',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Among Us');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Alice and Steve',
  'The 25-year-long friendship between Alice and Steve becomes strained when Steve starts dating Alice''s daughter.',
  'https://m.media-amazon.com/images/M/MV5BYTgwODM2ZmMtYWQ1YS00NDQ2LWJlNWYtY2U3OWM0N2VjNzhiXkEyXkFqcGc@._V1_.jpg',
  '2026-06-08'::date,
  null,
  2026,
  null,
  array['comedy', 'drama', 'romance']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Alice and Steve');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Supernatural',
  'Two brothers follow their father''s footsteps as hunters, fighting evil supernatural beings of many kinds, including monsters, demons, and gods that roam the earth.',
  'https://m.media-amazon.com/images/M/MV5BMDFmMGZmMGItNGRjNC00NjVjLWI5ODEtNzhjMTE5MmJhN2FkXkEyXkFqcGc@._V1_.jpg',
  '2005-09-13'::date,
  null,
  2005,
  2020,
  array['drama', 'fantasy', 'horror', 'mystery', 'thriller']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Eric Kripke',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Supernatural');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Rookie',
  'Starting over isn''t easy, especially for John Nolan who, after a life-altering incident, is pursuing his dream of joining the LAPD. As their oldest rookie, he''s met with skepticism from those who see him as just a walking midlife crisis.',
  'https://m.media-amazon.com/images/M/MV5BMzc2MDdkZDUtZjZlYy00MGMyLWJkNzUtMTMxY2FkZjZjYmEyXkEyXkFqcGc@._V1_.jpg',
  '2018-10-16'::date,
  null,
  2018,
  null,
  array['action', 'crime', 'drama']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Alexi Hawley',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Rookie');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Criminal Minds',
  'The FBI''s Behavioral Analysis Unit in Quantico helps police solve violent serial crimes using profiling. Team members analyze evidence and psychology to catch unknown subjects, but their demanding work affects personal lives.',
  'https://m.media-amazon.com/images/M/MV5BZmEyNTAyZDEtMTlhNS00ZTJjLWI1OWEtNWMzNzFhMWNjMDY2XkEyXkFqcGc@._V1_.jpg',
  '2005-09-22'::date,
  null,
  2005,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Jeff Davis',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Criminal Minds');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Ted Lasso',
  'American college football coach Ted Lasso is hired to manage AFC Richmond, a struggling English soccer club, and must win over skeptical players, staff, and fans.',
  'https://m.media-amazon.com/images/M/MV5BZmI3YWVhM2UtNDZjMC00YTIzLWI2NGUtZWIxODZkZjVmYTg1XkEyXkFqcGc@._V1_.jpg',
  '2020-08-14'::date,
  null,
  2020,
  null,
  array['comedy', 'drama', 'sports']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Ted Lasso');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Interview with the Vampire',
  'A vampire tells his epic story of love, blood, and the perils of immortality to a journalist.',
  'https://m.media-amazon.com/images/M/MV5BYmE0MjUzY2YtYTU3Yi00ZGUzLWE3MmQtM2M2Y2QyYWZmYjkwXkEyXkFqcGc@._V1_.jpg',
  '2022-10-02'::date,
  null,
  2022,
  null,
  array['drama', 'fantasy', 'horror', 'romance']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Rolin Jones',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Interview with the Vampire');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Lucky',
  'A reformed criminal is forced to confront her past and return to illicit activities for one final job, hoping to secure her freedom and leave her former life behind for good.',
  'https://m.media-amazon.com/images/M/MV5BOGQ0MjkwOTUtMGMyYS00NzFhLTgxMjktNTAwOGViNWM2MWE1XkEyXkFqcGc@._V1_.jpg',
  '2026-07-15'::date,
  null,
  2026,
  null,
  array['crime', 'drama', 'thriller']::text[],
  'trending',
  null,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Lucky');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Raakh',
  'Two teens disappear, devastating a tight-knit family and alarming the city. A determined officer launches a nationwide search, plunging into a dark realm of brutality and human evil.',
  'https://m.media-amazon.com/images/M/MV5BZjhkMTFkM2ItNTgxOC00YjI5LTllYjUtYzc2YTBjYWM5YTdiXkEyXkFqcGc@._V1_.jpg',
  '2026-06-12'::date,
  null,
  2026,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Raakh');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Sopranos',
  'New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek professional psychiatric counseling.',
  'https://m.media-amazon.com/images/M/MV5BZjYwNWQwOTMtMzYwOS00NTcxLWFhNTYtNGQ4YjdmYTcyNDFkXkEyXkFqcGc@._V1_.jpg',
  '1999-01-10'::date,
  null,
  1999,
  2007,
  array['crime', 'drama']::text[],
  'trending',
  9.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'David Chase',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Sopranos');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Sweet Magnolias',
  'Three South Carolina women, best friends since high school, shepherd one another through the complexities of romance, career, and family.',
  'https://m.media-amazon.com/images/M/MV5BMThjZTJkYTAtZjI5Ny00NDM4LThiNGYtYjI2MDlmOGE0ZTE5XkEyXkFqcGc@._V1_.jpg',
  '2020-05-19'::date,
  null,
  2020,
  null,
  array['drama', 'romance']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Sheryl J. Anderson',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Sweet Magnolias');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Law & Order: Special Victims Unit',
  'Follows the NYPD''s specially trained squad of detectives who investigate sex crimes, including rape, paedophilia, child abuse, human trafficking and domestic violence.',
  'https://m.media-amazon.com/images/M/MV5BMTU0NGIwMGQtNzk1OC00MzcxLTk0NDYtYWYyMjA3Mzg0ZWFkXkEyXkFqcGc@._V1_.jpg',
  '1999-09-20'::date,
  null,
  1999,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Dick Wolf',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Law & Order: Special Victims Unit');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'For All Mankind',
  'In an alternative version of 1969, the Soviet Union beats the United States to the Moon, and the space race continues on for decades with still grander challenges and goals.',
  'https://m.media-amazon.com/images/M/MV5BZmI5OTNmYWQtNjRhNy00MWYxLWJjMzAtMmRlNDU1ZjBhMzhlXkEyXkFqcGc@._V1_.jpg',
  '2019-11-01'::date,
  null,
  2019,
  2027,
  array['drama', 'sci-fi']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'For All Mankind');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Attack on Titan',
  'In a world where humanity shelters behind towering walls from man-eating Titans, a determined teen joins the elite Survey Corps to fight the giants and uncover the secrets of their origin.',
  'https://m.media-amazon.com/images/M/MV5BZjliODY5MzQtMmViZC00MTZmLWFhMWMtMjMwM2I3OGY1MTRiXkEyXkFqcGc@._V1_.jpg',
  '2013-09-28'::date,
  null,
  2013,
  2023,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'horror']::text[],
  'trending',
  9.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Attack on Titan');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Amazing Digital Circus',
  'A woman finds herself trapped in a virtual circus where she and five others are subject to the whims of a wacky artificial intelligence. In this digital purgatory they must face frightening N.P.C.s and cope with their own personal traumas.',
  'https://m.media-amazon.com/images/M/MV5BMTlkY2NjODgtOWI5ZC00MjIzLWFiYjItN2ZiOTU5YzA2ODlmXkEyXkFqcGc@._V1_.jpg',
  '2023-10-13'::date,
  null,
  2023,
  2026,
  array['animation', 'adventure', 'comedy', 'drama', 'fantasy', 'horror']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Gooseworx',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Amazing Digital Circus');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Mentalist',
  'Famous "psychic", Patrick Jane, outs himself as a fake, and using his heightened observational skills and impeccable knowledge of the human psyche, he works with the police so he can find "Red John", the madman who killed his family.',
  'https://m.media-amazon.com/images/M/MV5BMTQ5OTgzOTczM15BMl5BanBnXkFtZTcwMDM2OTY4MQ@@._V1_.jpg',
  '2008-09-23'::date,
  null,
  2008,
  2015,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Bruno Heller',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Mentalist');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Stranger Things',
  'In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.',
  'https://m.media-amazon.com/images/M/MV5BNjRiMTA4NWUtNmE0ZC00NGM0LWJhMDUtZWIzMDM5ZDIzNTg3XkEyXkFqcGc@._V1_.jpg',
  '2016-07-15'::date,
  null,
  2016,
  2025,
  array['drama', 'fantasy', 'horror', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Stranger Things');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Maximum Pleasure Guaranteed',
  'A divorced mom gets caught up in a perilous web of blackmail, murder, and youth soccer.',
  'https://m.media-amazon.com/images/M/MV5BZDA5NjZkM2MtYTFlMC00MGRhLWIwMGMtNTgyYzllYzUyNDY1XkEyXkFqcGc@._V1_.jpg',
  '2026-05-20'::date,
  null,
  2026,
  null,
  array['comedy', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'David Rosen',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Maximum Pleasure Guaranteed');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'ER',
  'The doctors who work in the ER at the County General Hospital in Chicago grapple with ups and downs in their personal and professional lives while trying to give apt medical care to their patients.',
  'https://m.media-amazon.com/images/M/MV5BMzM5NjQ4M2QtNWQyMy00OWUxLWIyZjktNmY2ZjMyZjA2NWE0XkEyXkFqcGc@._V1_.jpg',
  '1994-09-19'::date,
  null,
  1994,
  2009,
  array['drama', 'romance']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Michael Crichton',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'ER');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Bear',
  'A young chef from the fine dining world returns to Chicago to run his family''s sandwich shop.',
  'https://m.media-amazon.com/images/M/MV5BMjk2NWI5OTctODcwYy00NGRmLWFmN2YtOTZiNzFiYjVlODBkXkEyXkFqcGc@._V1_.jpg',
  '2022-06-23'::date,
  null,
  2022,
  2026,
  array['comedy', 'drama']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Christopher Storer',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Bear');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Hacks',
  'Explores a dark mentorship that forms between Deborah Vance, a legendary Las Vegas comedian, and an entitled, outcast 25-year-old.',
  'https://m.media-amazon.com/images/M/MV5BMjE0MmM5YzktNGY0NS00ZmQ0LWI1YjEtZjY2NDA4ZmZiNGQ2XkEyXkFqcGc@._V1_.jpg',
  '2021-05-13'::date,
  null,
  2021,
  2026,
  array['comedy', 'drama']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Hacks');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Person of Interest',
  'An off-the-grid and presumed-dead former CIA agent, John Reese, is hired by a mysterious tech billionaire software genius, Harold Finch, to prevent violent crimes before they happen in New York City via an advanced surveillance software.',
  'https://m.media-amazon.com/images/M/MV5BOTcxNDJiMTUtN2ZhZS00OGE1LWJmZmYtN2VhYThiZTBhYWM1XkEyXkFqcGc@._V1_.jpg',
  '2011-09-22'::date,
  null,
  2011,
  2016,
  array['action', 'crime', 'drama', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Jonathan Nolan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Person of Interest');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Walking Dead',
  'Sheriff Deputy Rick Grimes wakes up from a coma to learn the world is in ruins and must lead a group of survivors to stay alive.',
  'https://m.media-amazon.com/images/M/MV5BYWQwMGRhNGEtZTNhMy00MzVjLWJhMjItYjcwMDljMTkyNTg2XkEyXkFqcGc@._V1_.jpg',
  '2010-10-31'::date,
  null,
  2010,
  2022,
  array['drama', 'horror', 'thriller']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Frank Darabont',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Walking Dead');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Polygamist',
  'Follow Jonasi Gomora, a self-made CEO and banker, whose carefully curated empire begins to unravel as his wife, secret second wife, mistress, and girlfriend fight for his life and wealth',
  'https://m.media-amazon.com/images/M/MV5BMjVjYjJmZDktMzY4MS00MjdiLThkNjQtNzAwNDFjOGU0YTg1XkEyXkFqcGc@._V1_.jpg',
  '2026-06-12'::date,
  null,
  2026,
  null,
  array['drama']::text[],
  'trending',
  5.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Polygamist');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Star City',
  'Soviet cosmonauts, engineers, and intelligence officers risk everything in an ambitious space program aiming to be the first to reach the moon.',
  'https://m.media-amazon.com/images/M/MV5BYTA0ZmE5ODQtNDYyZS00NTIzLWEzZTEtZDAwYjEzZmJkYjI2XkEyXkFqcGc@._V1_.jpg',
  '2026-05-29'::date,
  null,
  2026,
  null,
  array['drama', 'sci-fi']::text[],
  'trending',
  6.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Ronald D. Moore',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Star City');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Better Call Saul',
  'Albuquerque lawyer Jimmy McGill scrapes for clients and respect, but every win drags him closer to shady deals, dangerous players, and the alter ego Saul Goodman.',
  'https://m.media-amazon.com/images/M/MV5BNDdjNTEzMjMtYjM3Mi00NzQ3LWFlNWMtZjdmYWU3ZDkzMjk1XkEyXkFqcGc@._V1_.jpg',
  '2015-02-08'::date,
  null,
  2015,
  2022,
  array['crime', 'drama']::text[],
  'trending',
  9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Better Call Saul');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Silo',
  'Men and women live in a giant silo underground with several regulations which they believe are in place to protect them from the toxic and ruined world on the surface.',
  'https://m.media-amazon.com/images/M/MV5BN2E5ODJmOTUtYTk0NS00NmFiLTk0MTgtZDRlNzE1YmExMjk4XkEyXkFqcGc@._V1_.jpg',
  '2023-05-05'::date,
  null,
  2023,
  null,
  array['drama', 'mystery', 'sci-fi']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Graham Yost',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Silo');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Invincible',
  'When 17-year-old Mark Grayson inherits superpowers, he becomes the superhero Invincible.',
  'https://m.media-amazon.com/images/M/MV5BZGM5MmM2ZDAtMzBjNS00NjMxLWE4ZTMtNzFjMWMxYzU2ZThjXkEyXkFqcGc@._V1_.jpg',
  '2021-03-26'::date,
  null,
  2021,
  null,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'sci-fi']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Invincible');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Office',
  'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance.',
  'https://m.media-amazon.com/images/M/MV5BZjQwYzBlYzUtZjhhOS00ZDQ0LWE0NzAtYTk4MjgzZTNkZWEzXkEyXkFqcGc@._V1_.jpg',
  '2005-03-24'::date,
  null,
  2005,
  2013,
  array['comedy']::text[],
  'trending',
  9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Greg Daniels',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Office');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Marshals',
  'Ex-Navy SEAL Kayce Dutton leaves the Yellowstone ranch to work with an elite U.S. Marshals team.',
  'https://m.media-amazon.com/images/M/MV5BOTk4NThjNzgtMjVjNi00MjdjLWE1NDctMzRhNTI1Y2RiN2NkXkEyXkFqcGc@._V1_.jpg',
  '2026-03-01'::date,
  null,
  2026,
  null,
  array['action', 'crime', 'drama', 'western']::text[],
  'trending',
  6.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Marshals');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Half Man',
  'Ruben turns up at his estranged brother Niall''s wedding, acting as a catalyst for a revival of the last 40 years of their relationship.',
  'https://m.media-amazon.com/images/M/MV5BMmM3ZDgwNmItYTc4Mi00MTk4LWEwMWMtNjliZGQ4NTlkZGMzXkEyXkFqcGc@._V1_.jpg',
  '2026-04-23'::date,
  null,
  2026,
  2026,
  array['drama']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Half Man');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Legend of Vox Machina',
  'After saving the realm from evil and destruction at the hands of the most terrifying power couple in Exandria, Vox Machina is faced with saving the world once again-this time, from a sinister group of dragons known as the Chroma Conclave.',
  'https://m.media-amazon.com/images/M/MV5BMjI0ZjE2NDgtM2IxMy00NTk3LWFhMTEtMWNhOWJiYjIzYzY2XkEyXkFqcGc@._V1_.jpg',
  '2022-01-28'::date,
  null,
  2022,
  null,
  array['animation', 'action', 'adventure', 'comedy', 'fantasy']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Legend of Vox Machina');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Handmaid''s Tale',
  'Set in a dystopian future, a woman is forced to live as a concubine under a fundamentalist theocratic dictatorship.',
  'https://m.media-amazon.com/images/M/MV5BMWIxMzk4NmItZmM1YS00ODUyLWFlNjgtZDQ4MzljZTZmZDQ5XkEyXkFqcGc@._V1_.jpg',
  '2017-04-26'::date,
  null,
  2017,
  2025,
  array['drama', 'sci-fi', 'thriller']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Bruce Miller',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Handmaid''s Tale');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Clarkson''s Farm',
  'Follow Jeremy Clarkson as he attempts to run a farm in the countryside.',
  'https://m.media-amazon.com/images/M/MV5BNzA1Yzk0NzEtMmQwNi00ZmQyLWFmYTUtM2NjYjBkMGE3NDRkXkEyXkFqcGc@._V1_.jpg',
  '2021-06-10'::date,
  null,
  2021,
  null,
  array['documentary', 'comedy']::text[],
  'trending',
  9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Clarkson''s Farm');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Testaments',
  'This sequel to "The Handmaid''s Tale" follows Agnes and Daisy, two teens in Gilead who must navigate an elite preparatory school where obedience is brutally enforced. Their bond becomes the catalyst that will transform their lives.',
  'https://m.media-amazon.com/images/M/MV5BMjZhODhiYmEtNTg0ZS00Mjc0LTk0NTYtMGEwMGFlNjFkZGM0XkEyXkFqcGc@._V1_.jpg',
  '2026-04-08'::date,
  null,
  2026,
  null,
  array['drama', 'thriller']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Bruce Miller',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Testaments');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Made in India: A Titan Story',
  'A visionary man Xerxes Desai with his team turns humiliation into history by building India''s first world-class watch brand, proving that time itself can be reclaimed through courage, failure, and innovation.',
  'https://m.media-amazon.com/images/M/MV5BMGUwNjA2ZWUtMmYxNC00MTJhLThhZjctMTUwYThiYzRjNDBlXkEyXkFqcGc@._V1_.jpg',
  '2026-06-03'::date,
  null,
  2026,
  null,
  array['biography', 'drama', 'history']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Made in India: A Titan Story');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The White Lotus',
  'The exploits of various guests and employees of a luxury resort over the span of a week.',
  'https://m.media-amazon.com/images/M/MV5BZmM1MGM0MDQtZTAzNy00ZGJkLWI4MDUtNjBmMzdhYjhlM2QwXkEyXkFqcGc@._V1_.jpg',
  '2021-07-11'::date,
  null,
  2021,
  null,
  array['comedy', 'drama', 'mystery']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Mike White',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The White Lotus');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'A Good Girl''s Guide to Murder',
  'With cold case murders and new mysteries looming over her sleepy English town, an average teen becomes an amateur sleuth determined to uncover the truth.',
  'https://m.media-amazon.com/images/M/MV5BYTEzODM2NzYtMzU5NC00OWFlLWFkZTktNzEzODVjOTI3YWJkXkEyXkFqcGc@._V1_.jpg',
  '2024-08-01'::date,
  null,
  2024,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  6.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Poppy Cogan',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'A Good Girl''s Guide to Murder');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Landman',
  'A modern-day tale of fortune seeking in the world of West Texas oil rigs.',
  'https://m.media-amazon.com/images/M/MV5BNTQ1MzI1ZWYtNWMxMC00NmU4LTlmMjItZjY1NWMyYTdjMjM4XkEyXkFqcGc@._V1_.jpg',
  '2024-11-17'::date,
  null,
  2024,
  null,
  array['crime', 'drama', 'western']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Landman');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Margo''s Got Money Troubles',
  'A young mother struggles to make ends meet. When her estranged father offers help, she starts an OnlyFans account using his advice from pro wrestling. Though successful, she wonders if Internet fame comes at too high a cost.',
  'https://m.media-amazon.com/images/M/MV5BOTI2NDRhZWUtZDQwOC00OTk1LTk3Y2QtNmFlZjczOTMyZjM5XkEyXkFqcGc@._V1_.jpg',
  '2026-04-15'::date,
  null,
  2026,
  2026,
  array['comedy', 'drama']::text[],
  'trending',
  7.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'David E. Kelley',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Margo''s Got Money Troubles');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Beef',
  'Minor conflicts spiral into consuming feuds between individuals, exposing pride, resentment, and hidden pain.',
  'https://m.media-amazon.com/images/M/MV5BMGNlNDkyYzItNTg5Yy00NGFiLWJhYTctODE5NjNkYjk4ZDUwXkEyXkFqcGc@._V1_.jpg',
  '2023-04-06'::date,
  null,
  2023,
  null,
  array['comedy', 'drama']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Lee Sung Jin',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Beef');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Wire',
  'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.',
  'https://m.media-amazon.com/images/M/MV5BYjIxZTMwZmUtOTUzYS00YmU2LWJhNDAtNzA2NDg0NDA0MjVkXkEyXkFqcGc@._V1_.jpg',
  '2002-06-02'::date,
  null,
  2002,
  2008,
  array['crime', 'drama', 'thriller']::text[],
  'trending',
  9.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'David Simon',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Wire');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Severance',
  'Mark leads a team of office workers whose memories have been surgically divided between their work and personal lives. When a mysterious colleague appears outside of work, it begins a journey to discover the truth about their jobs.',
  'https://m.media-amazon.com/images/M/MV5BZDI5YzJhODQtMzQyNy00YWNmLWIxMjUtNDBjNjA5YWRjMzExXkEyXkFqcGc@._V1_.jpg',
  '2022-02-18'::date,
  null,
  2022,
  null,
  array['drama', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Dan Erickson',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Severance');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'A Knight of the Seven Kingdoms',
  'A century before the events of "Game of Thrones", Ser Duncan the Tall, and his squire, Egg, wander through Westeros while the Targaryen dynasty rule the Iron Throne. Great destinies and enemies await the incomparable friends.',
  'https://m.media-amazon.com/images/M/MV5BYzg4M2U3YWMtMWY4MS00MzFkLTk2ZWQtOThiOGYxZDEyMGQ2XkEyXkFqcGc@._V1_.jpg',
  '2026-01-18'::date,
  null,
  2026,
  null,
  array['adventure', 'drama', 'fantasy']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'A Knight of the Seven Kingdoms');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Madison',
  'A New York family''s life unravels after a tragedy; they process their grief while vacationing in rural Montana, where they explore human connection amid their profound sorrow.',
  'https://m.media-amazon.com/images/M/MV5BZGFiODdjY2UtNzAxZC00Mjc3LWJiZTQtYzQ2ZTM3ZWMzNjk0XkEyXkFqcGc@._V1_.jpg',
  '2026-03-14'::date,
  null,
  2026,
  null,
  array['drama']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Madison');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Shrinking',
  'A grieving therapist starts to tell his clients exactly what he thinks. Ignoring his training and ethics, he finds himself making huge changes to people''s lives - including his own.',
  'https://m.media-amazon.com/images/M/MV5BYmU3Yjg0Y2UtN2E5Yy00NzYyLThlNzQtOTI2YWE2OWJhYTUyXkEyXkFqcGc@._V1_.jpg',
  '2023-01-27'::date,
  null,
  2023,
  null,
  array['comedy', 'drama']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Shrinking');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Paradise',
  'A Secret Service agent investigates the murder of a former president in a seemingly peaceful community.',
  'https://m.media-amazon.com/images/M/MV5BYTNmMjEwZGYtZWJjNy00MjI2LWI3YmUtNTY3NjVkMmU4MDM0XkEyXkFqcGc@._V1_.jpg',
  '2025-01-26'::date,
  null,
  2025,
  null,
  array['action', 'drama', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  7.9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Dan Fogelman',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Paradise');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Grey''s Anatomy',
  'A drama centered on the personal and professional lives of five surgical interns and their supervisors.',
  'https://m.media-amazon.com/images/M/MV5BYTVjNWVhYTctMGJkMS00NWFjLWE2N2QtNmQ1Y2FhZDFkNzUwXkEyXkFqcGc@._V1_.jpg',
  '2005-03-27'::date,
  null,
  2005,
  null,
  array['drama', 'romance']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Shonda Rhimes',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Grey''s Anatomy');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Love Island USA',
  'U.S. version of the British show ''Love Island'' where a group of singles come to stay in a villa for a few weeks and have to couple up with one another.',
  'https://m.media-amazon.com/images/M/MV5BZTE0ODRhMDctZWE5NC00ZTk5LThlNmQtYmY3MTZjMjhhNDA3XkEyXkFqcGc@._V1_.jpg',
  '2019-07-09'::date,
  null,
  2019,
  null,
  array['romance']::text[],
  'trending',
  5.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Love Island USA');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'One Piece',
  'Monkey D. Luffy, a pirate with rubber powers, forms the Straw Hat crew and sails the Grand Line, battling rivals and the World Government on a quest for the legendary treasure One Piece and the title of Pirate King.',
  'https://m.media-amazon.com/images/M/MV5BMTNjNGU4NTUtYmVjMy00YjRiLTkxMWUtNzZkMDNiYjZhNmViXkEyXkFqcGc@._V1_.jpg',
  '1999-10-20'::date,
  null,
  1999,
  null,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'trending',
  9::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Eiichirô Oda',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'One Piece');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'True Detective',
  'Anthology series in which police investigations unearth the personal and professional secrets of those involved, both within and outside the law.',
  'https://m.media-amazon.com/images/M/MV5BYjgwYzA1NWMtNDYyZi00ZGQyLWI5NTktMDYwZjE2OTIwZWEwXkEyXkFqcGc@._V1_.jpg',
  '2014-01-12'::date,
  null,
  2014,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  8.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'True Detective');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Terror',
  'Supernatural, semihistorical horror anthology series, where each season is inspired by a different infamous or mysterious real-life historical tragedy.',
  'https://m.media-amazon.com/images/M/MV5BNWQxY2Q1NGItZTM5MS00M2EzLTg2MjgtNDQ5ZDBmMWY3ZWY2XkEyXkFqcGc@._V1_.jpg',
  '2018-03-25'::date,
  null,
  2018,
  null,
  array['adventure', 'drama', 'horror', 'thriller']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Terror');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Resident Alien',
  'A crash-landed alien takes on the identity of a small-town Colorado doctor and slowly begins to wrestle with the moral dilemma of his secret mission on Earth.',
  'https://m.media-amazon.com/images/M/MV5BYzczMDI5NzQtODdmYS00NTcwLTg1MTYtNmU5NWY1NDA5ZGRkXkEyXkFqcGc@._V1_.jpg',
  '2021-01-27'::date,
  null,
  2021,
  2025,
  array['comedy', 'drama', 'mystery', 'sci-fi']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Chris Sheridan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Resident Alien');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Backrooms',
  'An analog horror series revolving around a mysterious alternate dimension known as the Backrooms.',
  'https://m.media-amazon.com/images/M/MV5BOWY0ZmIzZDQtZDM5Yi00ZjE0LWJhMzItNDM2OTAxOWNhZDkyXkEyXkFqcGc@._V1_.jpg',
  '2022-01-07'::date,
  null,
  2022,
  null,
  array['horror', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.2::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Kane Parsons',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Backrooms');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Little House on the Prairie',
  'The Ingalls family lives and works on a farm in Midwestern America during the late 19th century.',
  'https://m.media-amazon.com/images/M/MV5BODQyNzI4Y2EtODE4ZC00MjFjLTg1ZjMtYzJkNDYwZjUxZjQ1XkEyXkFqcGc@._V1_.jpg',
  '2026-07-09'::date,
  null,
  2026,
  null,
  array['drama', 'family', 'romance', 'western']::text[],
  'trending',
  null,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Rebecca Sonnenshine',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Little House on the Prairie');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Big Bang Theory',
  'The lives of four socially awkward scientists take a wild turn when a beautiful and free-spirited girl moves in next door.',
  'https://m.media-amazon.com/images/M/MV5BZjgzY2QyNzItNDhhYi00ZWIwLWFjN2UtZDJkN2MxYWNjMmJjXkEyXkFqcGc@._V1_.jpg',
  '2007-09-24'::date,
  null,
  2007,
  2019,
  array['comedy', 'romance']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Big Bang Theory');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'NCIS',
  'Naval Criminal Investigative Service agents investigate criminal cases connected to Navy and Marine Corps personnel.',
  'https://m.media-amazon.com/images/M/MV5BZGExNmI3NDMtMjYxYS00Y2ZmLTlkNmItMGNkNTQ1MzA1ZGM1XkEyXkFqcGc@._V1_.jpg',
  '2003-09-23'::date,
  null,
  2003,
  null,
  array['action', 'crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  7.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'NCIS');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Friends',
  'The personal and professional lives of six friends living in the Manhattan borough of New York City.',
  'https://m.media-amazon.com/images/M/MV5BOTU2YmM5ZjctOGVlMC00YTczLTljM2MtYjhlNGI5YWMyZjFkXkEyXkFqcGc@._V1_.jpg',
  '1994-09-22'::date,
  null,
  1994,
  2004,
  array['comedy', 'romance']::text[],
  'trending',
  8.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Friends');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Reacher',
  'Itinerant former military policeman Jack Reacher solves crimes and metes out his own brand of street justice. Based on the novels by Lee Child.',
  'https://m.media-amazon.com/images/M/MV5BMzdjYWZlMDQtYzdhNi00NmRlLTg2NzUtMTI3MWFhZDliNjBiXkEyXkFqcGc@._V1_.jpg',
  '2022-02-04'::date,
  null,
  2022,
  null,
  array['action', 'crime', 'drama', 'thriller']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Nick Santora',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Reacher');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Black Mirror',
  'Featuring stand-alone dramas -- sharp, suspenseful, satirical tales that explore techno-paranoia -- "Black Mirror" is a contemporary reworking of "The Twilight Zone" with stories that tap into the collective unease about the modern world.',
  'https://m.media-amazon.com/images/M/MV5BODcxMWI2NDMtYTc3NC00OTZjLWFmNmUtM2NmY2I1ODkxYzczXkEyXkFqcGc@._V1_.jpg',
  '2011-12-04'::date,
  null,
  2011,
  null,
  array['crime', 'drama', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Charlie Brooker',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Black Mirror');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dexter',
  'He''s smart. He''s lovable. He''s Dexter Morgan, America''s favorite serial killer, who spends his days solving crimes and his nights committing them.',
  'https://m.media-amazon.com/images/M/MV5BNTE5ZGI2N2UtYmFiMi00ZGIxLWI1ZTMtYWJkZDYxNDZiOTQwXkEyXkFqcGc@._V1_.jpg',
  '2006-10-01'::date,
  null,
  2006,
  2013,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'trending',
  8.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'James Manos Jr.',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dexter');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Daredevil: Born Again',
  'Matt Murdock finds himself on a collision course with Wilson Fisk when their past identities begin to emerge.',
  'https://m.media-amazon.com/images/M/MV5BNDBkMWRhMzEtM2M0Ny00OGZhLThkZGMtMTY1NWUwZWNhODdiXkEyXkFqcGc@._V1_.jpg',
  '2025-03-04'::date,
  null,
  2025,
  null,
  array['action', 'crime', 'drama', 'fantasy', 'sci-fi', 'thriller']::text[],
  'trending',
  8.1::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Daredevil: Born Again');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Southland',
  'The lives of police officers working for the Los Angeles Police Department.',
  'https://m.media-amazon.com/images/M/MV5BMjAwNzQ4MTMyMF5BMl5BanBnXkFtZTcwMDk3NTYyNw@@._V1_.jpg',
  '2009-04-09'::date,
  null,
  2009,
  2013,
  array['crime', 'drama', 'thriller']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Ann Biderman',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Southland');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Nemesis',
  'LA crime drama pits master thief Coltrane Wilder against detective Isaiah Stiles, challenging heist genre norms while examining what drives, sustains and destroys people.',
  'https://m.media-amazon.com/images/M/MV5BMGYzNjUyYWYtNDg2NC00NzAxLTlkMDUtMmYxZWZmZmYzYmZjXkEyXkFqcGc@._V1_.jpg',
  '2026-05-14'::date,
  null,
  2026,
  null,
  array['action', 'crime', 'drama', 'thriller']::text[],
  'trending',
  6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Nemesis');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Outlander',
  'Honeymooning in 1945 Scotland, a combat nurse is suddenly transported back to the 1700s.',
  'https://m.media-amazon.com/images/M/MV5BMTc4M2JmYmEtMjJhOC00MmRlLThhZDEtMWRhZTZiNTI0ZDZhXkEyXkFqcGc@._V1_.jpg',
  '2014-08-09'::date,
  null,
  2014,
  2026,
  array['adventure', 'drama', 'fantasy', 'romance']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Ronald D. Moore',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Outlander');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Lost',
  'The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.',
  'https://m.media-amazon.com/images/M/MV5BZmZhY2ViYzYtMTQ0NS00NDcyLWIxZTYtMGUyODE0NDA0NmNkXkEyXkFqcGc@._V1_.jpg',
  '2004-09-22'::date,
  null,
  2004,
  2010,
  array['adventure', 'drama', 'fantasy', 'mystery', 'sci-fi', 'thriller']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Lost');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Smallville',
  'A young Clark Kent struggles to find his place in the world as he learns to harness his alien powers for good and deals with the typical troubles of teenage life in Smallville, Kansas.',
  'https://m.media-amazon.com/images/M/MV5BZDU0ZDVjOTItMDNkMy00YTI0LWFjYzItY2M1NjU5NjAzZGViXkEyXkFqcGc@._V1_.jpg',
  '2001-10-16'::date,
  null,
  2001,
  2011,
  array['action', 'adventure', 'drama', 'sci-fi']::text[],
  'trending',
  7.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Smallville');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Succession',
  'The Roy family is known for controlling the biggest media and entertainment company in the world. However, their world changes when their father steps down from the company.',
  'https://m.media-amazon.com/images/M/MV5BYTY4YTVkY2QtMjRmOS00YzliLWIxOWQtMTdkOTVkN2UzODNmXkEyXkFqcGc@._V1_.jpg',
  '2018-06-03'::date,
  null,
  2018,
  2023,
  array['comedy', 'drama']::text[],
  'trending',
  8.8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Jesse Armstrong',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Succession');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Jujutsu Kaisen',
  'After Yuji Itadori swallows a cursed talisman - the finger of a demon - he becomes cursed himself. He enters a shaman''s school to be able to locate the demon''s other body parts and thus exorcise himself.',
  'https://m.media-amazon.com/images/M/MV5BMjBlNTExMDAtMWZjZi00MDc5LWFkMjgtZDU0ZWQ5ODk3YWY5XkEyXkFqcGc@._V1_.jpg',
  '2020-10-02'::date,
  null,
  2020,
  null,
  array['animation', 'action', 'adventure', 'fantasy', 'thriller']::text[],
  'trending',
  8.5::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Jujutsu Kaisen');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mad Men',
  'A drama about one of New York''s most prestigious ad agencies at the beginning of the 1960s, focusing on one of the firm''s most mysterious but extremely talented ad executives, Donald Draper.',
  'https://m.media-amazon.com/images/M/MV5BYTNjNjc5OWQtYjMxNC00MzEwLWIxM2UtNjU3NzhkNjZmNGI3XkEyXkFqcGc@._V1_.jpg',
  '2007-07-19'::date,
  null,
  2007,
  2015,
  array['drama']::text[],
  'trending',
  8.7::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Matthew Weiner',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mad Men');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Suits',
  'On the run from a drug deal gone bad, brilliant college dropout Mike Ross finds himself working with Harvey Specter, one of New York City''s best lawyers.',
  'https://m.media-amazon.com/images/M/MV5BYmE4MmNjZjUtNTEyNy00NTZiLWE4NTktYjM2NjBhYzQ1N2IzXkEyXkFqcGc@._V1_.jpg',
  '2011-06-23'::date,
  null,
  2011,
  2019,
  array['comedy', 'drama']::text[],
  'trending',
  8.4::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Aaron Korsh',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Suits');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Rooster',
  'A comedy revolving around an author''s intricate bond with his daughter, set against the backdrop of a college campus.',
  'https://m.media-amazon.com/images/M/MV5BOGEwYjMxNDctMDhlYy00YTJhLTk0YTAtOWVjOTJhYzIyZTEyXkEyXkFqcGc@._V1_.jpg',
  '2026-03-08'::date,
  null,
  2026,
  null,
  array['comedy', 'drama']::text[],
  'trending',
  7.6::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Rooster');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Band of Brothers',
  'The men of Easy Company, 506th Parachute Infantry Regiment, train for war and fight across Europe during World War II, forging bonds of brotherhood amid the brutal realities of combat.',
  'https://m.media-amazon.com/images/M/MV5BYjdlNGJlYjQtMDU2Mi00ZjA1LWEwYzgtYzlmNDM5MmE1ZGUwXkEyXkFqcGc@._V1_.jpg',
  '2001-09-09'::date,
  null,
  2001,
  2001,
  array['action', 'drama', 'history', 'war']::text[],
  'trending',
  9.4::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Band of Brothers');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Pluribus',
  'In a world overtaken by a mysterious wave of forced happiness, Carol Sturka, one of the immune few, must uncover what''s really going on - and save humanity from its artificial bliss.',
  'https://m.media-amazon.com/images/M/MV5BOWNlM2E1MDMtYmI5MS00NDQ1LWI3NTctM2VlNjQ5OTAxYTNmXkEyXkFqcGc@._V1_.jpg',
  '2025-11-07'::date,
  null,
  2025,
  null,
  array['drama', 'sci-fi']::text[],
  'trending',
  8::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  'Vince Gilligan',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Pluribus');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Slow Horses',
  'A dysfunctional team of MI5 agents navigate the espionage world''s smoke and mirrors to defend the UK from sinister forces.',
  'https://m.media-amazon.com/images/M/MV5BY2NkNTBiYWUtMGFiZS00MGI4LWE3YjMtZTU3NzhhZmEyYzlkXkEyXkFqcGc@._V1_.jpg',
  '2022-04-01'::date,
  null,
  2022,
  null,
  array['drama', 'thriller']::text[],
  'trending',
  8.3::numeric,
  'Catalogue: IMDb TVmeter chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Slow Horses');
