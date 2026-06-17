-- Catalogue seed: IMDb Top Rated TV chart (2026-06-11).
-- Source: https://www.imdb.com/chart/toptv/
-- Data: data/imdb-toptv-2026-06-11.json
-- Skips titles already in DB or prior series seeds. All rows approval_status = pending.

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Planet Earth II',
  'David Attenborough presents a spectacular journey through Earth''s habitats, revealing how animals adapt and survive on islands, mountains, jungles, deserts, grasslands and cities.',
  'https://m.media-amazon.com/images/M/MV5BMzY4NDBkMWYtYzdkYy00YzBjLWJmODctMWM4YjYzZTdjNWE5XkEyXkFqcGc@._V1_.jpg',
  '2017-02-18'::date,
  null,
  2016,
  2016,
  array['documentary', 'family']::text[],
  'classic',
  9.4::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Planet Earth II');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Planet Earth',
  'An epic nature documentary series exploring Earth''s most spectacular habitats, revealing the wildlife, landscapes, and natural forces that shape life across the planet.',
  'https://m.media-amazon.com/images/M/MV5BY2NjNDUzOTgtMDFmNC00ZGQ4LWE5MDctMzczNGVlOGU1N2MyXkEyXkFqcGc@._V1_.jpg',
  '2007-03-25'::date,
  null,
  2006,
  2006,
  array['documentary', 'family']::text[],
  'classic',
  9.4::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Planet Earth');

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
  9.3::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Blue Planet II',
  'David Attenborough journeys through Earth''s oceans, revealing extraordinary marine life, hidden habitats, and the changing forces shaping our blue planet.',
  'https://m.media-amazon.com/images/M/MV5BNmUwYThjM2UtNTg1Yy00MzRlLThhMmYtNjlmOWU0ZmQxZDA3XkEyXkFqcGc@._V1_.jpg',
  '2018-01-20'::date,
  null,
  2017,
  2017,
  array['documentary', 'family']::text[],
  'classic',
  9.3::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Blue Planet II');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Cosmos: A Spacetime Odyssey',
  'An exploration of our discovery of the laws of nature and coordinates in space and time.',
  'https://m.media-amazon.com/images/M/MV5BYTRlMzk0NzctNTI3Ni00N2E2LWJiNGMtMDdlNjk1YWNmMzkyXkEyXkFqcGc@._V1_.jpg',
  '2014-03-09'::date,
  null,
  2014,
  2014,
  array['documentary', 'family']::text[],
  'classic',
  9.2::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Cosmos: A Spacetime Odyssey');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Cosmos',
  'Astronomer Carl Sagan journeys across space and time, exploring the universe, the history of science, and humanity''s place among the stars.',
  'https://m.media-amazon.com/images/M/MV5BOTA5MWFhMzAtOWU1OS00Yjk4LTlkNGItNGI3N2VkNzcyNGU2XkEyXkFqcGc@._V1_.jpg',
  '1980-09-28'::date,
  null,
  1980,
  1980,
  array['documentary']::text[],
  'classic',
  9.3::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Cosmos');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Our Planet',
  'Explores and unravels the mystery of how and why animals migrate, showing some of the most dramatic and compelling stories in the natural world through spectacular and innovative cinematography.',
  'https://m.media-amazon.com/images/M/MV5BZDE1NzlkNWMtNzFiMC00ZTgxLTgyMmItOTU5OGI2NWQ4MDMxXkEyXkFqcGc@._V1_.jpg',
  '2019-04-05'::date,
  null,
  2019,
  2023,
  array['documentary', 'family']::text[],
  'classic',
  9.2::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Our Planet');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Bluey',
  'Bluey, a playful six-year-old Blue Heeler puppy, turns everyday family life with her parents and little sister Bingo into imaginative games and heartfelt adventures.',
  'https://m.media-amazon.com/images/M/MV5BYWU1YmQzMjEtMDNjOS00MGIyLWExY2ItZDAzNmU5NWViMGZmXkEyXkFqcGc@._V1_.jpg',
  '2018-09-30'::date,
  null,
  2018,
  null,
  array['animation', 'comedy', 'family']::text[],
  'classic',
  9.3::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Joe Brumm',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Bluey');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The World at War',
  '26-part documentary series tracing World War II from the rise of Nazi Germany through the conflict''s major campaigns and home fronts, using archival footage and firsthand interviews, narrated by Laurence Olivier.',
  'https://m.media-amazon.com/images/M/MV5BM2I1OGUyNmYtZmNiOC00OGQ4LWFlNDEtYTM5ZTAxMDI4ZmMyXkEyXkFqcGc@._V1_.jpg',
  '1973-10-31'::date,
  null,
  1973,
  1974,
  array['documentary', 'history', 'war']::text[],
  'classic',
  9.2::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The World at War');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Fullmetal Alchemist: Brotherhood',
  'Two brothers search for a Philosopher''s Stone after an attempt to revive their deceased mother goes awry and leaves them in damaged physical forms.',
  'https://m.media-amazon.com/images/M/MV5BMzNiODA5NjYtYWExZS00OTc4LTg3N2ItYWYwYTUyYmM5MWViXkEyXkFqcGc@._V1_.jpg',
  '2009-04-09'::date,
  null,
  2009,
  2010,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Hiromu Arakawa',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Fullmetal Alchemist: Brotherhood');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Life',
  'A global nature documentary exploring the extraordinary strategies animals and plants use to survive, reproduce, and thrive across Earth''s diverse habitats.',
  'https://m.media-amazon.com/images/M/MV5BZDJjMzJiMTktMWZkZi00YWY0LWJjNGUtY2ZmNTFlOThhZTA4XkEyXkFqcGc@._V1_.jpg',
  '2010-03-21'::date,
  null,
  2009,
  2009,
  array['documentary']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Life');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Last Dance',
  'Led by Michael Jordan, the 1990s Chicago Bulls establish themselves as one of the most notable dynasties in sports history.',
  'https://m.media-amazon.com/images/M/MV5BOTQyYmQ1N2UtYjFkNS00NzgyLTk5YTUtYjExMDdjOTA3MGU2XkEyXkFqcGc@._V1_.jpg',
  '2020-04-19'::date,
  null,
  2020,
  2020,
  array['documentary', 'biography', 'history', 'sports']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Last Dance');

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
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'The Vietnam War',
  'A documentary series chronicling the Vietnam War through archival footage and firsthand accounts from soldiers, civilians, and leaders on all sides, tracing its origins, major events, and enduring impact on the United States and Vietnam.',
  'https://m.media-amazon.com/images/M/MV5BYTQ1ZWYzMmQtNWU5OC00YWY0LTkyMWMtMTU0NjYxMjJkMmNjXkEyXkFqcGc@._V1_.jpg',
  '2017-09-17'::date,
  null,
  2017,
  2017,
  array['documentary', 'history', 'war']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Vietnam War');

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
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Batman: The Animated Series',
  'Billionaire Bruce Wayne secretly operates as Batman, a vigilante who battles a rouges'' gallery of criminals and supervillains in Gotham City with the aid of various sidekicks and allies.',
  'https://m.media-amazon.com/images/M/MV5BYjgwZWUzMzUtYTFkNi00MzM0LWFkMWUtMDViMjMxNGIxNDUxXkEyXkFqcGc@._V1_.jpg',
  '1992-09-05'::date,
  null,
  1992,
  1995,
  array['animation', 'action', 'adventure', 'crime', 'family', 'mystery']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Batman: The Animated Series');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Arcane',
  'Amid the stark discord of twin cities Piltover and Zaun, two sisters fight on rival sides of a war between magic technologies and clashing convictions.',
  'https://m.media-amazon.com/images/M/MV5BYjA2NzhlMDItNWRmZC00MzRjLWE3ZjAtZjBlZDAwOWY2ODdjXkEyXkFqcGc@._V1_.jpg',
  '2021-11-06'::date,
  null,
  2021,
  2024,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'sci-fi']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Arcane');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Blue Planet',
  'Explores Earth''s oceans, from sunlit shallows to the deep sea, revealing the animals, habitats, and forces that shape life beneath the waves.',
  'https://m.media-amazon.com/images/M/MV5BYjgyODJmY2YtZTk4Yy00MjBlLWFlM2YtNDIyMDk5YmQxMTllXkEyXkFqcGc@._V1_.jpg',
  '2002-01-27'::date,
  null,
  2001,
  2001,
  array['documentary', 'family']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Blue Planet');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Hunter X Hunter',
  'Gon Freecss aspires to become a Hunter, an exceptional being capable of greatness. With his friends and his potential, he seeks out his father, who left him when he was younger.',
  'https://m.media-amazon.com/images/M/MV5BYzYxOTlkYzctNGY2MC00MjNjLWIxOWMtY2QwYjcxZWIwMmEwXkEyXkFqcGc@._V1_.jpg',
  '2016-04-17'::date,
  null,
  2011,
  2014,
  array['animation', 'action', 'adventure', 'comedy', 'fantasy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Yoshihiro Togashi',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Hunter X Hunter');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Scam 1992: The Harshad Mehta Story',
  'The rise and fall of Harshad Mehta, a stockbroker who single-handedly took the stock market to great heights, is depicted.',
  'https://m.media-amazon.com/images/M/MV5BNGRkOTVjODgtNTBmZS00MDQ3LWE3ZjQtM2ZiNDQ3OWJkMjM2XkEyXkFqcGc@._V1_.jpg',
  '2020-10-09'::date,
  null,
  2020,
  2020,
  array['biography', 'crime', 'drama', 'thriller']::text[],
  'classic',
  9.2::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Scam 1992: The Harshad Mehta Story');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Frozen Planet',
  'Focuses on life and the environment in both the Arctic and Antarctic.',
  'https://m.media-amazon.com/images/M/MV5BMDE0ZTZlZDItOTgzNS00Zjg4LWEwOWEtYjc1YzY2MjliZTM5XkEyXkFqcGc@._V1_.jpg',
  '2012-03-18'::date,
  null,
  2011,
  2012,
  array['documentary', 'family']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Frozen Planet');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Only Fools and Horses',
  'Follows two brothers from a rough London estate as they wheel and deal through a number of dodgy deals and search for the big score that''ll make them millionaires.',
  'https://m.media-amazon.com/images/M/MV5BMWM4YjFhOWMtYzg1Yi00NTA2LTlmNzMtNDk3M2M1MTRiN2QyXkEyXkFqcGc@._V1_.jpg',
  '1981-09-08'::date,
  null,
  1981,
  2003,
  array['comedy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'John Sullivan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Only Fools and Horses');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Human Planet',
  'A cinematic experience bringing you the most amazing human stories in the world. Humans and wildlife surviving in the most extreme environments on Earth',
  'https://m.media-amazon.com/images/M/MV5BMDYxN2U4YjEtZmZjYS00NmJkLTg3Y2EtZjFmNmFiNmExMDMwXkEyXkFqcGc@._V1_.jpg',
  '2011-04-10'::date,
  null,
  2011,
  2011,
  array['documentary']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Human Planet');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Beatles Anthology',
  'The Beatles candidly tell their own story, with all its complexities and contradictions.',
  'https://m.media-amazon.com/images/M/MV5BYTYzNDA1NmMtNjg2ZC00OWVlLWFmMDItNTljMjFiMWQxZjgzXkEyXkFqcGc@._V1_.jpg',
  '1995-11-11'::date,
  null,
  1995,
  1996,
  array['documentary', 'music']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Beatles Anthology');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dexter: Resurrection',
  'Dexter Morgan awakens from a coma and sets out for New York City, determined to find Harrison and make things right. But when Miami Metro''s Angel Batista arrives with questions, Dexter realizes his past is catching up to him fast.',
  'https://m.media-amazon.com/images/M/MV5BMzgxNzUwZTctMzliNi00MDUwLWE4YzctNjgwMDE2OWQwNzMxXkEyXkFqcGc@._V1_.jpg',
  '2025-07-11'::date,
  null,
  2025,
  null,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Clyde Phillips',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dexter: Resurrection');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Civil War',
  'A comprehensive survey of the American Civil War.',
  'https://m.media-amazon.com/images/M/MV5BYTUwNTM2YTAtODA3Yi00YjU0LTliNzktM2YzMzk5NzU5ZTcyXkEyXkFqcGc@._V1_.jpg',
  '1990-09-23'::date,
  null,
  1990,
  1990,
  array['documentary', 'history', 'war']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Civil War');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'As If',
  'Yilmaz and Ilkkan are two friends who are constantly fighting each other. Their greatest feature is always being able to do something that will turn their ordinary lives upside down.',
  'https://m.media-amazon.com/images/M/MV5BOWY0ZGIyZjAtZDIxMC00NTY4LTgyNDEtYmMwMzBmNmQ0MmE1XkEyXkFqcGc@._V1_.jpg',
  '2021-01-01'::date,
  null,
  2021,
  2025,
  array['comedy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'As If');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Firefly',
  'A renegade crew aboard a small spacecraft tries to survive as they travel the unknown parts of the galaxy and evade warring factions as well as authority agents out to get them.',
  'https://m.media-amazon.com/images/M/MV5BYzYyZWYzNzUtOWQ4Yi00Y2Q4LWJjZjgtZTllNjg2ZGM0MTcyXkEyXkFqcGc@._V1_.jpg',
  '2002-09-20'::date,
  null,
  2002,
  2003,
  array['adventure', 'sci-fi']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Joss Whedon',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Firefly');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Gravity Falls',
  'Twin siblings Dipper and Mabel Pines spend the summer at their great-uncle''s tourist trap in the enigmatic Gravity Falls, Oregon.',
  'https://m.media-amazon.com/images/M/MV5BMTEzNDc3MDQ2NzNeQTJeQWpwZ15BbWU4MDYzMzUwMDIx._V1_.jpg',
  '2012-06-15'::date,
  null,
  2012,
  2016,
  array['animation', 'adventure', 'comedy', 'family', 'fantasy']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Alex Hirsch',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Gravity Falls');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Death Note',
  'An intelligent high school student goes on a secret crusade to eliminate criminals from the world after discovering a notebook capable of killing anyone whose name is written into it.',
  'https://m.media-amazon.com/images/M/MV5BYTgyZDhmMTEtZDFhNi00MTc4LTg3NjUtYWJlNGE5Mzk2NzMxXkEyXkFqcGc@._V1_.jpg',
  '2007-10-20'::date,
  null,
  2006,
  2007,
  array['animation', 'crime', 'drama', 'fantasy', 'mystery', 'thriller']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Death Note');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Frieren: Beyond Journey''s End',
  'Elf mage Frieren and her fellow adventurers have defeated the Demon King and brought peace to the land. But Frieren will long outlive the rest of her former party. How will she come to understand what life means to the people around her?',
  'https://m.media-amazon.com/images/M/MV5BZTI4ZGMxN2UtODlkYS00MTBjLWE1YzctYzc3NDViMGI0ZmJmXkEyXkFqcGc@._V1_.jpg',
  '2023-09-29'::date,
  null,
  2023,
  null,
  array['animation', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Frieren: Beyond Journey''s End');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Taskmaster',
  'Five comedians are set tasks challenging their creativity and wit. The tasks are supervised by Alex Horne but the Taskmaster, Greg Davies, always has the final word.',
  'https://m.media-amazon.com/images/M/MV5BY2RmNmM1YzAtOWJlMi00NTdiLWEwN2MtNDliNGI3NmUxMTk3XkEyXkFqcGc@._V1_.jpg',
  '2018-04-26'::date,
  null,
  2015,
  null,
  array['comedy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Taskmaster');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dekalog',
  'Ten television drama films, each one based on one of the Ten Commandments.',
  'https://m.media-amazon.com/images/M/MV5BZmUzZjk0NjEtOTFjMC00NDI2LTkwZmEtZWIxYjVjNDEwNWZiXkEyXkFqcGc@._V1_.jpg',
  '1989-12-10'::date,
  null,
  1989,
  1990,
  array['drama']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dekalog');

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
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'The Beatles: Get Back',
  'In January 1969, The Beatles set out to write and record new songs for their first live show in more than two years, culminating in an impromptu concert atop their Savile Row studio.',
  'https://m.media-amazon.com/images/M/MV5BYmEzY2E0MDQtMTc3NS00OTM5LWIyMDMtMTliNThlOWQ5OWEyXkEyXkFqcGc@._V1_.jpg',
  '2021-11-25'::date,
  null,
  2021,
  2021,
  array['documentary', 'biography', 'history', 'music']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Beatles: Get Back');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Nathan for You',
  'Nathan Fielder uses his business degree and life experiences to, in unorthodox ways, help real small businesses turn a profit.',
  'https://m.media-amazon.com/images/M/MV5BNDU5OTA3YWUtYTIxYi00MWEwLTljZDEtYjhiYjEwYmJhMGVlXkEyXkFqcGc@._V1_.jpg',
  '2013-02-28'::date,
  null,
  2013,
  2017,
  array['documentary', 'comedy']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Nathan for You');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Cowboy Bebop',
  'Intergalactic loners team up to track down fugitives and turn them in for cold hard cash.',
  'https://m.media-amazon.com/images/M/MV5BMTU3ZTdiOGQtYmYwYy00OGM5LThmNjMtZGJmNTVlZjk1ZmEyXkEyXkFqcGc@._V1_.jpg',
  '2001-09-02'::date,
  null,
  1998,
  1999,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'sci-fi']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Cowboy Bebop');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Apocalypse: The Second World War',
  'This six-part series traces the Second World War, from the rise of the Nazis to the surrender of the Japanese, with detailed portraits of key figures.',
  'https://m.media-amazon.com/images/M/MV5BZDQwMjdmZTctODU5MS00NDFmLWFmODYtZTUzMzAzOTFlNTMwXkEyXkFqcGc@._V1_.jpg',
  '2009-11-11'::date,
  null,
  2009,
  2009,
  array['documentary', 'history', 'war']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Apocalypse: The Second World War');

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
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Persona',
  'A man diagnosed with Alzheimer''s decides to punish criminals.',
  'https://m.media-amazon.com/images/M/MV5BMjM0NWYyZDAtOTZjMS00OGZiLWE0MWEtYjdiNDhiYzJkYjE4XkEyXkFqcGc@._V1_.jpg',
  '2021-12-02'::date,
  null,
  2018,
  2024,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Persona');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Africa',
  'Africa, the world''s wildest continent. David Attenborough takes an awe-inspiring journey through one of the most diverse places in the world. We visit deserts, savannas, and jungles and meet up with some of Africa''s amazing wildlife.',
  'https://m.media-amazon.com/images/M/MV5BNWIxM2MyYzItMzZkMC00YTI4LWI4M2UtNWNlYjk5MzU5YjY2XkEyXkFqcGc@._V1_.jpg',
  '2013-01-02'::date,
  null,
  2013,
  2013,
  array['documentary', 'family']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Africa');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Chosen',
  'The Chosen is a historical drama based on the life of Jesus and those who knew him. Set against the backdrop of Roman oppression in first-century Israel, the series shares an authentic look at Jesus'' revolutionary life and teachings.',
  'https://m.media-amazon.com/images/M/MV5BMDRiNmVjYmQtZDQ3Yy00MjA5LWFhYWYtYWMxYTE1NzEyZDNiXkEyXkFqcGc@._V1_.jpg',
  '2019-04-21'::date,
  null,
  2017,
  null,
  array['drama', 'history']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Dallas Jenkins',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Chosen');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Bleach: Thousand-Year Blood War',
  'The peace is suddenly broken when warning sirens blare through the Soul Society. Residents are disappearing without a trace and nobody knows who''s behind it. Meanwhile, a darkness is approaching Ichigo and his friends in Karakura Town.',
  'https://m.media-amazon.com/images/M/MV5BMjgyM2QzMjAtOGZjOS00OGFkLTkxZGYtMDJjZGM5MzIzYmM3XkEyXkFqcGc@._V1_.jpg',
  '2022-10-10'::date,
  null,
  2022,
  null,
  array['animation', 'action', 'adventure', 'fantasy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Tite Kubo',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Bleach: Thousand-Year Blood War');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The West Wing',
  'Follows US president Josiah Bartlet and his administration as they tackle various political issues in order to maintain peace and harmony in the nation.',
  'https://m.media-amazon.com/images/M/MV5BY2I2Mzc0YjItN2I3MS00NjNjLWE5OWUtYmQzMjkxZjIwOGY5XkEyXkFqcGc@._V1_.jpg',
  '1999-09-22'::date,
  null,
  1999,
  2006,
  array['drama']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Aaron Sorkin',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The West Wing');

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
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'It''s Always Sunny in Philadelphia',
  'Five friends with big egos and small brains are the proprietors of an Irish pub in Philadelphia.',
  'https://m.media-amazon.com/images/M/MV5BMTFiMDg5ZTItNWU2Ni00YzJlLWE4NTQtZjUwNWFhOTViYTk2XkEyXkFqcGc@._V1_.jpg',
  '2005-08-04'::date,
  null,
  2005,
  null,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'When Life Gives You Tangerines',
  'In Jeju, a spirited girl and a steadfast boy''s island story blossoms into a lifelong tale of setbacks and triumphs, proving love endures across time.',
  'https://m.media-amazon.com/images/M/MV5BNDU5NTY2YjgtNGZjNy00MTk2LWExM2QtOTdlMjhjZTE5MTMxXkEyXkFqcGc@._V1_.jpg',
  '2025-03-07'::date,
  null,
  2025,
  2025,
  array['drama', 'history', 'romance']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Kim Won-seok',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'When Life Gives You Tangerines');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Last Week Tonight with John Oliver',
  'Former Daily Show host and correspondent John Oliver brings his persona to this weekly news satire program.',
  'https://m.media-amazon.com/images/M/MV5BZDM5YzVhYWYtMjUzMy00OTBhLThhYzAtNjEzN2IwMzk4ZWVlXkEyXkFqcGc@._V1_.jpg',
  '2014-04-27'::date,
  null,
  2014,
  null,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Last Week Tonight with John Oliver');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'TVF Pitchers',
  'A story of trials and tribulations of four young entrepreneurs who quit their day jobs in order to pursue their start up venture.',
  'https://m.media-amazon.com/images/M/MV5BZDYxYTQxM2MtMDkxYi00ZjgzLTg0ODEtMWEzZjYzZTM5OGRiXkEyXkFqcGc@._V1_.jpg',
  '2015-06-17'::date,
  null,
  2015,
  2022,
  array['comedy', 'drama']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Arunabh Kumar',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'TVF Pitchers');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Curb Your Enthusiasm',
  'Larry David stars as an over-the-top version of himself in this comedy series that shows how seemingly trivial details of day-to-day life can precipitate a catastrophic chain of events.',
  'https://m.media-amazon.com/images/M/MV5BZmFiZDY2ZDItZDliOC00Y2JhLTliMWYtODkzMTA0YmIwZDA3XkEyXkFqcGc@._V1_.jpg',
  '2000-10-15'::date,
  null,
  2000,
  2024,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Larry David',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Curb Your Enthusiasm');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'BoJack Horseman',
  'BoJack Horseman was the star of the hit television show "Horsin'' Around" in the ''80s and ''90s, but now he''s washed up, living in Hollywood, complaining about everything, and wearing colorful sweaters.',
  'https://m.media-amazon.com/images/M/MV5BZmMwMDlkNTEtMmQzZS00ODQ0LWJlZmItOTgwYWMwZGM4MzFiXkEyXkFqcGc@._V1_.jpg',
  '2014-08-22'::date,
  null,
  2014,
  2020,
  array['animation', 'comedy', 'drama']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Raphael Bob-Waksberg',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'BoJack Horseman');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Das Boot',
  'A World War II German U-Boat crew have a terrifying patrol mission in the early days of the war.',
  'https://m.media-amazon.com/images/M/MV5BZjkzZGM2MGMtN2NjNC00ZWIwLWE2NWItZTVlYmU2NDQ0MzczXkEyXkFqcGc@._V1_.jpg',
  '1986-01-05'::date,
  null,
  1985,
  1985,
  array['drama', 'war']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Das Boot');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Monty Python''s Flying Circus',
  'The original surreal sketch comedy showcase for the Monty Python troupe.',
  'https://m.media-amazon.com/images/M/MV5BZDkyZjUyOTUtYWI3Zi00YTJhLTk3MDMtY2Q2MGM1ZjFhNTRkXkEyXkFqcGc@._V1_.jpg',
  '2018-10-02'::date,
  null,
  1969,
  1974,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Monty Python''s Flying Circus');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Vinland Saga',
  'Following a tragedy, Thorfinn embarks on a journey with the man responsible for it to take his life in a duel as a true and honorable warrior.',
  'https://m.media-amazon.com/images/M/MV5BNDA3MGNmZTEtMzFiMy00ZmViLThhNmQtMjQ4ZDc5MDEyN2U1XkEyXkFqcGc@._V1_.jpg',
  '2019-07-06'::date,
  null,
  2019,
  2023,
  array['animation', 'action', 'adventure', 'drama', 'history']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Vinland Saga');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Panchayat',
  'A comedy-drama, which captures the journey of an engineering graduate Abhishek, who for lack of a better job option joins as secretary of a Panchayat office in a remote village of Uttar Pradesh.',
  'https://m.media-amazon.com/images/M/MV5BNjMwYWMxNjYtY2I2NC00OWE0LTg4MmQtMmI5ZGI2NzU4ODhiXkEyXkFqcGc@._V1_.jpg',
  '2020-03-05'::date,
  null,
  2020,
  null,
  array['comedy', 'drama']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Panchayat');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Fawlty Towers',
  'Hotel owner Basil Fawlty''s incompetence, short fuse, and arrogance form a combination that ensures accidents and trouble are never far away.',
  'https://m.media-amazon.com/images/M/MV5BODM5YWE5NDAtZTU4MC00YWI0LThjMjItNTlhMTQ5Y2Y5NWJiXkEyXkFqcGc@._V1_.jpg',
  '1975-09-19'::date,
  null,
  1975,
  1979,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Fawlty Towers');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dragon Ball Z',
  'With the help of the powerful Dragonballs, a team of fighters led by the saiyan warrior Goku defend the planet earth from extraterrestrial enemies.',
  'https://m.media-amazon.com/images/M/MV5BN2VlNTdlMzQtYzE5OC00YmYwLTgyZTItYjEzMWY0ZDNjMTJhXkEyXkFqcGc@._V1_.jpg',
  '1996-09-13'::date,
  null,
  1996,
  2003,
  array['animation', 'action', 'adventure', 'fantasy', 'sci-fi', 'thriller']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dragon Ball Z');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Gullak',
  'Set in quaint by-lanes in the heart of India, Gullak is a collection of disarming and relatable tales of the Mishra family.',
  'https://m.media-amazon.com/images/M/MV5BZGE3NTA0MDQtZmM3NC00ZmUwLWJmODktMWZkNTczN2JiYzA0XkEyXkFqcGc@._V1_.jpg',
  '2019-06-27'::date,
  null,
  2019,
  null,
  array['comedy', 'drama', 'family']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Shreyansh Pandey',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Gullak');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Blackadder Goes Forth',
  'Stuck in the middle of World War I, Captain Edmund Blackadder does his best to escape the banality of the war.',
  'https://m.media-amazon.com/images/M/MV5BM2ZiODg3ZWQtMzcyMC00MTRhLWI2MjItNjk5OTdlOTRiMGRiXkEyXkFqcGc@._V1_.jpg',
  '1989-09-28'::date,
  null,
  1989,
  1989,
  array['comedy', 'war']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Blackadder Goes Forth');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Leyla and Mecnun',
  'This unique, heartwarming show follows the extraordinary journey of a couple named Leyla (Ezgi Asaroglu) and Mecnun (Ali Atay). The series has garnered a massive fan base and critical acclaim.',
  'https://m.media-amazon.com/images/M/MV5BNzQ4ZTMxM2UtYTY2MS00NjlmLTlmNmYtYWFmMjMyMzZmZjZkXkEyXkFqcGc@._V1_.jpg',
  '2011-02-09'::date,
  null,
  2011,
  2023,
  array['adventure', 'comedy', 'drama', 'fantasy', 'mystery', 'romance']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Leyla and Mecnun');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dragon Ball Z',
  'The adventures of Earth''s martial arts defender, Son Goku, continue with a new family and the revelation of his alien origins. Now Goku and his allies must defend the planet from an onslaught of new extraterrestrial enemies.',
  'https://m.media-amazon.com/images/M/MV5BNmFiM2FkYTYtY2FiOS00ZWJkLTkyOTgtNmFmODI4NjcwNDgzXkEyXkFqcGc@._V1_.jpg',
  '1996-09-30'::date,
  null,
  1989,
  1996,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dragon Ball Z');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Chappelle''s Show',
  'Comedian Dave Chappelle hosts this sketch-comedy show that parodies many of the nuances of race and culture.',
  'https://m.media-amazon.com/images/M/MV5BNzgxYTFlMjYtMWM0MC00ZjQzLWJjMjUtNDZhNGE0Yzg2YmRjXkEyXkFqcGc@._V1_.jpg',
  '2003-01-22'::date,
  null,
  2003,
  2006,
  array['comedy', 'music']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Chappelle''s Show');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Pride and Prejudice',
  'While the arrival of wealthy gentlemen sends her marriage-minded mother into a frenzy, willful and opinionated Elizabeth Bennet matches wits with haughty Mr. Darcy.',
  'https://m.media-amazon.com/images/M/MV5BYzNkMjRmZGMtODg1Ni00MjIxLWI4MTYtOGEwM2YyMmZiMjUzXkEyXkFqcGc@._V1_.jpg',
  '1996-01-14'::date,
  null,
  1995,
  1995,
  array['drama', 'romance']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Pride and Prejudice');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Twin Peaks',
  'An idiosyncratic FBI agent investigates the murder of a young woman in the even more idiosyncratic town of Twin Peaks.',
  'https://m.media-amazon.com/images/M/MV5BMTExNzk2NjcxNTNeQTJeQWpwZ15BbWU4MDcxOTczOTIx._V1_.jpg',
  '1990-04-08'::date,
  null,
  1990,
  1991,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Reply 1988',
  'Five childhood friends, who all live in the same Ssangmundong neighborhood of Seoul in 1988, lean on each other to survive their challenging teen years and set a path for their futures.',
  'https://m.media-amazon.com/images/M/MV5BZDBiNDE1NzUtYmU0OS00YmUxLTljODUtOTczNDE3ZGQ0MmYzXkEyXkFqcGc@._V1_.jpg',
  '2015-11-05'::date,
  null,
  2015,
  2016,
  array['comedy', 'drama', 'family', 'romance']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Reply 1988');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'I, Claudius',
  'The personal and governmental affairs of the Julio-Claudian dynasty at the beginning of the Roman Empire, as recalled by one of its rulers.',
  'https://m.media-amazon.com/images/M/MV5BZmIwMjNkMzMtZDM0Ny00YjVkLTkzNDQtYWFiNmQxOTc3MDZmXkEyXkFqcGc@._V1_.jpg',
  '1977-11-06'::date,
  null,
  1976,
  1976,
  array['biography', 'drama', 'history']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'I, Claudius');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'South Park',
  'The misadventures of four foul-mouthed, dirty-minded, irreverent grade-schoolers who live in the quiet, dysfunctional mountain town of South Park, Colorado.',
  'https://m.media-amazon.com/images/M/MV5BNTBlMzA3ZTUtODZjNi00NTM0LWExMjMtNjJhYzA3YTkwMWYwXkEyXkFqcGc@._V1_.jpg',
  '1997-08-13'::date,
  null,
  1997,
  null,
  array['animation', 'comedy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'South Park');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Kota Factory',
  'In a city of coaching centers known to train India’s finest collegiate minds, an earnest but unexceptional student and his friends navigate campus life.',
  'https://m.media-amazon.com/images/M/MV5BY2U5MjY1NWEtZDI2MS00NTlhLWEyODQtYzE0MzY3NDUyNzE3XkEyXkFqcGc@._V1_.jpg',
  '2019-04-16'::date,
  null,
  2019,
  2021,
  array['comedy', 'drama']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Kota Factory');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Berserk',
  'Guts, a wandering mercenary, joins the Band of the Hawk after being defeated in a duel by Griffith, the group''s leader and founder. Together, they dominate every battle, but something menacing lurks in the shadows.',
  'https://m.media-amazon.com/images/M/MV5BMzEzMzhkNDgtY2Q0YS00MDk0LTg0YzItODY5ZjNjMDc4ODI3XkEyXkFqcGc@._V1_.jpg',
  '2002-05-28'::date,
  null,
  1997,
  1998,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'horror']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Kentaro Miura',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Berserk');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Steins; Gate',
  'After discovering time travel, a university student and his colleagues must use their knowledge of it to stop an evil organization and their diabolical plans.',
  'https://m.media-amazon.com/images/M/MV5BZjI1YjZiMDUtZTI3MC00YTA5LWIzMmMtZmQ0NTZiYWM4NTYwXkEyXkFqcGc@._V1_.jpg',
  '2011-04-06'::date,
  null,
  2011,
  2015,
  array['animation', 'comedy', 'drama', 'mystery', 'romance', 'sci-fi']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Steins; Gate');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Over the Garden Wall',
  'Two brothers find themselves lost in a mysterious land and try to find their way home.',
  'https://m.media-amazon.com/images/M/MV5BOTA2MTdhZmItODM3NS00ZmFlLWE4YWYtOWYxODBmNGU5YjRjXkEyXkFqcGc@._V1_.jpg',
  '2014-11-03'::date,
  null,
  2014,
  2014,
  array['animation', 'adventure', 'comedy', 'drama', 'family', 'fantasy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Over the Garden Wall');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'My Mister',
  'A man in his 40s withstands the weight of life. A woman in her 20s goes through different experiences, but also withstands the weight of her life. The man and woman get together to help each other.',
  'https://m.media-amazon.com/images/M/MV5BYmYxMzkxZDgtNjAxMC00OGFiLThiMjgtOTYyY2EyYWFhZTFkXkEyXkFqcGc@._V1_.jpg',
  '2020-11-03'::date,
  null,
  2018,
  2018,
  array['drama', 'family']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'My Mister');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Six Feet Under',
  'When death is your business, what is your life? Laced with irony and dark situational humor, the show approaches the subject of death through the eyes of the Fisher family, who owns and operates a funeral home in Los Angeles.',
  'https://m.media-amazon.com/images/M/MV5BY2Q0YTQ4NGItMDc2YS00M2VhLTg1ZmUtNDVkMWM1MWJlNjc0XkEyXkFqcGc@._V1_.jpg',
  '2001-06-03'::date,
  null,
  2001,
  2005,
  array['comedy', 'drama']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Alan Ball',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Six Feet Under');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Rome',
  'The lives of both illustrious and ordinary Romans in the last days of the Roman Republic.',
  'https://m.media-amazon.com/images/M/MV5BMGQ0M2YxMGEtMDQ2MC00NGEwLTliMTQtODVkYWZkNDFkM2Y3XkEyXkFqcGc@._V1_.jpg',
  '2005-08-28'::date,
  null,
  2005,
  2007,
  array['action', 'drama', 'romance', 'war']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Rome');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Oz',
  'Follows the daily activities of the Inmates at the Oswald Maximum Security Correctional Facility (aka "Oz" for short), an unusual prison where its criminal inhabitants face challenges head on behind bars and do all they can to stay alive.',
  'https://m.media-amazon.com/images/M/MV5BMjI1ZGJmMGYtYWE1YS00NDAyLThmNGItZWNjZmFiODkxZDUwXkEyXkFqcGc@._V1_.jpg',
  '1997-07-12'::date,
  null,
  1997,
  2003,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Tom Fontana',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Oz');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Monster',
  'Tenma, a brilliant neurosurgeon with a promising future, risks his career to save the life of a critically wounded young boy. The boy, now a charismatic young man, reappears 9 years later in the midst of a string of unusual serial murders.',
  'https://m.media-amazon.com/images/M/MV5BYzU2MWQ5NGQtYmNlMC00ZjJkLWJmODItZDM5MDM3YmUyMWJkXkEyXkFqcGc@._V1_.jpg',
  '2004-04-06'::date,
  null,
  2004,
  2005,
  array['animation', 'crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Naoki Urasawa',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Monster');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'X-Men ''97',
  'A band of mutants use their uncanny gifts to protect a world that hates and fears them; they''re challenged like never before, forced to face a dangerous and unexpected new future.',
  'https://m.media-amazon.com/images/M/MV5BYmU0MTRjNzgtMjNlZi00YWM2LWExZmItY2RkYjVhZjJmODEyXkEyXkFqcGc@._V1_.jpg',
  '2024-03-20'::date,
  null,
  2024,
  null,
  array['animation', 'action', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Beau DeMayo',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'X-Men ''97');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Naruto: Shippuden',
  'Naruto Uzumaki, is a loud, hyperactive, adolescent ninja who constantly searches for approval and recognition, as well as to become Hokage, who is acknowledged as the leader and strongest of all ninja in the village.',
  'https://m.media-amazon.com/images/M/MV5BNTk3MDA1ZjAtNTRhYS00YzNiLTgwOGEtYWRmYTQ3NjA0NTAwXkEyXkFqcGc@._V1_.jpg',
  '2009-10-28'::date,
  null,
  2007,
  2017,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Masashi Kishimoto',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Naruto: Shippuden');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Grand Tour',
  'Jeremy, Richard and James embark on an adventure across the globe, driving new and exciting automobiles from manufacturers all over the world.',
  'https://m.media-amazon.com/images/M/MV5BOGQ1M2Y4ZjMtNWRiNS00YTUzLTkxMzEtZjgzYmZjMGVlMzY5XkEyXkFqcGc@._V1_.jpg',
  '2016-11-18'::date,
  null,
  2016,
  null,
  array['adventure', 'comedy', 'sports']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Grand Tour');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Downton Abbey',
  'A chronicle of the lives of the British aristocratic Crawley family and their servants in the early twentieth century.',
  'https://m.media-amazon.com/images/M/MV5BYzgzNDVjNjgtNzQxZS00N2E2LTkxNjgtNjIzMGZiM2UwYWQ2XkEyXkFqcGc@._V1_.jpg',
  '2011-01-09'::date,
  null,
  2010,
  2015,
  array['drama', 'romance']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Julian Fellowes',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Downton Abbey');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Battlestar Galactica',
  'When an old enemy, the Cylons, resurface and obliterate the 12 colonies, the crew of the aged Galactica protect a small civilian fleet - the last of humanity - as they journey toward the fabled 13th colony, Earth.',
  'https://m.media-amazon.com/images/M/MV5BNmMzYzdmNWMtM2ZmMi00Y2E2LWI5ZTMtYWJlNmJiMDgyYWRiXkEyXkFqcGc@._V1_.jpg',
  '2005-01-14'::date,
  null,
  2004,
  2009,
  array['action', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Peep Show',
  'Mark and Jez are a couple of twenty-something roommates who have nothing in common - except for the fact that their lives are anything but normal. Mayhem ensues as the pair strive to cope with day-to-day life.',
  'https://m.media-amazon.com/images/M/MV5BNmQ0MGMwNjMtNmEyMC00OTA2LTg4YTEtNjBhNjNkYTgzMmZlXkEyXkFqcGc@._V1_.jpg',
  '2004-11-12'::date,
  null,
  2003,
  2015,
  array['comedy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Star Trek: The Next Generation',
  'Set almost 100 years after Captain Kirk''s five-year mission, a new generation of Starfleet officers sets off in the U.S.S. Enterprise-D on its own mission to go where no one has gone before.',
  'https://m.media-amazon.com/images/M/MV5BMmNiNTQ2YzYtODBjYy00ZWMwLTlmNWMtYWE1NTQ2ZTYyZmMwXkEyXkFqcGc@._V1_.jpg',
  '1987-09-28'::date,
  null,
  1987,
  1994,
  array['action', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Gene Roddenberry',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Star Trek: The Next Generation');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Still Game',
  'Cult Scottish comedy about the lives of two OAP''s Jack and Victor and their views on how it used to be in the old days and how bad it is now in the fictional area of Craiglang, Glasgow.',
  'https://m.media-amazon.com/images/M/MV5BNzlkNmM1YTAtZTVhNS00ODhlLTg2MGUtYTU3NDMxYWZiZjI2XkEyXkFqcGc@._V1_.jpg',
  '2015-11-01'::date,
  null,
  2002,
  2019,
  array['comedy']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Still Game');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Blue Eye Samurai',
  'Driven by a dream of revenge against those who made her an outcast in Edo-period Japan, a young warrior cuts a bloody path toward her destiny.',
  'https://m.media-amazon.com/images/M/MV5BY2E4ZGIwZWYtMGRiMS00NGI2LTgwYzAtZGY5NGVhNzY3Yjk0XkEyXkFqcGc@._V1_.jpg',
  '2023-11-03'::date,
  null,
  2023,
  null,
  array['animation', 'action', 'adventure', 'drama', 'history', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Blue Eye Samurai');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Simpsons',
  'The satiric half-hour adventures of a working-class family in the misfit city of Springfield.',
  'https://m.media-amazon.com/images/M/MV5BNTU2OWE0YWYtMjRlMS00NTUwLWJmZWUtODFhNzJiMGJlMzI3XkEyXkFqcGc@._V1_.jpg',
  '1989-12-17'::date,
  null,
  1989,
  null,
  array['animation', 'comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Simpsons');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mahabharat',
  'When a dynastic struggle between the collateral branches of the Kuru clan, the Kauravas and Pandavas lead them to the threshold of war, Lord Krishna decides to step in and take control of the situation.',
  'https://m.media-amazon.com/images/M/MV5BYzZiY2QyNTMtNTMzMi00ODZkLWEwNWItYmJiM2MyNWJmY2Q5XkEyXkFqcGc@._V1_.jpg',
  '1988-10-02'::date,
  null,
  1988,
  1990,
  array['action', 'adventure', 'drama', 'fantasy', 'history', 'musical']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mahabharat');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Justice League Unlimited',
  'A continuation of the Justice League animated series finds the original members of the team joined in their battle against crime and evil by dozens of other heroes from the DC comics universe.',
  'https://m.media-amazon.com/images/M/MV5BYjBmYjE5ZmMtYTdlMi00MDgyLThlNjUtZDUzMGMzYWZkMWRjXkEyXkFqcGc@._V1_.jpg',
  '2004-07-31'::date,
  null,
  2004,
  2006,
  array['animation', 'action', 'adventure', 'family', 'fantasy', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Jack Kirby',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Justice League Unlimited');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Adventures of Sherlock Holmes',
  'Sherlock Holmes and Dr Watson solve the mysteries of copper beeches, a Greek interpreter, the Norwood builder, a resident patient, the red-headed league, and one final problem.',
  'https://m.media-amazon.com/images/M/MV5BNjg3NjY5NGUtZTlkNS00NGE2LWJhMTAtZTlkZDgzZDBhOWY1XkEyXkFqcGc@._V1_.jpg',
  '1985-03-14'::date,
  null,
  1984,
  1985,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'John Hawkesworth',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Adventures of Sherlock Holmes');

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
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Top Gear',
  'The hosts talk about everything car-related. From new cars to how they''re fueled, this show has it all.',
  'https://m.media-amazon.com/images/M/MV5BNTJlYmZjNDAtYjA2YS00YjAyLWI4NmYtYjFhNmM5MDEyMWJmXkEyXkFqcGc@._V1_.jpg',
  '2002-10-20'::date,
  null,
  2002,
  2022,
  array['adventure', 'comedy', 'sports']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Top Gear');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Friday Night Lights',
  'A drama that follows the lives of the Dillon Panthers, one of the nation''s best high school football teams, and their head coach Eric Taylor.',
  'https://m.media-amazon.com/images/M/MV5BNzMxNzQwODItNDFiYy00YjFhLWJjMzUtYjc0Nzk5ZTI4ODA1XkEyXkFqcGc@._V1_.jpg',
  '2006-10-03'::date,
  null,
  2006,
  2011,
  array['drama', 'sports']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Peter Berg',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Friday Night Lights');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Arrested Development',
  'Level-headed son Michael Bluth takes over family affairs after his father is imprisoned. But the rest of his spoiled, dysfunctional family are making his job unbearable.',
  'https://m.media-amazon.com/images/M/MV5BMzA1NzBiMzUtZTA1Zi00YTVjLTkxZWYtZTIyYzFhMzVjZmQ1XkEyXkFqcGc@._V1_.jpg',
  '2003-11-02'::date,
  null,
  2003,
  2019,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Mitchell Hurwitz',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Arrested Development');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Code Geass: Lelouch of the Rebellion',
  'After being given a mysterious power to control others, an outcast prince becomes the masked leader of the rebellion against an all-powerful empire.',
  'https://m.media-amazon.com/images/M/MV5BNTk4MWYwNmUtODFjNC00NWJhLWExNGYtMGU4YmRlNzEwOTY1XkEyXkFqcGc@._V1_.jpg',
  '2008-01-01'::date,
  null,
  2006,
  2008,
  array['animation', 'action', 'drama', 'fantasy', 'sci-fi', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Code Geass: Lelouch of the Rebellion');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Ramayan',
  'An adaptation of the ancient epic in which the exiled Prince Rama and his brother Laxman set out to save Rama''s wife, Sita, who has been kidnapped by the demon king of Lanka Ravana.',
  'https://m.media-amazon.com/images/M/MV5BN2ZhOGFhNDgtZDdiNy00OTM1LTkwYzctN2ZlYTY5MDJlMTFmXkEyXkFqcGc@._V1_.jpg',
  '1987-01-25'::date,
  null,
  1987,
  1988,
  array['adventure', 'drama', 'family', 'fantasy', 'musical', 'war']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Ramanand Sagar',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Ramayan');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Marvelous Mrs. Maisel',
  'After her husband leaves her, young mother of two Miriam "Midge" Maisel discovers that she has a talent for stand-up comedy. Could this be her calling?',
  'https://m.media-amazon.com/images/M/MV5BZjM3MmFjMzYtMGNiYi00MDZmLTlkM2MtNzI3MDg1MzUwYWY2XkEyXkFqcGc@._V1_.jpg',
  '2017-03-17'::date,
  null,
  2017,
  2023,
  array['comedy', 'drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Amy Sherman-Palladino',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Marvelous Mrs. Maisel');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'How to with John Wilson',
  'An anxious New Yorker attempts to give everyday advice while dealing with his own personal issues.',
  'https://m.media-amazon.com/images/M/MV5BYTQwMTMyODYtNzkwOC00MmM0LTkyNGItNDAxYjE0Yjc1NjhhXkEyXkFqcGc@._V1_.jpg',
  '2020-10-23'::date,
  null,
  2020,
  2023,
  array['documentary', 'comedy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'How to with John Wilson');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Fighting Spirit',
  'Ippo, a teenage boy with a pure heart and unrelenting determination, discovers a passion for boxing after veteran fighter Takamura saves him from bullies.',
  'https://m.media-amazon.com/images/M/MV5BN2UzMmM5NTQtYjUxYy00OWVjLTkwOWMtYzFhOGQxN2VlZjI5XkEyXkFqcGc@._V1_.jpg',
  '2000-10-04'::date,
  null,
  2000,
  2002,
  array['animation', 'action', 'comedy', 'sports']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Fighting Spirit');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Behzat Ç: An Ankara Detective Story',
  'An inharmonious police team in Ankara Police Force and its discredited police chief fight crime.',
  'https://m.media-amazon.com/images/M/MV5BZmMyM2Q3YWMtMmE4NS00ODczLWIwYjctN2MzZThiZWEyMTcyXkEyXkFqcGc@._V1_.jpg',
  '2010-09-19'::date,
  null,
  2010,
  2019,
  array['comedy', 'crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Behzat Ç: An Ankara Detective Story');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'This Is Us',
  'A heartwarming and emotional story about a unique set of triplets, their struggles, and their wonderful parents.',
  'https://m.media-amazon.com/images/M/MV5BNzk4YzY2ZjUtNTQ2YS00MWQ5LTgzZjctZTRlMmZlMzNjNDc3XkEyXkFqcGc@._V1_.jpg',
  '2016-09-20'::date,
  null,
  2016,
  2022,
  array['comedy', 'drama', 'romance']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Dan Fogelman',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'This Is Us');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Thick of It',
  'The Minister for Social Affairs is continually harassed by Number 10''s policy enforcer and dependent on his not-so-reliable team of civil servants.',
  'https://m.media-amazon.com/images/M/MV5BNTQ0NTdjZTctZWRhMS00YjNmLWIyOWQtMWJjNjJhYTgyOTdjXkEyXkFqcGc@._V1_.jpg',
  '2005-05-19'::date,
  null,
  2005,
  2012,
  array['comedy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Armando Iannucci',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Thick of It');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mr Inbetween',
  'Ray Shoesmith is a father, ex-husband, boyfriend, brother and best friend; tough roles to juggle in the modern age. Especially, when you''re also a criminal for hire.',
  'https://m.media-amazon.com/images/M/MV5BMmI3MmFiODctNzhkZi00ZWVmLWJjYTctYzMyMmIxNGE1ZGZhXkEyXkFqcGc@._V1_.jpg',
  '2018-09-25'::date,
  null,
  2018,
  2021,
  array['comedy', 'crime', 'drama']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Scott Ryan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mr Inbetween');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Adventure Time',
  'A 12-year-old boy and his best friend, a wise 28-year-old dog with magical powers, go on a series of surreal adventures in a remote future.',
  'https://m.media-amazon.com/images/M/MV5BMjkxMzIwNmQtMzM5Ni00YWJiLTg4YjQtNjBiN2IxMjZhMGQ2XkEyXkFqcGc@._V1_.jpg',
  '2010-04-05'::date,
  null,
  2010,
  2018,
  array['animation', 'action', 'adventure', 'comedy', 'family', 'fantasy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Pendleton Ward',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Adventure Time');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Aspirants',
  'It is the story of the journey of three UPSC (public service competitive exams in India) aspirants and their friendship against all odds.',
  'https://m.media-amazon.com/images/M/MV5BNjQ4NjFlMDMtMjczZC00YmU5LWI0YjgtMzU0YTkwNGIwNjNkXkEyXkFqcGc@._V1_.jpg',
  '2021-04-07'::date,
  null,
  2021,
  null,
  array['drama']::text[],
  'classic',
  9.1::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Aspirants');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Father Ted',
  'Three misfit priests and their housekeeper live on Craggy Island, not the peaceful and quiet part of Ireland that it seems to be.',
  'https://m.media-amazon.com/images/M/MV5BN2NmMzNkZDAtYzEyMy00NzY2LTlhMmMtNzc2M2M5ZTk2MmY2XkEyXkFqcGc@._V1_.jpg',
  '1995-04-21'::date,
  null,
  1995,
  1998,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Father Ted');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The X-Files',
  'FBI Special Agents Fox Mulder and Dana Scully investigate unsolved unexplained cases known as X-Files.',
  'https://m.media-amazon.com/images/M/MV5BNzg3ODVhZWEtYmI0MC00NDQ0LWEyNGYtM2M0MTRhZTZmMjU3XkEyXkFqcGc@._V1_.jpg',
  '1993-09-10'::date,
  null,
  1993,
  2018,
  array['adventure', 'crime', 'drama', 'mystery', 'sci-fi', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Chris Carter',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The X-Files');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Parks and Recreation',
  'The absurd antics of an Indiana town''s public officials as they pursue sundry projects to make their city a better place.',
  'https://m.media-amazon.com/images/M/MV5BNDlhMzAwNTAtNTk2NS00MTdkLWE3ZWYtMDU0MTFiYmU2ZTc0XkEyXkFqcGc@._V1_.jpg',
  '2009-04-09'::date,
  null,
  2009,
  2015,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Parks and Recreation');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  '1883',
  'The post-Civil war generation of the Dutton family travels to Texas, and joins a wagon train undertaking the arduous journey west to Oregon, before settling in Montana to establish what would eventually become the Yellowstone Ranch.',
  'https://m.media-amazon.com/images/M/MV5BMDBjZDQyMWMtZmI0My00MzJlLWFhMTMtNWZmOTJkNzFlZTliXkEyXkFqcGc@._V1_.jpg',
  '2021-12-19'::date,
  null,
  2021,
  2022,
  array['drama', 'western']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Taylor Sheridan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = '1883');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Poirot',
  'Hercule Poirot, a famous Belgian detective, who has an impeccable knack for getting embroiled in a mystery, solves crimes along with Captain Hastings and Scotland Yard Chief Inspector James Japp.',
  'https://m.media-amazon.com/images/M/MV5BMTQyMTA3ZWEtYTUwMy00MzI0LWFmM2YtMzhjMWEwMDAwYTc3XkEyXkFqcGc@._V1_.jpg',
  '1990-01-18'::date,
  null,
  1989,
  2013,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Poirot');

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
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Sarabhai V/S Sarabhai',
  'Revolves around the lives of the members of an Uber Wealthy - High Society Gujarati family of Cuffe Parade - South Mumbai, whose daughter-in-law is from a middle class Delhi background.',
  'https://m.media-amazon.com/images/M/MV5BYzQ5OWMxM2YtZDVkNS00Y2E4LWJmOTItYmMwNTM0Nzk4NTczXkEyXkFqcGc@._V1_.jpg',
  '2004-11-08'::date,
  null,
  2004,
  2017,
  array['comedy']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Sarabhai V/S Sarabhai');

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
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'The Crown',
  'Follows the political rivalries and romances of Queen Elizabeth II''s reign and the events that shaped Britain for the second half of the 20th century.',
  'https://m.media-amazon.com/images/M/MV5BODcyODZlZDMtZGE0Ni00NjBhLWJlYTAtZDdlNWY3MzkwMGVhXkEyXkFqcGc@._V1_.jpg',
  '2016-11-04'::date,
  null,
  2016,
  2023,
  array['biography', 'drama', 'history']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Peter Morgan',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Crown');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Daredevil',
  'A blind lawyer by day, vigilante by night. Matt Murdock fights the crime of New York as Daredevil.',
  'https://m.media-amazon.com/images/M/MV5BODcwOTg2MDE3NF5BMl5BanBnXkFtZTgwNTUyNTY1NjM@._V1_.jpg',
  '2015-04-10'::date,
  null,
  2015,
  2018,
  array['action', 'crime', 'drama', 'sci-fi', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Drew Goddard',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Daredevil');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Bridge',
  'When a body is found on the bridge between Denmark and Sweden, right on the border, Danish inspector Martin Rohde and Swedish Saga Norén have to share jurisdiction and work together to find the killer.',
  'https://m.media-amazon.com/images/M/MV5BMjQ3MDAzNDU4NV5BMl5BanBnXkFtZTgwNjE2NDQ0NzE@._V1_.jpg',
  '2011-09-21'::date,
  null,
  2011,
  2018,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Bridge');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'House of Cards',
  'A Congressman works with his equally conniving wife to exact revenge on the people who betrayed him.',
  'https://m.media-amazon.com/images/M/MV5BMTQ4MDczNDYwNV5BMl5BanBnXkFtZTcwNjMwMDk5OA@@._V1_.jpg',
  '2013-02-01'::date,
  null,
  2013,
  2018,
  array['drama', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Beau Willimon',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'House of Cards');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'It''s a Sin',
  'It is 1981 and Ritchie, Roscoe and Colin begin a new life in London. Strangers at first, these lads and Jill find themselves thrown together. But a new virus is on the rise, and soon their lives will be tested in ways they never imagined.',
  'https://m.media-amazon.com/images/M/MV5BMzI4NThmYTQtY2E2Ni00NjI0LThmYzQtNmZlMmI1NzY2OWQ0XkEyXkFqcGc@._V1_.jpg',
  '2021-02-18'::date,
  null,
  2021,
  2021,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Russell T. Davies',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'It''s a Sin');

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
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Mr. Bean',
  'Bumbling, childlike Mr. Bean has trouble completing the simplest of day-to-day tasks, but his perseverance and resourcefulness frequently allow him to find ingenious ways around problems.',
  'https://m.media-amazon.com/images/M/MV5BZmY2OGQ4MTAtYTRkMy00NmYxLThlZTktOGE1NTRmNDVlZmI4XkEyXkFqcGc@._V1_.jpg',
  '1992-04-02'::date,
  null,
  1990,
  1995,
  array['comedy', 'family']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mr. Bean');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Lonesome Dove',
  'Two former Texas Rangers renew their spirit of adventure as they and several other residents of a small Texas town join a cattle drive to the Montana Territory.',
  'https://m.media-amazon.com/images/M/MV5BYjUzNmFiZTAtYzA4ZC00ZGUyLWI3NGMtMTBlMGEzYTM4NDljXkEyXkFqcGc@._V1_.jpg',
  '1989-02-05'::date,
  null,
  1989,
  1989,
  array['adventure', 'drama', 'western']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Lonesome Dove');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Farouk Omar',
  'The life of Umar Ibn Al-Khattab, the second Caliph of Rashidun Caliphate, before and after he embraces in Islam.',
  'https://m.media-amazon.com/images/M/MV5BOWUxN2ZjZWYtYjViZC00ZmVlLTg4NDItNjY1OTAzODFkNDgzXkEyXkFqcGc@._V1_.jpg',
  '2012-07-20'::date,
  null,
  2012,
  2012,
  array['biography', 'drama', 'history', 'war']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Farouk Omar');

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
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Primal',
  'A caveman and a dinosaur bond over unfortunate tragedies and become each other''s only hope of survival in a treacherous world.',
  'https://m.media-amazon.com/images/M/MV5BOTc0NTUyYmItOTY4Yi00ZjY5LWI1NjMtNDgyODJhYWRiY2UxXkEyXkFqcGc@._V1_.jpg',
  '2019-10-07'::date,
  null,
  2019,
  null,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'horror']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Genndy Tartakovsky',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Primal');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Blackadder II',
  'In the Tudor court of Elizabeth I, Lord Edmund Blackadder strives to win Her Majesty''s favour while attempting to avoid a grisly fate should he offend her.',
  'https://m.media-amazon.com/images/M/MV5BZmIyYmYwZDUtYmRiNi00ZmQ5LTliMDctZGE2ZjE0MWRlYzE4XkEyXkFqcGc@._V1_.jpg',
  '1986-01-09'::date,
  null,
  1986,
  1986,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Blackadder II');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Haikyuu!!',
  'Determined to be like the volleyball championship''s star player nicknamed "the small giant", Shoyo joins his school''s volleyball club.',
  'https://m.media-amazon.com/images/M/MV5BYjYxMWFlYTAtYTk0YS00NTMxLWJjNTQtM2E0NjdhYTRhNzE4XkEyXkFqcGc@._V1_.jpg',
  '2014-04-05'::date,
  null,
  2014,
  2020,
  array['animation', 'comedy', 'drama', 'sports']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Haruichi Furudate',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Haikyuu!!');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'One Punch Man',
  'The story of Saitama, a hero that does it just for fun & can defeat his enemies with a single punch.',
  'https://m.media-amazon.com/images/M/MV5BNzMwOGQ5MWItNzE3My00ZDYyLTk4NzAtZWIyYWI0NTZhYzY0XkEyXkFqcGc@._V1_.jpg',
  '2015-10-05'::date,
  null,
  2015,
  null,
  array['animation', 'action', 'comedy', 'fantasy', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Yusuke Murata',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'One Punch Man');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Sapne Vs Everyone',
  'Two obsessive dreamers collide with the resistance of expectations, morality and each other.',
  'https://m.media-amazon.com/images/M/MV5BOTAyNzJkMDYtNGI4ZS00OGI4LTlkNTItZTQ5ZDVmYzAwN2JlXkEyXkFqcGc@._V1_.jpg',
  '2025-05-01'::date,
  null,
  2023,
  null,
  array['drama']::text[],
  'classic',
  9.2::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Sapne Vs Everyone');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Crash Landing on You',
  'The absolute top secret love story of a chaebol heiress who made an emergency landing in North Korea because of a paragliding accident and a North Korean special officer who falls in love with her and who is hiding and protecting her.',
  'https://m.media-amazon.com/images/M/MV5BZjM3ZGQ4ZTMtOTNjMS00NmJlLTljMWUtNWExMzJhMGJlMWNiXkEyXkFqcGc@._V1_.jpg',
  '2019-12-14'::date,
  null,
  2019,
  2020,
  array['adventure', 'comedy', 'drama', 'romance']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Crash Landing on You');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Bureau',
  'A very unique and captivating series about the "bureau des légendes", the mythical powerhouse within the French Secret Service and its dare devil ghost agents.',
  'https://m.media-amazon.com/images/M/MV5BZDk2NDA3MzktNTQyOS00YjY0LWI2ZDgtMWI2MTQ5N2Q1Njg0XkEyXkFqcGc@._V1_.jpg',
  '2016-12-14'::date,
  null,
  2015,
  2020,
  array['drama', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Eric Rochant',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Bureau');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Shōgun',
  'When a mysterious European ship is found marooned in a nearby Japanese fishing village, Lord Yoshii Toranaga discovers secrets that could tip the scales of power and devastate his enemies.',
  'https://m.media-amazon.com/images/M/MV5BZmJkMDRjYzEtMWI3Ny00OWE3LWJlNTItMGQ1MTQzMzc3NDY5XkEyXkFqcGc@._V1_.jpg',
  '2024-02-27'::date,
  null,
  2024,
  2026,
  array['action', 'adventure', 'drama', 'history', 'war']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Shōgun');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Offer',
  'Oscar-winning producer Albert S. Ruddy''s never-before-revealed experiences of making The Godfather (1972).',
  'https://m.media-amazon.com/images/M/MV5BZTM2OWE3NGYtNDIyZi00NGJiLTgwMTQtZGFiNjIwMzBkY2UwXkEyXkFqcGc@._V1_.jpg',
  '2022-04-28'::date,
  null,
  2022,
  2022,
  array['biography', 'crime', 'drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Offer');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Yes Minister',
  'The Right Honorable James Hacker has landed the plum job of Cabinet Minister to the Department of Administration. At last he is in a position of power and can carry out some long-needed reforms, or so he thinks.',
  'https://m.media-amazon.com/images/M/MV5BY2FkYTVmMjMtN2IyMS00YTI2LTgzYTItOTFhYmI3M2Y0ODUxXkEyXkFqcGc@._V1_.jpg',
  '1980-02-25'::date,
  null,
  1980,
  1984,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Yes Minister');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Andor',
  'In an era filled with danger, deception, and intrigue, Cassian Andor embarks on a path that is destined to turn him into a Rebel hero.',
  'https://m.media-amazon.com/images/M/MV5BNGI2MTJjMjUtMTJhOC00YTY2LTg1NjUtMTdmMjg4YTk2YjM5XkEyXkFqcGc@._V1_.jpg',
  '2022-09-21'::date,
  null,
  2022,
  2025,
  array['adventure', 'drama', 'fantasy', 'sci-fi', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Tony Gilroy',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Andor');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Return of Sherlock Holmes',
  'Sherlock Holmes and Dr Watson solve the mysteries of the devil''s foot, Silver Blaze, Wisteria Lodge and the Bruce-Partington Plans.',
  'https://m.media-amazon.com/images/M/MV5BODM1NTgxOTMtM2VmZi00M2FkLWJiYWUtMjc5Yjk1MzY5ZTYxXkEyXkFqcGc@._V1_.jpg',
  '1987-02-05'::date,
  null,
  1986,
  1988,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'John Hawkesworth',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Return of Sherlock Holmes');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'El Chavo',
  'The misadventures of a poor, homeless, fumbling boy and his friends in their humble neighborhood.',
  'https://m.media-amazon.com/images/M/MV5BNmRkZmIxMmYtMjY5Ny00MzA3LWI1MmYtZDg3MjBhZDFlZTY5XkEyXkFqcGc@._V1_.jpg',
  '1973-04-27'::date,
  null,
  1972,
  1983,
  array['comedy', 'family']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Roberto Gómez Bolaños',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'El Chavo');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Pose',
  'In the New York of the late ''80s and early ''90s, this is a story of ball culture and the gay and trans community, the raging AIDS crisis, and capitalism.',
  'https://m.media-amazon.com/images/M/MV5BNmU5MDAzNmMtOTEyZS00YjRlLThiMjMtM2ViMGEyODM0MjhiXkEyXkFqcGc@._V1_.jpg',
  '2018-06-03'::date,
  null,
  2018,
  2021,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Pose');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Gomorrah',
  'Ciro disregards tradition in his attempt to become the next boss of his crime syndicate. The internal power struggle puts him and his entire family''s life at risk.',
  'https://m.media-amazon.com/images/M/MV5BYWUwYmYwNmItMTRiMy00ZDBhLWE3OTUtMDdmYjA1Mzc2M2IwXkEyXkFqcGc@._V1_.jpg',
  '2016-08-24'::date,
  null,
  2014,
  2021,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Gomorrah');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Greatest Events of WWII in Colour',
  'A series of colorized archive footage of important events during World War II.',
  'https://m.media-amazon.com/images/M/MV5BY2NmYjgzZTItNzllZC00YWFiLWEzOTAtNWMyNzhhMDdjOWQ2XkEyXkFqcGc@._V1_.jpg',
  '2019-11-08'::date,
  null,
  2019,
  2019,
  array['documentary', 'history', 'war']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Greatest Events of WWII in Colour');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Jinx: The Life and Deaths of Robert Durst',
  'Filmmaker Andrew Jarecki examines the complicated life of reclusive real estate icon Robert Durst, the key suspect in a series of unsolved crimes.',
  'https://m.media-amazon.com/images/M/MV5BYTVhZGNkNDMtNWEwMi00ODgxLTg2NTItN2UxOWFjYzNlZjUwXkEyXkFqcGc@._V1_.jpg',
  '2015-02-08'::date,
  null,
  2015,
  2024,
  array['documentary', 'biography', 'crime', 'mystery']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Jinx: The Life and Deaths of Robert Durst');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Heated Rivalry',
  'Two rival hockey stars at the top of their game face an unexpected challenge when they develop feelings for each other, complicating their careers and the sport''s expectations.',
  'https://m.media-amazon.com/images/M/MV5BYzYwNTk5ODYtOGVmYS00Zjc4LTk5ZDYtMTM4ODQyN2Q0MTVkXkEyXkFqcGc@._V1_.jpg',
  '2025-11-28'::date,
  null,
  2025,
  null,
  array['drama', 'romance', 'sports']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Heated Rivalry');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Blackadder the Third',
  'In the Regency era, Mr E. Blackadder serves as butler to the foppish numskull Prince George amidst the fads and crazes of the time.',
  'https://m.media-amazon.com/images/M/MV5BODZlNWM4OWEtMmUyNS00YjY5LWI3YmEtZDNkZTdlNDY5Zjc3XkEyXkFqcGc@._V1_.jpg',
  '1987-09-17'::date,
  null,
  1987,
  1987,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Blackadder the Third');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Penguin',
  'Following the events of The Batman (2022), Oz Cobb, a.k.a. the Penguin, makes a play to seize the reins of the crime world in Gotham.',
  'https://m.media-amazon.com/images/M/MV5BYmU3MzYzOWEtOTdkZi00YzA1LTliMzQtNDdiZDBjY2FiNmFlXkEyXkFqcGc@._V1_.jpg',
  '2024-09-19'::date,
  null,
  2024,
  2024,
  array['crime', 'drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Lauren LeFranc',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Penguin');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Newsroom',
  'A newsroom undergoes some changes in its workings and morals as a new team is brought in, bringing unexpected results for its existing news anchor.',
  'https://m.media-amazon.com/images/M/MV5BNzk4ZjllMjktY2MyMy00N2M3LWFhYjYtM2FkY2YxMzkyNzgyXkEyXkFqcGc@._V1_.jpg',
  '2012-06-24'::date,
  null,
  2012,
  2014,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Aaron Sorkin',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Newsroom');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Anne with an E',
  'The adventures of a young orphan girl living in late-19th-century Canada. Follow Anne as she learns to navigate her new life on Prince Edward Island in this new take on L.M. Montgomery''s classic novels.',
  'https://m.media-amazon.com/images/M/MV5BZWUzZGM1OTYtMWUyNS00NTBmLTg1YTMtOTllMWFmYjk2NGU2XkEyXkFqcGc@._V1_.jpg',
  '2017-05-12'::date,
  null,
  2017,
  2019,
  array['drama', 'family']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Moira Walley-Beckett',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Anne with an E');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Homicide: Life on the Street',
  'An American police procedural television series chronicling the work of a fictional version of the Baltimore Police Department''s Homicide Unit.',
  'https://m.media-amazon.com/images/M/MV5BYmE0NjVhM2ItZTMzNi00M2QxLWEzZjctYzcxMTU2Y2QzMmEyXkEyXkFqcGc@._V1_.jpg',
  '1993-01-31'::date,
  null,
  1993,
  1999,
  array['crime', 'drama', 'mystery', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Paul Attanasio',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Homicide: Life on the Street');

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
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Critical Role',
  'A live weekly show in which a band of professional voice actors improvise, role-play, and roll their way through an epic Dungeons and Dragons campaign.',
  'https://m.media-amazon.com/images/M/MV5BMzYyNWM1MTItMTI5YS00Njg3LWE4MjItNmYwM2VkOTRkNjgzXkEyXkFqcGc@._V1_.jpg',
  '2015-03-12'::date,
  null,
  2015,
  null,
  array['adventure', 'fantasy']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Critical Role',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Critical Role');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Archer',
  'Suave, confident and devastatingly handsome Sterling Archer, the world''s greatest spy, and his misguided cohorts navigate the spy world.',
  'https://m.media-amazon.com/images/M/MV5BMTg3NTMwMzY2OF5BMl5BanBnXkFtZTgwMDcxMjQ0NDE@._V1_.jpg',
  '2009-09-17'::date,
  null,
  2009,
  2023,
  array['animation', 'action', 'comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Adam Reed',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Archer');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dopesick',
  'The series takes viewers to the epicenter of America''s struggle with opioid addiction, from the boardrooms of Purdue Pharma, to a distressed Virginia mining community, to the hallways of the DEA.',
  'https://m.media-amazon.com/images/M/MV5BYmM0ZGFkZTctZjg2Ny00YmFhLThhNmItZjRjODk4ZGJhNWY3XkEyXkFqcGc@._V1_.jpg',
  '2021-10-13'::date,
  null,
  2021,
  2021,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Danny Strong',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dopesick');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Scavengers Reign',
  'The crew of a damaged deep space freighter are stranded on a beautiful but dangerous planet.',
  'https://m.media-amazon.com/images/M/MV5BZmEyOWU1YjctNjgxNS00MTcyLTk3NDgtZmY3ZjBkY2RkN2YxXkEyXkFqcGc@._V1_.jpg',
  '2023-10-19'::date,
  null,
  2023,
  2023,
  array['animation', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Scavengers Reign');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mystery Science Theater 3000',
  'In the not-too-distant future Joel Robinson is held captive by Dr. Forrester and TV''s Frank, forced to watch B-Grade movies on the Satellite of Love with the help of his robot friends: Cambot, Gypsy, Tom Servo and Crow T. Robot.',
  'https://m.media-amazon.com/images/M/MV5BNDA1MjM1Y2ItNjJjZi00ZjFkLWI5MjMtYWM3ODIwZDI5M2IzXkEyXkFqcGc@._V1_.jpg',
  '1988-05-10'::date,
  null,
  1988,
  1999,
  array['comedy', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Joel Hodgson',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mystery Science Theater 3000');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Yeh Meri Family',
  'Through the lens of a 90s kid, we witness a family navigate through the ups and downs of life during this magical and nostalgic era.',
  'https://m.media-amazon.com/images/M/MV5BNGE2M2U0NTUtNDc2MC00MThmLWI2NzctMGY2MjlmZmRmMDFhXkEyXkFqcGc@._V1_.jpg',
  '2018-07-12'::date,
  null,
  2018,
  null,
  array['comedy', 'drama', 'family', 'musical', 'romance']::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Sameer Saxena',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Yeh Meri Family');

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
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'The Bugs Bunny Show',
  'TV series featuring the classic Looney Tunes animated shorts.',
  'https://m.media-amazon.com/images/M/MV5BODhlYjI1OGQtZDQyYS00OWJmLTg3ZGEtMTkwMWFjYmNkYjY4XkEyXkFqcGc@._V1_.jpg',
  '1960-10-11'::date,
  null,
  1960,
  1975,
  array['animation', 'comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Bugs Bunny Show');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'QI',
  'A comedy panel game in which being Quite Interesting is more important than being right. Sandi Toksvig is joined each week by four comedians to share anecdotes and trivia, and maybe answer some questions as well.',
  'https://m.media-amazon.com/images/M/MV5BOWQ4ZDNkOTEtYzZjMS00NDQ1LTljYWEtZTk3NGMxZDQ3ZTE3XkEyXkFqcGc@._V1_.jpg',
  '2003-09-11'::date,
  null,
  2003,
  null,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'QI');

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
  2003,
  2003,
  array['action', 'adventure', 'drama', 'sci-fi']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Endeavour',
  'Set from 1965 into the 1970s, the show follows Endeavour Morse in his early years as a police constable. Working alongside his senior partner DI Fred Thursday, Morse engages in a number of investigations around Oxford.',
  'https://m.media-amazon.com/images/M/MV5BOTdhYzQyMzItNTk0YS00MWNmLWFlMDctZGU0NGEzYTVlZTgzXkEyXkFqcGc@._V1_.jpg',
  '2012-07-01'::date,
  null,
  2012,
  2023,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Endeavour');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Venture Bros.',
  'The bizarre escapades of pseudo-heroic scientist Dr. Rusty Venture, his competent, high-strung bodyguard, and his two overenthusiastic sons.',
  'https://m.media-amazon.com/images/M/MV5BMGU0OTU4MjYtMmRjMi00ODIwLTgwOWQtMTE4ZTg3YzJkYmQ3XkEyXkFqcGc@._V1_.jpg',
  '2003-02-16'::date,
  null,
  2003,
  2018,
  array['animation', 'action', 'adventure', 'comedy', 'fantasy', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Christopher McCulloch',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Venture Bros.');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dragon Ball',
  'A young martial artist named Goku teams up with inventor Bulma and other quirky allies on a globe-trotting quest to find the seven Dragon Balls, mystical orbs that can summon a wish-granting dragon.',
  'https://m.media-amazon.com/images/M/MV5BMGQ0ZWE4NDYtYWY0Mi00MjE0LWI1MzctZDA1NGExYzE3N2FiXkEyXkFqcGc@._V1_.jpg',
  '1986-02-26'::date,
  null,
  1986,
  1989,
  array['animation', 'action', 'adventure', 'comedy', 'fantasy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dragon Ball');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Justice League',
  'Seven of the most formidable heroes form arguably the most powerful team ever.',
  'https://m.media-amazon.com/images/M/MV5BNGY0MmU0YWUtZmNjZC00NjUyLTliMjktNDA2ZjIzZWEwNmZiXkEyXkFqcGc@._V1_.jpg',
  '2001-11-17'::date,
  null,
  2001,
  2004,
  array['animation', 'action', 'adventure', 'family', 'fantasy', 'mystery']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Justice League');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Yes, Prime Minister',
  'James Hacker was propelled along the corridors of power to the very pinnacle of politics - Number 10.',
  'https://m.media-amazon.com/images/M/MV5BZGM4MzJjYzAtNjE4Ni00MTkwLTljZTEtMzY1MWU0N2M1YThjXkEyXkFqcGc@._V1_.jpg',
  '1986-01-09'::date,
  null,
  1986,
  1987,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Yes, Prime Minister');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Young Justice',
  'Teenage superheroes strive to prove themselves as members of the Justice League.',
  'https://m.media-amazon.com/images/M/MV5BYTdjYjMyNDEtYzQxOS00MDRiLThmMmUtM2U3ZTM4Y2Q4Y2Q3XkEyXkFqcGc@._V1_.jpg',
  '2010-11-26'::date,
  null,
  2010,
  2022,
  array['animation', 'action', 'adventure', 'crime', 'drama', 'fantasy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Young Justice');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'What We Do in the Shadows',
  'A look into the nightly lives of four vampires who have lived together on Staten Island for over a century.',
  'https://m.media-amazon.com/images/M/MV5BNDhiYTVlYjUtMDc4OC00NzBmLWE5YTYtNDBjZDc4MzM3YzNmXkEyXkFqcGc@._V1_.jpg',
  '2019-03-27'::date,
  null,
  2019,
  2024,
  array['comedy', 'fantasy', 'horror']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'What We Do in the Shadows');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Regular Show',
  'The surreal misadventures of two best friends--a blue jay and a raccoon--as they seek to liven up their mundane jobs as groundskeepers at the local park.',
  'https://m.media-amazon.com/images/M/MV5BMWVmMDJmYWQtMTg5Yy00NmJlLWJmNjEtYTIyYmRjMDdmMTRlXkEyXkFqcGc@._V1_.jpg',
  '2010-09-06'::date,
  null,
  2010,
  2017,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'fantasy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'J.G. Quintel',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Regular Show');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Demon Slayer: Kimetsu no Yaiba',
  'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
  'https://m.media-amazon.com/images/M/MV5BMWU1OGEwNmQtNGM3MS00YTYyLThmYmMtN2FjYzQzNzNmNTE0XkEyXkFqcGc@._V1_.jpg',
  '2021-01-22'::date,
  null,
  2019,
  2024,
  array['animation', 'action', 'adventure', 'fantasy', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Demon Slayer: Kimetsu no Yaiba');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Black Sun',
  'A historical fiction drama and thriller set in the turbulent period of the late 1920s in the Balkans as a place where high politics, local interests, capital and crime all merge together.',
  'https://m.media-amazon.com/images/M/MV5BYzMwMTY3NzktNGE0NC00MjJiLWIyNzMtNGY2MDU5ZTgyMDAyXkEyXkFqcGc@._V1_.jpg',
  '2017-10-22'::date,
  null,
  2017,
  2026,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Dragan Bjelogrlic',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Black Sun');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Samurai Champloo',
  'Fuu, a waitress who works in a teahouse, rescues two master swordsmen, Mugen and Jin, from their execution to help her find the "samurai who smells of sunflowers."',
  'https://m.media-amazon.com/images/M/MV5BMjBhZTY4NzMtOGU3OC00ZDllLWE2ZjUtMGFjYTU5OWI0YTQ2XkEyXkFqcGc@._V1_.jpg',
  '2005-01-11'::date,
  null,
  2004,
  2005,
  array['animation', 'action', 'adventure', 'comedy', 'drama', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Shin''ichirō Watanabe',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Samurai Champloo');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Dragon Ball',
  'Dragon Ball tells the tale of a young warrior by the name of Son Goku, a young peculiar boy with a tail who embarks on a quest to become stronger and learns of the Dragon Balls, when, once all 7 are gathered, grant any wish of choice.',
  'https://m.media-amazon.com/images/M/MV5BOWI0NzkxYTUtNGU5MS00MTUwLTk3NDItMTFlZDJiM2NlZDAxXkEyXkFqcGc@._V1_.jpg',
  '2001-08-20'::date,
  null,
  1995,
  2003,
  array['animation', 'action', 'adventure', 'fantasy', 'sci-fi', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Dragon Ball');

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
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Detectorists',
  'The lives of two eccentric metal detectorists, who spend their days plodding along ploughed tracks and open fields, hoping to disturb the tedium by unearthing the fortune of a lifetime.',
  'https://m.media-amazon.com/images/M/MV5BNGRjYzhmOTgtMDNlNy00YjJlLWI1MDAtMjAyMDRlMjE5OGNkXkEyXkFqcGc@._V1_.jpg',
  '2014-10-02'::date,
  null,
  2014,
  2022,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Mackenzie Crook',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Detectorists');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The IT Crowd',
  'The comedic misadventures of Roy, Moss and their grifting supervisor Jen, a rag-tag team of IT support workers at a large corporation headed by a hotheaded yuppie.',
  'https://m.media-amazon.com/images/M/MV5BNzkwNjJhZWYtZTRiNi00YWYzLTg3MzMtN2Y3OTllZmFmYTg0XkEyXkFqcGc@._V1_.jpg',
  '2006-02-03'::date,
  null,
  2006,
  2013,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The IT Crowd');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Flight of the Conchords',
  'Bret and Jemaine are Flight of the Conchords, a folk-rock band from New Zealand living in New York City in search of stardom.',
  'https://m.media-amazon.com/images/M/MV5BYjQzYTdhNjYtN2IzOC00YzBiLTg5NDQtYzU4OTdmYzUxMjIxXkEyXkFqcGc@._V1_.jpg',
  '2007-06-17'::date,
  null,
  2007,
  2009,
  array['comedy', 'music', 'musical']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Flight of the Conchords');

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
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Rocket Boys',
  'The story of two extraordinary men, Dr. Homi Jehangir Bhabha and Dr. Vikram Ambalal Sarabhai, who created history while building India''s future.',
  'https://m.media-amazon.com/images/M/MV5BNGI4Mzc5YjItMTkwMC00YTY4LTg0ZjgtMTk5N2EyM2RlYTM2XkEyXkFqcGc@._V1_.jpg',
  '2022-02-04'::date,
  null,
  2022,
  null,
  array['drama', 'history']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Nikkhil Advani',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Rocket Boys');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Family Man',
  'A working man from the National Investigation Agency tries to protect the nation from terrorism, but he also needs to keep his family safe from his secret job.',
  'https://m.media-amazon.com/images/M/MV5BZjM3YTczOWQtNjkzNi00ZTRlLThkZWEtZjgwZGVmODhkMDU3XkEyXkFqcGc@._V1_.jpg',
  '2019-09-19'::date,
  null,
  2019,
  null,
  array['action', 'comedy', 'crime', 'drama', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Family Man');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Samurai Jack',
  'A samurai, sent through time, fights to return home and save the world.',
  'https://m.media-amazon.com/images/M/MV5BNjU4ZmVhZGMtNTU4Yy00YmZhLTlmOGQtNGMwMTcwNTEyZjQ0XkEyXkFqcGc@._V1_.jpg',
  '2001-08-10'::date,
  null,
  2001,
  2017,
  array['animation', 'action', 'adventure', 'drama', 'fantasy', 'sci-fi']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Genndy Tartakovsky',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Samurai Jack');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'I''m Alan Partridge',
  'A failed television presenter, now presenting a programme on local radio desperately tries to revive his broadcasting career.',
  'https://m.media-amazon.com/images/M/MV5BOTVhYTdhYmQtN2EzZS00ZWNkLWJmYjctYTQzOWRkZWVmZGZlXkEyXkFqcGc@._V1_.jpg',
  '1997-11-03'::date,
  null,
  1997,
  2002,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'I''m Alan Partridge');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Coupling',
  'Six best friends talk about all aspects of sex and relationships on their never-ending quest to find true love.',
  'https://m.media-amazon.com/images/M/MV5BM2EzMTA4MjgtOTBiYS00NGI2LWJhYTQtYWUzZDI2YjI2NTJlXkEyXkFqcGc@._V1_.jpg',
  '2001-09-01'::date,
  null,
  2000,
  2004,
  array['comedy', 'romance']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Coupling');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Ezel',
  'Betrayed by his trusted friends and the woman he loved, Ömer Uçar returns as Ezel to exact his vengeance.',
  'https://m.media-amazon.com/images/M/MV5BY2VhYTA5YjMtNDBjZS00NTU3LTk1YWEtZGI0NDcxMTEyYjIyXkEyXkFqcGc@._V1_.jpg',
  '2009-09-28'::date,
  null,
  2009,
  2011,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Ezel');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Queen''s Gambit',
  'Orphaned at the tender age of nine, prodigious introvert Beth Harmon discovers and masters the game of chess in 1960s USA. But child stardom comes at a price.',
  'https://m.media-amazon.com/images/M/MV5BMmRlNjQxNWQtMjk1OS00N2QxLTk0YWQtMzRhYjY5YTFhNjMxXkEyXkFqcGc@._V1_.jpg',
  '2020-10-23'::date,
  null,
  2020,
  2020,
  array['drama']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Queen''s Gambit');

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
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Derry Girls',
  'The personal exploits of a 16-year-old girl and her family and friends during the Troubles in the early 1990s in Northern Ireland.',
  'https://m.media-amazon.com/images/M/MV5BZjVhN2FhMzctZDlkMS00NTY3LWEyZmEtOTE5NDlkN2JkNDE3XkEyXkFqcGc@._V1_.jpg',
  '2018-12-21'::date,
  null,
  2018,
  2022,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Lisa McGee',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Derry Girls');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Rehearsal',
  'Nathan Fielder gives people a chance to rehearse for their own lives in a world where nothing ever works out as expected.',
  'https://m.media-amazon.com/images/M/MV5BY2IxZDU5YmQtNGRjYi00ZDA1LTljYmYtYzkwYjExZGQ0Yjc2XkEyXkFqcGc@._V1_.jpg',
  '2022-07-15'::date,
  null,
  2022,
  null,
  array['documentary', 'comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Nathan Fielder',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Rehearsal');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Long Way Round',
  'Ewan McGregor and Charley Boorman embark on a grueling quest to motorbike from London to New York. Going east through Europe, Asia and then to Alaska, they experience different cultures and have to overcome the elements and adversity.',
  'https://m.media-amazon.com/images/M/MV5BMzI5MGJjODAtZjQzNy00MmU1LWE2MTAtNDM4NmFmNzNkZDFkXkEyXkFqcGc@._V1_.jpg',
  '2004-10-28'::date,
  null,
  2004,
  2010,
  array['documentary', 'adventure']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Long Way Round');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mob Psycho 100',
  'A psychic middle school boy tries to live a normal life and keep his growing powers under control, even though he constantly gets into trouble.',
  'https://m.media-amazon.com/images/M/MV5BYzU3NDM4ZjgtY2UyMi00YTczLTgyNDEtMjBiMDJlOGUxNjcxXkEyXkFqcGc@._V1_.jpg',
  '2018-10-27'::date,
  null,
  2016,
  2022,
  array['animation', 'action', 'comedy', 'drama', 'fantasy', 'horror']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mob Psycho 100');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Making a Murderer',
  'Filmed over a 10-year period, Steven Avery, a DNA exoneree who, while in the midst of exposing corruption in local law enforcement, finds himself the prime suspect in a grisly new crime.',
  'https://m.media-amazon.com/images/M/MV5BMTg4Mjc1NjE4Ml5BMl5BanBnXkFtZTgwMjk2NjA1NjM@._V1_.jpg',
  '2015-12-18'::date,
  null,
  2015,
  2018,
  array['documentary', 'crime']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Making a Murderer');

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
  2017,
  2017,
  array['crime', 'drama', 'horror', 'mystery']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
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
  'Alchemy of Souls',
  'Set in a fictional country called Daeho, it is about the love and growth of young mages as they overcome their twisted fates due to a forbidden magic spell known as the "alchemy of souls", which allows souls to switch bodies.',
  'https://m.media-amazon.com/images/M/MV5BOGFhNGQzMWUtZWJhNi00NGZiLTg1MjEtMTQzZmU4Njg2MWRhXkEyXkFqcGc@._V1_.jpg',
  '2022-06-18'::date,
  null,
  2022,
  2023,
  array['action', 'drama', 'fantasy', 'romance', 'thriller']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Alchemy of Souls');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'All Creatures Great & Small',
  'James Herriot, fresh out of Glasgow Veterinary College, pursues his dream to become a vet in the Yorkshire Dales. He discovers that treating the animals is as much about treating their owners, and the Dales'' farmers are a tough to please.',
  'https://m.media-amazon.com/images/M/MV5BMThlZmFhOTUtNzM3My00YTAwLWEzMDMtYmI0MGZiOTlkOTQ4XkEyXkFqcGc@._V1_.jpg',
  '2021-01-10'::date,
  null,
  2020,
  null,
  array['comedy', 'drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'All Creatures Great & Small');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Spaced',
  'Friends Tim and Daisy, 20-something North Londoners with uncertain futures, must pretend to be a couple to live in the only apartment they can afford.',
  'https://m.media-amazon.com/images/M/MV5BNjcwN2JiOGUtNDJkNy00NjVmLWIyYzctZDU4YWFlNjRlZmJlXkEyXkFqcGc@._V1_.jpg',
  '1999-09-24'::date,
  null,
  1999,
  2001,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Spaced');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Sons of Anarchy',
  'A biker struggles to balance being a father and being involved in an outlaw motorcycle club.',
  'https://m.media-amazon.com/images/M/MV5BZWNiZjFiNGEtNGZmMS00YTBlLWJlNmQtZTA2NzEzZWE4ZGQyXkEyXkFqcGc@._V1_.jpg',
  '2008-09-03'::date,
  null,
  2008,
  2014,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Kurt Sutter',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Sons of Anarchy');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Whose Line Is It Anyway?',
  'Improvisational comedy competition show in which four members of the regular cast as comedians and often with guest appearances with other comedians and celebrities and members of the audience perform various comic games and sketches.',
  'https://m.media-amazon.com/images/M/MV5BNjk5YmQ3YjYtYWM2My00MDQ3LTgxYTMtYzQ1ZjFlNDU4NDFjXkEyXkFqcGc@._V1_.jpg',
  '1998-08-05'::date,
  null,
  1998,
  2007,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Whose Line Is It Anyway?');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Impractical Jokers',
  'Q, Sal, Joe and Murr are real-life best friends who love challenging each other to the most outrageous dares and stunts ever caught on hidden camera.',
  'https://m.media-amazon.com/images/M/MV5BYjViMmNjNWQtNGY1Ni00ODZmLTk5YTctNGY5YzM5NjM0NDQ3XkEyXkFqcGc@._V1_.jpg',
  '2011-12-15'::date,
  null,
  2011,
  null,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Impractical Jokers');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Star Wars: Maul - Shadow Lord',
  'After the Clone Wars, Maul plots to rebuild his criminal syndicate on a planet untouched by the Empire.',
  'https://m.media-amazon.com/images/M/MV5BMmUzZWRkOGMtOGM2OC00ODk0LWFjZjUtMjUyOGRjYzgwYjdjXkEyXkFqcGc@._V1_.jpg',
  '2026-04-06'::date,
  null,
  2026,
  null,
  array['animation', 'action', 'adventure', 'crime', 'family', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Dave Filoni',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Star Wars: Maul - Shadow Lord');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Neon Genesis Evangelion',
  'In a post-cataclysmic future, reluctant teen Shinji Ikari is called by his estranged father to pilot an Evangelion for NERV, humanity''s last defense against invading Angels threatening Tokyo-3.',
  'https://m.media-amazon.com/images/M/MV5BZjZjZGI3ZDQtODNmZC00NjE0LTlmYTUtOTljMWI2YjNmMTQ0XkEyXkFqcGc@._V1_.jpg',
  '1997-08-20'::date,
  null,
  1995,
  1996,
  array['animation', 'action', 'drama', 'sci-fi']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Hideaki Anno',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Neon Genesis Evangelion');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Through the Wormhole',
  'Morgan Freeman explores humanity''s biggest questions: our composition, what preceded existence, if we''re alone in the universe, and whether there''s a creator - mysteries that have challenged our greatest minds.',
  'https://m.media-amazon.com/images/M/MV5BMGQyNDAzNGItZWM5MC00ZDAxLTg1YjItYzhkZmU5NGQzMWEzXkEyXkFqcGc@._V1_.jpg',
  '2010-06-09'::date,
  null,
  2010,
  2017,
  array['documentary']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Through the Wormhole');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Louie',
  'The life of Louie C.K., a divorced comedian living in New York with two kids.',
  'https://m.media-amazon.com/images/M/MV5BMWI4NDMxNGMtZGUxOS00MjJkLWIxMmItZGE1ODNjMDFjYzZmXkEyXkFqcGc@._V1_.jpg',
  '2010-06-29'::date,
  null,
  2010,
  2015,
  array['comedy', 'drama']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Louis C.K.',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Louie');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mind Your Language',
  'A diverse group of immigrants and foreigners learn English at an adult education school in London.',
  'https://m.media-amazon.com/images/M/MV5BODFhNDA4YjMtMjJkNy00MmVhLWFjM2ItNzY5NzI5YTlhM2Y3XkEyXkFqcGc@._V1_.jpg',
  '1977-12-30'::date,
  null,
  1977,
  1986,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Vince Powell',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mind Your Language');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Takopi''s Original Sin',
  'Takopi travels from his home of Happy Planet to spread happiness on Earth, but meets the unsmiling Shizuka. Her school friends and home life are causing her somber expression and pure hearted Takopi is determined to change things.',
  'https://m.media-amazon.com/images/M/MV5BYmRkN2I1OGEtOWM3Yi00NjViLWJjMDktYTNmZTMxYjBiNTU3XkEyXkFqcGc@._V1_.jpg',
  '2025-06-27'::date,
  null,
  2025,
  2025,
  array['animation', 'drama', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Takopi''s Original Sin');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Trailer Park Boys',
  'Three petty felons have a documentary made about their life in a trailer park.',
  'https://m.media-amazon.com/images/M/MV5BOTA0NTAwMTc1MF5BMl5BanBnXkFtZTgwODk2NjY0ODE@._V1_.jpg',
  '2004-04-20'::date,
  null,
  2001,
  2026,
  array['comedy', 'crime']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Mike Clattenburg',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Trailer Park Boys');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'My Brilliant Friend',
  'A woman recounts the lifelong friendship and conflicts with a girl she met at primary school in Naples during the early 1950s.',
  'https://m.media-amazon.com/images/M/MV5BZjQ3NjZmMDMtNWE1MS00MWNlLWE4YzEtZjRkODhiZjJkMzIxXkEyXkFqcGc@._V1_.jpg',
  '2018-11-18'::date,
  null,
  2018,
  2024,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Saverio Costanzo',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'My Brilliant Friend');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Eric Andre Show',
  'Eric Andre tries to host a talk show in a bizarre environment, where he is sometimes the player of pranks and sometimes the victim.',
  'https://m.media-amazon.com/images/M/MV5BZGY0OGMzYjItNjhkMy00NjZjLThlZTEtMTdlYWU0NzliZWNkXkEyXkFqcGc@._V1_.jpg',
  '2012-05-20'::date,
  null,
  2012,
  null,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Eric André',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Eric Andre Show');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Your Lie in April',
  'A piano prodigy who lost his ability to play after suffering a traumatic event in his childhood is forced back into the spotlight by an eccentric girl with a secret of her own.',
  'https://m.media-amazon.com/images/M/MV5BZGMyYmFmNzgtMWQ4NS00MWE2LTg4YmEtZGY1MTBiODE0YmE5XkEyXkFqcGc@._V1_.jpg',
  '2014-10-09'::date,
  null,
  2014,
  2015,
  array['animation', 'comedy', 'drama', 'music', 'romance']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Your Lie in April');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Schitt''s Creek',
  'After being a victim of fraud, Johnny Rose and his family go from extremely wealthy to penniless overnight. The only asset left to them is a small, unsophisticated town: Schitt''s Creek. They relocate there. Culture shock ensues.',
  'https://m.media-amazon.com/images/M/MV5BODk2Nzg4OWYtODczMy00NWRkLTg5ODQtZTU1ZGRhMzRhZGZhXkEyXkFqcGc@._V1_.jpg',
  '2015-02-11'::date,
  null,
  2015,
  2020,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Schitt''s Creek');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Gintama',
  'In an era where aliens have invaded and taken over feudal Tokyo, an unemployed samurai finds work however he can.',
  'https://m.media-amazon.com/images/M/MV5BNTMzNjE0N2ItNjFiYi00NmIzLTk1MzMtZWFjNThjMzI5MTJlXkEyXkFqcGc@._V1_.jpg',
  '2006-01-01'::date,
  null,
  2005,
  2021,
  array['animation', 'action', 'comedy', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Gintama');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Solo Leveling',
  'Follows the adventures of Sung Jinwoo in a world that is constantly threatened by monsters and evil forces. In his battles Sung transforms himself from the weakest hunter of all mankind to one of the strongest hunters in existence.',
  'https://m.media-amazon.com/images/M/MV5BM2M4YzdkMTEtMjUyYy00ZWY0LWI5ODQtNGRkZWQ1MzU5MWM2XkEyXkFqcGc@._V1_.jpg',
  '2024-01-06'::date,
  null,
  2024,
  null,
  array['animation', 'action', 'adventure', 'fantasy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Chugong',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Solo Leveling');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Tash Ma Tash',
  'Follows two guys and their adventures in Kingdom Of Saudi Arabia.',
  'https://m.media-amazon.com/images/M/MV5BYzMzMWMyMzQtNDk2OS00ZTY5LTkwNDctMGFhYmRiNGFlYzMzXkEyXkFqcGc@._V1_.jpg',
  '1993-02-22'::date,
  null,
  1993,
  2023,
  array['comedy', 'drama']::text[],
  'classic',
  9::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Tash Ma Tash');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Smiling Friends',
  'In a colorful yet bizarre world, the employees at a small firm dedicated to making its customers smile discover that their jobs are rarely as simple as they seem.',
  'https://m.media-amazon.com/images/M/MV5BYjNkMjdiZGEtMTg3Mi00YTAzLWJkMGYtMmIxMzNjMmRhOGNmXkEyXkFqcGc@._V1_.jpg',
  '2020-04-01'::date,
  null,
  2020,
  2026,
  array['animation', 'comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Smiling Friends');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Twinkling Watermelon',
  '"Sparkling Watermelon" will tell the story of a boy living a double life between a model student and a band member who gets to time slip and meets his 18-year-old father. The two will build friendships there.',
  'https://m.media-amazon.com/images/M/MV5BZGNhMDc0NTgtODc1MS00ZWU5LTgwMWUtYmYzMDZjNDg5ODk1XkEyXkFqcGc@._V1_.jpg',
  '2023-09-25'::date,
  null,
  2023,
  2023,
  array['comedy', 'drama', 'fantasy', 'music', 'romance']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Twinkling Watermelon');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Brass Eye',
  'Controversial spoof of current affairs television, and the role of celebrity in the UK.',
  'https://m.media-amazon.com/images/M/MV5BOTFhMGE2OWEtY2JiYS00MmUwLWIwMzMtYWZmZjdlZWI3MDI2XkEyXkFqcGc@._V1_.jpg',
  '1997-01-29'::date,
  null,
  1997,
  2001,
  array['comedy']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Brass Eye');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Mahabharat',
  'The mother of all wars, the epitome of all rivalries, the cauldron of emotions, insecurities, jealousies, and power play - Mahabharat.',
  'https://m.media-amazon.com/images/M/MV5BYzM1MmNhMGQtNDliNy00ZDIwLTg1MDQtN2NjZjUyNTg2MGMxXkEyXkFqcGc@._V1_.jpg',
  '2013-09-16'::date,
  null,
  2013,
  2014,
  array['drama', 'history', 'war']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Siddharth Kumar Tewary',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Mahabharat');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Expanse',
  'The disappearance of rich-girl-turned-political-activist links the lives of a Ceres detective, an accidental ship captain and U.N. politician. Amidst political tension between Earth, Mars and the Belt, they unravel the greatest conspiracy.',
  'https://m.media-amazon.com/images/M/MV5BYzUyYmI3MjctY2Q2MC00NmFjLTgwZGUtNWQzZWNlYmVjNzE2XkEyXkFqcGc@._V1_.jpg',
  '2015-11-23'::date,
  null,
  2015,
  2022,
  array['drama', 'mystery', 'sci-fi']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Expanse');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Boondocks',
  'Brothers Huey and Riley Freeman experience a culture clash when they leave Chicago to move in with their grandfather in the suburbs.',
  'https://m.media-amazon.com/images/M/MV5BYjFjZTAxZTItYjhjZS00MzNkLTk0NDYtYWMxYTQxNTE3YTQxXkEyXkFqcGc@._V1_.jpg',
  '2005-11-06'::date,
  null,
  2005,
  2014,
  array['animation', 'action', 'comedy', 'drama']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  'Aaron McGruder',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Boondocks');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'Silicon Valley',
  'Follows the struggle of Richard Hendricks, a Silicon Valley engineer trying to build his own company called Pied Piper.',
  'https://m.media-amazon.com/images/M/MV5BMjhhYmZjZjgtOTc3Mi00ZmY3LWI3MTUtYzcyOGMxYWFmN2YyXkEyXkFqcGc@._V1_.jpg',
  '2014-04-06'::date,
  null,
  2014,
  2019,
  array['comedy']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ended',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'Silicon Valley');

insert into public.series (
  title, overview, poster_url, start_date, end_date, start_year, end_year,
  genres, category, rating, review_text, season_count, director, creator,
  language, network, watch_provider, status, approval_status, created_by
)
select
  'The Great British Baking Show',
  'Bakers attempt three challenges each week trying to impress the judges enough to go through to the next round and eventually are crowned Britain''s best amateur baker.',
  'https://m.media-amazon.com/images/M/MV5BNTc3MzZkZTQtMWM3MC00MThmLTlmNjctOWEwY2NjMzM2NTllXkEyXkFqcGc@._V1_.jpg',
  '2014-12-27'::date,
  null,
  2010,
  null,
  array['drama']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb Top Rated TV chart (2026-06-11).',
  null,
  '',
  '',
  'English',
  '',
  null,
  'ongoing',
  'pending',
  null::uuid
where not exists (select 1 from public.series x where x.title = 'The Great British Baking Show');
