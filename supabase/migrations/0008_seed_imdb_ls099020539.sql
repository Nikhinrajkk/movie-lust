-- One-time seed: "The Best Spanish Thriller movies ever!" (IMDb list ls099020539).
-- https://www.imdb.com/list/ls099020539/
-- Run after 0007 (language column). ASCII-only strings to avoid SQL editor encoding issues.

insert into public.movies (
  title,
  overview,
  poster_url,
  release_year,
  genres,
  category,
  rating,
  review_text,
  runtime_minutes,
  director,
  language,
  approval_status,
  created_by
)
select
  'The Invisible Guest',
  'A businessman wakes locked in a hotel room with his dead lover and reconstructs the night with his lawyer.',
  '',
  2016,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls099020539.',
  106,
  'Oriol Paulo',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Invisible Guest'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Body',
  'A night watchman disappears from the morgue; the detective and the widower circle the same mystery.',
  '',
  2012,
  array['crime', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls099020539.',
  108,
  'Oriol Paulo',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Body');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Julia''s Eyes',
  'A woman with a degenerative eye condition investigates her twin sister''s death.',
  '',
  2010,
  array['horror', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls099020539.',
  118,
  'Guillem Morales',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Julia''s Eyes');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mirage',
  'A space-time glitch lets a woman contact the past - and rewrite the present.',
  '',
  2018,
  array['drama', 'romance', 'sci-fi', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  128,
  'Oriol Paulo',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Mirage');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Innocent Killers',
  'A student faces an impossible bargain from his psychology professor.',
  '',
  2015,
  array['comedy', 'crime', 'thriller']::text[],
  'classic',
  5.7::numeric,
  'Catalogue: IMDb list ls099020539.',
  95,
  'Gonzalo Bendala',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Innocent Killers');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'At the End of the Tunnel',
  'A paraplegic engineer overhears criminals tunneling from his basement toward a bank vault.',
  '',
  2016,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls099020539.',
  120,
  'Rodrigo Grande',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'At the End of the Tunnel'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Black Snow',
  'Two estranged brothers confront a violent past in Patagonia.',
  '',
  2017,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls099020539.',
  90,
  'Martin Hodara',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Black Snow');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Everybody Knows',
  'Family secrets surface when Laura returns to Spain for a wedding.',
  '',
  2018,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls099020539.',
  133,
  'Asghar Farhadi',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Everybody Knows');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Boy Missing',
  'A lawyer''s son vanishes; the case pulls her into a web of lies.',
  '',
  2016,
  array['crime', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  105,
  'Mar Tarragona',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Boy Missing');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Retribution',
  'A bank executive receives a bomb threat while driving his children to school.',
  '',
  2015,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  96,
  'Dani de la Torre',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Retribution');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'May God Save Us',
  'Two Madrid detectives hunt a ritualistic killer amid a heat wave.',
  '',
  2016,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls099020539.',
  127,
  'Rodrigo Sorogoyen',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'May God Save Us');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Palm Trees in the Snow',
  'A young woman traces her family''s colonial past in Equatorial Guinea.',
  '',
  2015,
  array['drama', 'romance']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  163,
  'Fernando Gonzalez Molina',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Palm Trees in the Snow'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Perdida',
  'Years after her sister''s disappearance, a journalist reopens the case.',
  '',
  2018,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls099020539.',
  130,
  'Oriol Paulo',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Perdida');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sara''s Notebook',
  'A journalist searches for her missing sister in the Congo.',
  '',
  2018,
  array['adventure', 'drama', 'thriller']::text[],
  'classic',
  6.0::numeric,
  'Catalogue: IMDb list ls099020539.',
  115,
  'Norberto Lopez Amado',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Sara''s Notebook');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Hidden Face',
  'A conductor suspects his girlfriend''s disappearance is tied to their house.',
  '',
  2011,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  92,
  'Andres Baiz',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Hidden Face');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Invisible Guardian',
  'An FBI profiler returns to her Basque hometown to hunt a ritual killer.',
  '',
  2017,
  array['crime', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  129,
  'Fernando Gonzalez Molina',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Invisible Guardian'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sleep Tight',
  'A concierge in Barcelona hides a disturbing obsession with a tenant.',
  '',
  2011,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls099020539.',
  102,
  'Jaume Balaguero',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Sleep Tight');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Secret in Their Eyes',
  'A retired investigator revisits an unsolved murder and a lost love.',
  '',
  2009,
  array['drama', 'romance', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls099020539.',
  129,
  'Juan Jose Campanella',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Secret in Their Eyes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Legacy of the Bones',
  'A police inspector returns to Baztan as new killings echo an old case.',
  '',
  2019,
  array['crime', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls099020539.',
  121,
  'Fernando Gonzalez Molina',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Legacy of the Bones'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Summit',
  'Latin American presidents negotiate behind closed doors at a regional summit.',
  '',
  2017,
  array['drama', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls099020539.',
  114,
  'Santiago Mitre',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Summit');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Warning',
  'Ten years apart, two boys receive letters predicting violence.',
  '',
  2018,
  array['crime', 'thriller', 'fantasy']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls099020539.',
  92,
  'Daniel Calparsoro',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Warning');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Bar',
  'Strangers trapped in a bar discover leaving may be lethal.',
  '',
  2017,
  array['comedy', 'horror', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls099020539.',
  102,
  'Alex de la Iglesia',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Bar');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Candidate',
  'A politician''s family comes under siege on the eve of an election.',
  '',
  2018,
  array['drama', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls099020539.',
  132,
  'Rodrigo Sorogoyen',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Candidate');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thesis on a Homicide',
  'A law professor suspects a student''s screenplay describes a real murder.',
  '',
  2013,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls099020539.',
  106,
  'Hernan Goldfrid',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Thesis on a Homicide'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Three-60',
  'Friends on a ski trip face a deadly secret tied to a past accident.',
  '',
  2013,
  array['thriller']::text[],
  'classic',
  5.5::numeric,
  'Catalogue: IMDb list ls099020539.',
  95,
  'Raul Cerezo, Fernando Gonzalez Gomez',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Three-60');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'To Steal from a Thief',
  'A bank robbery during the Valencia festival spirals out of control.',
  '',
  2016,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls099020539.',
  96,
  'Daniel Calparsoro',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'To Steal from a Thief'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Veronica',
  'After a seance during a solar eclipse, a Madrid teenager fears an evil presence.',
  '',
  2017,
  array['horror']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls099020539.',
  105,
  'Paco Plaza',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Veronica');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wild Tales',
  'Six standalone stories explode with black comedy and revenge.',
  '',
  2014,
  array['comedy', 'drama', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls099020539.',
  122,
  'Damian Szifron',
  'Spanish',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Wild Tales');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Corpse of Anna Fritz',
  'Partygoers alone with a celebrity''s corpse make increasingly grim choices.',
  '',
  2015,
  array['horror', 'thriller']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls099020539.',
  76,
  'Hector Hernandez Vicens',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Corpse of Anna Fritz'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fury of a Patient Man',
  'A quiet man''s quest for answers reignites old violence in Madrid.',
  '',
  2016,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls099020539.',
  92,
  'Raul Arevalo',
  'Spanish',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fury of a Patient Man'
);
