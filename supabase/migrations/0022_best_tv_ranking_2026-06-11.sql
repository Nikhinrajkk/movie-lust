-- Catalogue seed: best TV ranking + user requested titles (2026-06-11).
-- Source: data/best-tv-ranking-2026-06-11.json
-- Idempotent inserts (skip when title already exists). All rows approval_status = pending.

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
  'classic',
  9.3::numeric,
  'Rank #1. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Game of Thrones',
  'Noble families vie for control of Westeros and its Iron Throne, while an ancient threat beyond the Wall begins to stir.',
  'https://m.media-amazon.com/images/M/MV5BMTNhMDJmNmYtNDQ5OS00ODdlLWE0ZDAtZTgyYTIwNDY3OTU3XkEyXkFqcGc@._V1_.jpg',
  '2011-04-17'::date,
  null,
  2011,
  2019,
  array['drama', 'fantasy']::text[],
  'classic',
  8.9::numeric,
  'Rank #2. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Chernobyl',
  'In April 1986, the city of Chernobyl in the Soviet Union suffers one of the worst nuclear disasters in the history of mankind. Consequently, many heroes put their lives on the line in the following days, weeks and months.',
  'https://m.media-amazon.com/images/M/MV5BNzU0OTI4YTQtNGQ1ZS00ZjA4LTg3MTMtZjkyZWNjN2RiZDJmXkEyXkFqcGc@._V1_.jpg',
  '2019-05-06'::date,
  null,
  2019,
  2019,
  array['drama', 'history', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Rank #3. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Craig Mazin',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Chernobyl');

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
  'classic',
  8.5::numeric,
  'Rank #4. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Band of Brothers',
  'The men of Easy Company, 506th Parachute Infantry Regiment, train for war and fight across Europe during World War II, forging bonds of brotherhood amid the brutal realities of combat.',
  'https://m.media-amazon.com/images/M/MV5BYjdlNGJlYjQtMDU2Mi00ZjA1LWEwYzgtYzlmNDM5MmE1ZGUwXkEyXkFqcGc@._V1_.jpg',
  '2001-09-09'::date,
  null,
  2001,
  2001,
  array['action', 'drama', 'history', 'war']::text[],
  'classic',
  8.5::numeric,
  'Rank #5. Catalogue: best TV ranking seed (2026-06-11).',
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
  'The Wire',
  'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.',
  'https://m.media-amazon.com/images/M/MV5BYjIxZTMwZmUtOTUzYS00YmU2LWJhNDAtNzA2NDg0NDA0MjVkXkEyXkFqcGc@._V1_.jpg',
  '2002-06-02'::date,
  null,
  2002,
  2008,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Rank #6. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Better Call Saul',
  'Albuquerque lawyer Jimmy McGill scrapes for clients and respect, but every win drags him closer to shady deals, dangerous players, and the alter ego Saul Goodman.',
  'https://m.media-amazon.com/images/M/MV5BNDdjNTEzMjMtYjM3Mi00NzQ3LWFlNWMtZjdmYWU3ZDkzMjk1XkEyXkFqcGc@._V1_.jpg',
  '2015-02-08'::date,
  null,
  2015,
  2022,
  array['crime', 'drama']::text[],
  'classic',
  8.4::numeric,
  'Rank #7. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Stranger Things',
  'In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.',
  'https://m.media-amazon.com/images/M/MV5BNjRiMTA4NWUtNmE0ZC00NGM0LWJhMDUtZWIzMDM5ZDIzNTg3XkEyXkFqcGc@._V1_.jpg',
  '2016-07-15'::date,
  null,
  2016,
  2025,
  array['drama', 'fantasy', 'horror', 'mystery', 'sci-fi', 'thriller']::text[],
  'classic',
  8.4::numeric,
  'Rank #8. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Sherlock',
  'In modern-day London, brilliant but eccentric detective Sherlock Holmes teams with war veteran Dr. John Watson to crack baffling crimes, outwit formidable foes, and aid Scotland Yard with razor-sharp deduction.',
  'https://m.media-amazon.com/images/M/MV5BNTQzNGZjNDEtOTMwYi00MzFjLWE2ZTYtYzYxYzMwMjZkZDc5XkEyXkFqcGc@._V1_.jpg',
  '2010-10-24'::date,
  null,
  2010,
  2017,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.3::numeric,
  'Rank #9. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Sherlock');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Peaky Blinders',
  'A gangster family epic set in 1919 Birmingham, England; centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.',
  'https://m.media-amazon.com/images/M/MV5BOGM0NGY3ZmItOGE2ZC00OWIxLTk0N2EtZWY4Yzg3ZDlhNGI3XkEyXkFqcGc@._V1_.jpg',
  '2014-09-30'::date,
  null,
  2013,
  2022,
  array['crime', 'drama']::text[],
  'classic',
  8.2::numeric,
  'Rank #10. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Steven Knight',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Peaky Blinders');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Twilight Zone',
  'Ordinary people face uncanny and impossible events in standalone tales of science fiction, fantasy, horror, and suspense.',
  'https://m.media-amazon.com/images/M/MV5BYjkyZmRmYmMtYTg5Zi00MjA0LTliYmQtMDU0NzBiZDcxNzA0XkEyXkFqcGc@._V1_.jpg',
  '1959-10-02'::date,
  null,
  1959,
  1964,
  array['drama', 'fantasy', 'horror', 'mystery', 'sci-fi', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Rank #11. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Rod Serling',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Twilight Zone');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Fleabag',
  'Series adapted from the award-winning play about a young woman trying to cope with life in London whilst coming to terms with a recent tragedy.',
  'https://m.media-amazon.com/images/M/MV5BMjA4MzU5NzQxNV5BMl5BanBnXkFtZTgwOTg3MDA5NzM@._V1_.jpg',
  '2016-09-16'::date,
  null,
  2016,
  2019,
  array['comedy', 'drama']::text[],
  'classic',
  8.1::numeric,
  'Rank #12. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Phoebe Waller-Bridge',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Fleabag');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Fargo',
  'Various chronicles of deception, intrigue, and murder in and around frozen Minnesota. All of these tales mysteriously lead back one way or another to Fargo, North Dakota.',
  'https://m.media-amazon.com/images/M/MV5BMjMzMTIzMTUwN15BMl5BanBnXkFtZTgwNjE0NTg0MTE@._V1_.jpg',
  '2014-04-15'::date,
  null,
  2014,
  2024,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Rank #13. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Noah Hawley',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Fargo');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'House',
  'Using a crack team of doctors and his wits, an antisocial maverick doctor specializing in diagnostic medicine does whatever it takes to solve puzzling cases that come his way.',
  'https://m.media-amazon.com/images/M/MV5BMjgxYjAwNmMtYTAwZC00YmQxLWJlOTMtMWM0NGJmNDE0YmI2XkEyXkFqcGc@._V1_.jpg',
  '2004-11-16'::date,
  null,
  2004,
  2012,
  array['drama']::text[],
  'classic',
  8.1::numeric,
  'Rank #14. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'David Shore',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'House');

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
  'classic',
  8.1::numeric,
  'Rank #15. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Dark',
  'A missing child sets four families on a frantic hunt for answers as they unearth a mind-bending mystery that spans three generations.',
  'https://image.tmdb.org/t/p/w500/appl9ZtcRm1HHVs1Uqgdxs8p2NU.jpg',
  '2017-12-01'::date,
  '2020-06-27'::date,
  2017,
  2020,
  array['sci-fi', 'mystery', 'thriller', 'drama']::text[],
  'classic',
  8.1::numeric,
  'Rank #16. Catalogue: best TV ranking seed (2026-06-11).',
  3,
  '',
  'Baran bo Odar, Jantje Friese',
  'English',
  'Netflix',
  'netflix',
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dark');

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
  'classic',
  8.1::numeric,
  'Rank #17. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Succession',
  'The Roy family is known for controlling the biggest media and entertainment company in the world. However, their world changes when their father steps down from the company.',
  'https://m.media-amazon.com/images/M/MV5BYTY4YTVkY2QtMjRmOS00YzliLWIxOWQtMTdkOTVkN2UzODNmXkEyXkFqcGc@._V1_.jpg',
  '2018-06-03'::date,
  null,
  2018,
  2023,
  array['comedy', 'drama']::text[],
  'classic',
  8.1::numeric,
  'Rank #18. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Battlestar Galactica',
  'Following the destruction of the Twelve Colonies of Kobol by the Cylons, a rag-tag fugitive fleet of the last remnants of mankind flees the pursuing Cylons while simultaneously searching for their true home: Earth.',
  'https://m.media-amazon.com/images/M/MV5BNjYwYTVjMWMtZDEwYS00ODUzLWIwN2UtYTRjODUxYzU4MWEzXkEyXkFqcGc@._V1_.jpg',
  '2003-12-08'::date,
  null,
  2004,
  2003,
  array['action', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8::numeric,
  'Rank #19. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Battlestar Galactica');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Freaks and Geeks',
  'A high school mathlete starts hanging out with a group of burnouts while her younger brother navigates his freshman year.',
  'https://m.media-amazon.com/images/M/MV5BNDk4MTRlZjMtYTMxYi00ZjdkLWEyYjYtZjg1NjBlMzY2MDIzXkEyXkFqcGc@._V1_.jpg',
  '1999-09-25'::date,
  null,
  1999,
  2000,
  array['comedy', 'drama']::text[],
  'classic',
  8::numeric,
  'Rank #20. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Paul Feig',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Freaks and Geeks');

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
  'classic',
  8::numeric,
  'Rank #21. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Narcos',
  'A chronicled look at the criminal exploits of Colombian drug lord Pablo Escobar, as well as the many other drug kingpins who plagued the country through the years.',
  'https://m.media-amazon.com/images/M/MV5BNzQwOTcwMzIwN15BMl5BanBnXkFtZTgwMjYxMTA0NjE@._V1_.jpg',
  '2015-08-28'::date,
  null,
  2015,
  2017,
  array['biography', 'crime', 'drama', 'thriller']::text[],
  'classic',
  8::numeric,
  'Rank #22. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Narcos');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mindhunter',
  'In the late 1970s, two FBI agents broaden the realm of criminal science by investigating the psychology behind murder and end up getting too close to real-life monsters.',
  'https://m.media-amazon.com/images/M/MV5BYTk4NDA4MGMtNjliOC00MjExLWI1YzctOTc4NWIxM2I1YjM5XkEyXkFqcGc@._V1_.jpg',
  '2017-10-13'::date,
  null,
  2017,
  2019,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8::numeric,
  'Rank #23. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Joe Penhall',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mindhunter');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mr. Robot',
  'Elliot, a brilliant but unstable cyber-security engineer and vigilante hacker, becomes a key figure in a complex game of global chaos when he and his shadowy allies try to take down the corrupt corporation his company is paid to protect.',
  'https://m.media-amazon.com/images/M/MV5BOTg4NTBiZDAtZTc0YS00NzZlLTg4Y2ItNGQ3M2ZlMDM5MWQzXkEyXkFqcGc@._V1_.jpg',
  '2015-06-24'::date,
  null,
  2015,
  2019,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8::numeric,
  'Rank #24. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Sam Esmail',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mr. Robot');

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
  'classic',
  8::numeric,
  'Rank #25. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Heartstopper',
  'Teens Charlie and Nick discover their unlikely friendship might be something more as they navigate school and young love in this heartwarming coming-of-age story.',
  'https://m.media-amazon.com/images/M/MV5BNmQ5ZjNiYWMtZGFiNS00NTQ4LTliYTUtNDA5NjI4NzU3NzI5XkEyXkFqcGc@._V1_.jpg',
  '2022-04-22'::date,
  null,
  2022,
  null,
  array['drama', 'romance', 'comedy']::text[],
  'classic',
  8::numeric,
  'Rank #26. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Alice Oseman',
  'English',
  'Netflix',
  'netflix',
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Heartstopper');

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
  'classic',
  8::numeric,
  'Rank #27. Catalogue: best TV ranking seed (2026-06-11).',
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
  'It''s Always Sunny in Philadelphia',
  'Five friends with big egos and small brains are the proprietors of an Irish pub in Philadelphia.',
  'https://m.media-amazon.com/images/M/MV5BMTFiMDg5ZTItNWU2Ni00YzJlLWE4NTQtZjUwNWFhOTViYTk2XkEyXkFqcGc@._V1_.jpg',
  '2005-08-04'::date,
  null,
  2005,
  null,
  array['comedy']::text[],
  'classic',
  8::numeric,
  'Rank #28. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'It''s Always Sunny in Philadelphia');

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
  'classic',
  8::numeric,
  'Rank #29. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Seinfeld',
  'The continuing misadventures of neurotic New York City stand-up comedian Jerry Seinfeld and his equally neurotic New York City friends.',
  'https://m.media-amazon.com/images/M/MV5BMmRjNjZjN2ItN2FkYi00ZDg0LWExN2EtMTU2ODUwNWU1M2NhXkEyXkFqcGc@._V1_.jpg',
  '1989-07-05'::date,
  null,
  1989,
  1998,
  array['comedy']::text[],
  'classic',
  7.9::numeric,
  'Rank #30. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Seinfeld');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Peep Show',
  'Mark and Jez are a couple of twenty-something roommates who have nothing in common - except for the fact that their lives are anything but normal. Mayhem ensues as the pair strive to cope with day-to-day life.',
  'https://m.media-amazon.com/images/M/MV5BNmQ0MGMwNjMtNmEyMC00OTA2LTg4YTEtNjBhNjNkYTgzMmZlXkEyXkFqcGc@._V1_.jpg',
  '2004-11-12'::date,
  null,
  2003,
  2015,
  array['comedy']::text[],
  'classic',
  7.9::numeric,
  'Rank #31. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Peep Show');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Last of Us',
  'Twenty years after a fungal plague ravages the planet, hardened survivor Joel is hired to smuggle Ellie, a teenager who may hold the key to a cure, across a post-apocalyptic United States.',
  'https://m.media-amazon.com/images/M/MV5BZjdkYzY2ZmItN2I4My00MjMwLWJhZmUtM2VlMDEyZDI0Y2FjXkEyXkFqcGc@._V1_.jpg',
  '2023-01-15'::date,
  null,
  2023,
  null,
  array['drama', 'action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.9::numeric,
  'Rank #32. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Craig Mazin, Neil Druckmann',
  'English',
  'HBO',
  'max',
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Last of Us');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'When They See Us',
  'Five teens from Harlem become trapped in a nightmare when they''re falsely accused of a brutal attack in Central Park. Based on the true story.',
  'https://m.media-amazon.com/images/M/MV5BMGU0MDIzZTAtYjBjZi00ZDQ1LThlYzctNWJkOWU4NTI5OWNkXkEyXkFqcGc@._V1_.jpg',
  '2019-05-31'::date,
  null,
  2019,
  2019,
  array['biography', 'crime', 'drama', 'history']::text[],
  'classic',
  7.9::numeric,
  'Rank #33. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Ava DuVernay',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'When They See Us');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Mandalorian',
  'The travels of a lone bounty hunter in the outer reaches of the galaxy, far from the authority of the New Republic.',
  'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_.jpg',
  '2019-11-12'::date,
  null,
  2019,
  2023,
  array['action', 'adventure', 'fantasy', 'sci-fi']::text[],
  'classic',
  7.9::numeric,
  'Rank #34. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Jon Favreau',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Mandalorian');

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
  'classic',
  7.9::numeric,
  'Rank #35. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Line of Duty',
  'British crime drama series following a team of elite detectives tasked with investigating police corruption.',
  'https://m.media-amazon.com/images/M/MV5BZTE4OGI5Y2ItYmEwYi00YjE0LTk1M2EtZjI4NzM1ZjdjODcxXkEyXkFqcGc@._V1_.jpg',
  '2012-08-21'::date,
  null,
  2012,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #36. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Jed Mercurio',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Line of Duty');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Deadwood',
  'A show set in the late 1800s, revolving around the characters of Deadwood, South Dakota; a town of deep corruption and crime.',
  'https://m.media-amazon.com/images/M/MV5BODFiMjBkNDMtN2I1NS00YWM3LTliNWEtMTg0NjVlN2I5YTNlXkEyXkFqcGc@._V1_.jpg',
  '2004-03-21'::date,
  null,
  2004,
  2006,
  array['crime', 'drama', 'history', 'western']::text[],
  'classic',
  7.9::numeric,
  'Rank #37. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'David Milch',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Deadwood');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mare of Easttown',
  'A detective in a small Pennsylvania town investigates a murder while grappling with personal tragedy and the scrutiny of her community.',
  'https://m.media-amazon.com/images/M/MV5BYWQ2OWU5ODItYzY1MS00YTU4LWJhMDktMTMzMGJhYjI4YjQ1XkEyXkFqcGc@._V1_.jpg',
  '2021-04-18'::date,
  '2021-05-30'::date,
  2021,
  2021,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.9::numeric,
  'Rank #38. Catalogue: best TV ranking seed (2026-06-11).',
  1,
  '',
  'Brad Ingelsby',
  'English',
  'HBO',
  'max',
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mare of Easttown');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Hannibal',
  'Gifted criminal profiler Will Graham and enigmatic psychiatrist Hannibal Lecter form a dangerous partnership while hunting serial killers.',
  'https://m.media-amazon.com/images/M/MV5BNThkNDQ0MWEtNTE3MS00MGIxLWEzMTYtZTEyNTU0ODc0MDQ5XkEyXkFqcGc@._V1_.jpg',
  '2013-04-04'::date,
  '2015-08-29'::date,
  2013,
  2015,
  array['crime', 'drama', 'horror', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #39. Catalogue: best TV ranking seed (2026-06-11).',
  3,
  '',
  'Bryan Fuller',
  'English',
  'NBC',
  null,
  'cancelled',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Hannibal');

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
  'classic',
  7.9::numeric,
  'Rank #40. Catalogue: best TV ranking seed (2026-06-11).',
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
  'Boardwalk Empire',
  'An Atlantic City politician plays both sides of the law by conspiring with gangsters during the Prohibition era.',
  'https://m.media-amazon.com/images/M/MV5BN2MzODhjYTEtZTA2ZS00ZTRjLTlkZDYtNTBkNTdhNWJlMTYwXkEyXkFqcGc@._V1_.jpg',
  '2010-09-19'::date,
  null,
  2010,
  2014,
  array['crime', 'drama']::text[],
  'classic',
  7.9::numeric,
  'Rank #41. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Terence Winter',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Boardwalk Empire');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Atlanta',
  'Earn and his cousin Alfred try to make their way in the world through Atlanta''s rap scene. Along the way they come face-to-face with social and economic issues touching on race, relationships, poverty, status, and parenthood.',
  'https://m.media-amazon.com/images/M/MV5BMDAzMDdkZmEtN2QxMi00NGQ2LTg3MTEtYTBlMmNmYmJjOTc1XkEyXkFqcGc@._V1_.jpg',
  '2016-09-06'::date,
  null,
  2016,
  2022,
  array['comedy', 'drama', 'music']::text[],
  'classic',
  7.9::numeric,
  'Rank #42. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Donald Glover',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Atlanta');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Vikings',
  'The adventures of Ragnar Lothbrok, a farmer who rises to become a Scandinavian king, and his family as they raid and explore medieval Europe.',
  'https://m.media-amazon.com/images/M/MV5BODk4NjU0YTgtYmU3Ni00YTU1LThkZTUtNTMyMmRlNDYyYWFkXkEyXkFqcGc@._V1_.jpg',
  '2013-03-03'::date,
  '2020-12-30'::date,
  2013,
  2020,
  array['action', 'drama', 'history']::text[],
  'classic',
  7.9::numeric,
  'Rank #43. Catalogue: best TV ranking seed (2026-06-11).',
  6,
  '',
  'Michael Hirst',
  'English',
  'History',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Vikings');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Twin Peaks',
  'Picks up 25 years after the inhabitants of a quaint northwestern town are stunned when their homecoming queen is murdered.',
  'https://m.media-amazon.com/images/M/MV5BZGU5OTQ2YzctZmE4Zi00OWI0LWJmMDQtNDcxYjJmODBjN2U1XkEyXkFqcGc@._V1_.jpg',
  '2017-05-21'::date,
  null,
  1990,
  2017,
  array['crime', 'drama', 'horror', 'mystery']::text[],
  'classic',
  7.9::numeric,
  'Rank #44. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Twin Peaks');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Shield',
  'A gang of corrupt Los Angeles Police Department cops uses illegal methods to maintain law and order, whilst engaging in a series of undercover dealings secretly in order to get rich.',
  'https://m.media-amazon.com/images/M/MV5BN2Y2NzUzZjItNjNjYy00ZjA0LTllYWEtZGE2NjY0NDg1YzRlXkEyXkFqcGc@._V1_.jpg',
  '2002-03-12'::date,
  null,
  2002,
  2008,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #45. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Shawn Ryan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Shield');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Happy Valley',
  'Yorkshire-based crime drama centering on the personal and professional life of Police Sergeant Catherine Cawood.',
  'https://m.media-amazon.com/images/M/MV5BNWEzMmI5YjgtMWE3Zi00Y2U4LWE0ODQtYjU4NGJjYzU0Nzc1XkEyXkFqcGc@._V1_.jpg',
  '2014-04-29'::date,
  null,
  2014,
  2023,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #46. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Sally Wainwright',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Happy Valley');

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
  'classic',
  7.9::numeric,
  'Rank #47. Catalogue: best TV ranking seed (2026-06-11).',
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
  'The Haunting of Hill House',
  'Flashing between past and present, a fractured family confronts haunting memories of their old home and the terrifying events that drove them from it.',
  'https://m.media-amazon.com/images/M/MV5BMTU4NzA4MDEwNF5BMl5BanBnXkFtZTgwMTQxODYzNjM@._V1_.jpg',
  '2018-10-12'::date,
  null,
  2018,
  2018,
  array['drama', 'horror', 'mystery', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #48. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Mike Flanagan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Haunting of Hill House');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Americans',
  'Two Soviet KGB officers pose as an American married couple in suburban Washington, D.C., during the Cold War, raising a family while carrying out espionage.',
  'https://m.media-amazon.com/images/M/MV5BMTMyMjMxNjg5M15BMV5BMV5BN3RfQzIxRTEyNDkzNDg1XkEyXkFqcGc@._V1_.jpg',
  '2013-01-30'::date,
  '2018-05-30'::date,
  2013,
  2018,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Rank #49. Catalogue: best TV ranking seed (2026-06-11).',
  6,
  '',
  'Joe Weisberg',
  'English',
  'FX',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Americans');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Justified',
  'Enforcing his own brand of justice, U.S. Marshal Raylan Givens, a strong-willed, quiet law-man haunted by his past, returns to his native town to see that justice is served to those in need.',
  'https://m.media-amazon.com/images/M/MV5BZGIzNmFlMzgtYWY0MC00NjFmLWJhMGItZTM2YjVlZjY3ZjBlXkEyXkFqcGc@._V1_.jpg',
  '2010-03-16'::date,
  null,
  2010,
  2015,
  array['action', 'crime', 'drama', 'mystery', 'thriller', 'western']::text[],
  'classic',
  7.9::numeric,
  'Rank #50. Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  'Graham Yost',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Justified');

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
  'classic',
  8.1::numeric,
  'Catalogue: best TV ranking seed (2026-06-11).',
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
  'Avatar: The Last Airbender',
  'After a century frozen in ice, young Avatar Aang journeys with friends to master the four elements and bring balance to a world at war with the Fire Nation.',
  'https://m.media-amazon.com/images/M/MV5BMDMwMThjYWYtY2Q2OS00OGM2LTlkODQtNDJlZTZmMjAyYmFhXkEyXkFqcGc@._V1_.jpg',
  '2005-02-21'::date,
  null,
  2005,
  2008,
  array['animation', 'action', 'adventure', 'family', 'fantasy', 'mystery']::text[],
  'classic',
  9.3::numeric,
  'Catalogue: best TV ranking seed (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Avatar: The Last Airbender');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'How I Met Your Mother',
  'A father recounts to his children the events that led him to meet their mother, through the lens of his close-knit group of friends in New York City.',
  'https://m.media-amazon.com/images/M/MV5BNjg1MDU5YzVlOC00YjFkLThjYTYtOThmYTc0MjQ0Y2ZhXkEyXkFqcGc@._V1_.jpg',
  '2005-09-19'::date,
  '2014-03-31'::date,
  2005,
  2014,
  array['comedy', 'romance']::text[],
  'classic',
  8.3::numeric,
  'Catalogue: best TV ranking seed (2026-06-11).',
  9,
  '',
  'Carter Bays, Craig Thomas',
  'English',
  'CBS',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'How I Met Your Mother');
