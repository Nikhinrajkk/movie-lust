-- MovieLust data (DML only). Run after 0001_schema.sql.
-- Consolidates former 0001 demo seeds, 0002_interstellar, 0004_seed_imdb_chart, 0005_update_poster_urls_wikimedia,
-- 0008–0012 IMDb list seeds, plus ls062655785 (100 Scariest Movies of All Time).

-- Demo catalogue rows (formerly 0001_init + 0002_interstellar)
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  language, approval_status, created_by
)
select
  'Inception',
  'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.',
  'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg',
  2010,
  array['sci-fi', 'thriller', 'action']::text[],
  'trending',
  8.8::numeric,
  'Layered, propulsive, and endlessly rewatchable.',
  148,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Inception');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  language, approval_status, created_by
)
select
  'The Dark Knight',
  'Batman faces the Joker, a criminal mastermind who plunges Gotham into anarchy.',
  'https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg',
  2008,
  array['action', 'crime', 'drama']::text[],
  'classic',
  9.0::numeric,
  'Still the gold standard for superhero cinema.',
  152,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'The Dark Knight');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  language, approval_status, created_by
)
select
  'Dune: Part Two',
  'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
  'https://upload.wikimedia.org/wikipedia/en/5/52/Dune_Part_Two_poster.jpeg',
  2024,
  array['sci-fi', 'adventure', 'drama']::text[],
  'now_showing',
  8.5::numeric,
  'Epic scale with intimate character stakes.',
  166,
  'Denis Villeneuve',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Dune: Part Two');

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  language, approval_status, created_by
)
select
  'Interstellar',
  'As Earth grows uninhabitable, a group of astronauts crosses a wormhole in search of a new home for humanity—and faces time itself.',
  'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg',
  2014,
  array['sci-fi', 'drama', 'adventure']::text[],
  'classic',
  8.7::numeric,
  'Scope and emotion at a scale few films attempt; the docking sequence alone is worth the run time.',
  169,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (select 1 from public.movies m where m.title = 'Interstellar');

-- IMDb chart-style bulk seed (formerly 0004_seed_imdb_chart.sql)
-- IMDb Top-chart style titles (directors corrected vs common spreadsheet errors).
-- Skips any row whose title already exists. Merged into 0001_schema.sql for new projects.
-- Posters: English Wikipedia / Wikimedia (stable URLs; avoids broken TMDB hashes).

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  language, approval_status, created_by
)
select
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director,
  ''::text,
  'approved'::text,
  null::uuid
from (
  values
    (
      'The Shawshank Redemption',
      'Two imprisoned men bond over years, finding solace and eventual redemption through acts of decency.',
      'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg',
      1994,
      array['drama']::text[],
      'classic',
      9.3::numeric,
      'IMDb chart mainstay. Directed by Frank Darabont.',
      null::int,
      'Frank Darabont'
    ),
    (
      'The Godfather',
      'The aging patriarch of an organized crime dynasty transfers control to his reluctant son.',
      'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg',
      1972,
      array['crime', 'drama']::text[],
      'classic',
      9.2::numeric,
      'IMDb chart mainstay. Directed by Francis Ford Coppola.',
      null::int,
      'Francis Ford Coppola'
    ),
    (
      'Schindler''s List',
      'In German-occupied Poland during World War II, industrialist Oskar Schindler saves over a thousand Jewish lives.',
      'https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg',
      1993,
      array['drama', 'crime']::text[],
      'classic',
      9.0::numeric,
      'IMDb chart mainstay. Directed by Steven Spielberg.',
      null::int,
      'Steven Spielberg'
    ),
    (
      '12 Angry Men',
      'The jury in a murder trial retires to deliberate, and one holdout tries to prevent a miscarriage of justice.',
      'https://upload.wikimedia.org/wikipedia/commons/b/b5/12_Angry_Men_%281957_film_poster%29.jpg',
      1957,
      array['crime', 'drama']::text[],
      'classic',
      9.0::numeric,
      'IMDb chart mainstay. Directed by Sidney Lumet.',
      null::int,
      'Sidney Lumet'
    ),
    (
      'The Lord of the Rings: The Return of the King',
      'Gandalf and Aragorn lead the World of Men against Sauron''s army, while Frodo reaches Mount Doom.',
      'https://upload.wikimedia.org/wikipedia/en/4/48/Lord_Rings_Return_King.jpg',
      2003,
      array['action', 'adventure', 'drama']::text[],
      'classic',
      9.0::numeric,
      'IMDb chart mainstay. Directed by Peter Jackson.',
      null::int,
      'Peter Jackson'
    ),
    (
      'The Godfather Part II',
      'Parallel stories follow young Vito Corleone''s rise and Michael''s struggle to expand the family empire.',
      'https://upload.wikimedia.org/wikipedia/en/0/03/Godfather_part_ii.jpg',
      1974,
      array['crime', 'drama']::text[],
      'classic',
      9.0::numeric,
      'IMDb chart mainstay. Directed by Francis Ford Coppola.',
      null::int,
      'Francis Ford Coppola'
    ),
    (
      'Pulp Fiction',
      'Interwoven stories of Los Angeles mobsters, small-time boxers, and a mysterious briefcase.',
      'https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg',
      1994,
      array['crime', 'drama']::text[],
      'classic',
      8.9::numeric,
      'IMDb chart mainstay. Directed by Quentin Tarantino.',
      null::int,
      'Quentin Tarantino'
    ),
    (
      'Fight Club',
      'An insomniac office worker and a soap maker build an underground fight club that spirals out of control.',
      'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg',
      1999,
      array['drama']::text[],
      'classic',
      8.8::numeric,
      'IMDb chart mainstay. Directed by David Fincher.',
      null::int,
      'David Fincher'
    ),
    (
      'The Lord of the Rings: The Fellowship of the Ring',
      'A meek Hobbit and eight companions set out to destroy the One Ring and defeat the Dark Lord Sauron.',
      'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg',
      2001,
      array['action', 'adventure', 'drama']::text[],
      'classic',
      8.8::numeric,
      'IMDb chart mainstay. Directed by Peter Jackson.',
      null::int,
      'Peter Jackson'
    ),
    (
      'Forrest Gump',
      'The history of the United States unfolds through the life of an Alabama man with a big heart.',
      'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg',
      1994,
      array['drama', 'romance']::text[],
      'classic',
      8.8::numeric,
      'IMDb chart mainstay. Directed by Robert Zemeckis.',
      null::int,
      'Robert Zemeckis'
    ),
    (
      'The Lord of the Rings: The Two Towers',
      'Frodo and Sam edge toward Mordor while the divided fellowship fights Saruman and Sauron''s forces.',
      'https://upload.wikimedia.org/wikipedia/en/a/a1/Lord_Rings_Two_Towers.jpg',
      2002,
      array['action', 'adventure', 'drama']::text[],
      'classic',
      8.8::numeric,
      'IMDb chart mainstay. Directed by Peter Jackson.',
      null::int,
      'Peter Jackson'
    ),
    (
      'The Good, the Bad and the Ugly',
      'Three gunslingers compete to find a fortune in buried Confederate gold amid the Civil War.',
      'https://upload.wikimedia.org/wikipedia/en/4/45/Good_the_bad_and_the_ugly_poster.jpg',
      1966,
      array['adventure', 'drama']::text[],
      'classic',
      8.8::numeric,
      'IMDb chart mainstay. Directed by Sergio Leone.',
      null::int,
      'Sergio Leone'
    ),
    (
      'Spider-Man: Across the Spider-Verse',
      'Miles Morales catapults across the Multiverse and faces a team of Spider-People protecting its existence.',
      'https://upload.wikimedia.org/wikipedia/en/b/b4/Spider-Man-_Across_the_Spider-Verse_poster.jpg',
      2023,
      array['animation', 'action', 'adventure']::text[],
      'trending',
      8.7::numeric,
      'IMDb chart mainstay. Directed by Joaquim Dos Santos, Kemp Powers, and Justin K. Thompson.',
      null::int,
      'Joaquim Dos Santos'
    ),
    (
      'Goodfellas',
      'The story of Henry Hill and his life in the mob, from small-time thief to FBI informant.',
      'https://upload.wikimedia.org/wikipedia/en/7/7b/Goodfellas.jpg',
      1990,
      array['crime', 'drama']::text[],
      'classic',
      8.7::numeric,
      'IMDb chart mainstay. Directed by Martin Scorsese.',
      null::int,
      'Martin Scorsese'
    ),
    (
      'The Matrix',
      'A computer hacker learns reality is a simulation and joins a rebellion against its machine overlords.',
      'https://upload.wikimedia.org/wikipedia/en/d/db/The_Matrix.png',
      1999,
      array['action', 'sci-fi']::text[],
      'classic',
      8.7::numeric,
      'IMDb chart mainstay. Directed by Lana and Lilly Wachowski.',
      null::int,
      'Lana Wachowski'
    ),
    (
      'One Flew Over the Cuckoo''s Nest',
      'A rebellious patient rallies fellow inmates against a domineering nurse in a mental institution.',
      'https://upload.wikimedia.org/wikipedia/en/2/26/One_Flew_Over_the_Cuckoo%27s_Nest_poster.jpg',
      1975,
      array['drama']::text[],
      'classic',
      8.7::numeric,
      'IMDb chart mainstay. Directed by Miloš Forman.',
      null::int,
      'Miloš Forman'
    ),
    (
      'Star Wars: Episode V - The Empire Strikes Back',
      'The Rebels scatter after the Empire attacks Hoth, while Luke trains with Yoda and learns a shattering truth.',
      'https://upload.wikimedia.org/wikipedia/en/3/3f/The_Empire_Strikes_Back_%281980_film%29.jpg',
      1980,
      array['action', 'adventure', 'fantasy']::text[],
      'classic',
      8.7::numeric,
      'IMDb chart mainstay. Directed by Irvin Kershner.',
      null::int,
      'Irvin Kershner'
    ),
    (
      'Oppenheimer',
      'The story of J. Robert Oppenheimer and the Manhattan Project, and the cost of building the atomic bomb.',
      'https://upload.wikimedia.org/wikipedia/en/4/4a/Oppenheimer_%28film%29.jpg',
      2023,
      array['drama', 'thriller']::text[],
      'trending',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Christopher Nolan.',
      null::int,
      'Christopher Nolan'
    ),
    (
      'Se7en',
      'Two detectives hunt a serial killer who uses the seven deadly sins as his motif.',
      'https://upload.wikimedia.org/wikipedia/en/6/68/Seven_%28movie%29_poster.jpg',
      1995,
      array['crime', 'drama', 'thriller']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by David Fincher.',
      null::int,
      'David Fincher'
    ),
    (
      'The Silence of the Lambs',
      'A young FBI trainee seeks the help of imprisoned cannibal Dr. Hannibal Lecter to catch another killer.',
      'https://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg',
      1991,
      array['crime', 'drama', 'thriller']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Jonathan Demme.',
      null::int,
      'Jonathan Demme'
    ),
    (
      'Star Wars: Episode IV - A New Hope',
      'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, and two droids to save the galaxy.',
      'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg',
      1977,
      array['action', 'adventure', 'fantasy']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by George Lucas.',
      null::int,
      'George Lucas'
    ),
    (
      'Saving Private Ryan',
      'Following the Normandy landings, U.S. soldiers go behind enemy lines to retrieve a paratrooper.',
      'https://upload.wikimedia.org/wikipedia/en/a/ac/Saving_Private_Ryan_poster.jpg',
      1998,
      array['drama']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Steven Spielberg.',
      null::int,
      'Steven Spielberg'
    ),
    (
      'The Green Mile',
      'Death row guards witness supernatural events after an enigmatic inmate arrives at Cold Mountain Penitentiary.',
      'https://upload.wikimedia.org/wikipedia/en/e/e2/The_Green_Mile_%28movie_poster%29.jpg',
      1999,
      array['crime', 'drama', 'fantasy']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Frank Darabont.',
      null::int,
      'Frank Darabont'
    ),
    (
      'Terminator 2: Judgment Day',
      'A reprogrammed Terminator protects John Connor from a more advanced liquid-metal assassin.',
      'https://upload.wikimedia.org/wikipedia/en/5/5e/Terminator_2-Judgment_Day.png',
      1991,
      array['action', 'sci-fi']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by James Cameron.',
      null::int,
      'James Cameron'
    ),
    (
      'Spirited Away',
      'During her family''s move to the suburbs, a sullen girl wanders into a world ruled by gods and spirits.',
      'https://upload.wikimedia.org/wikipedia/en/d/db/Spirited_Away_Japanese_poster.png',
      2001,
      array['animation', 'adventure', 'drama']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Hayao Miyazaki.',
      null::int,
      'Hayao Miyazaki'
    ),
    (
      'City of God',
      'In the slums of Rio, two boys take different paths as one becomes a photographer and the other a drug dealer.',
      'https://upload.wikimedia.org/wikipedia/en/1/10/CidadedeDeus.jpg',
      2002,
      array['crime', 'drama']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Fernando Meirelles.',
      null::int,
      'Fernando Meirelles'
    ),
    (
      'Life Is Beautiful',
      'A Jewish Italian bookseller uses humor and imagination to shield his son from the horrors of a concentration camp.',
      'https://upload.wikimedia.org/wikipedia/en/7/7c/Vitaebella.jpg',
      1997,
      array['comedy', 'drama', 'romance']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Roberto Benigni.',
      null::int,
      'Roberto Benigni'
    ),
    (
      'It''s a Wonderful Life',
      'An angel shows a frustrated businessman what life would have been like if he had never existed.',
      'https://upload.wikimedia.org/wikipedia/commons/2/25/It%27s_a_Wonderful_Life_%281946_poster%29.jpeg',
      1946,
      array['drama', 'romance']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Frank Capra.',
      null::int,
      'Frank Capra'
    ),
    (
      'Seven Samurai',
      'Farmers hire seven masterless samurai to defend their village from bandits.',
      'https://upload.wikimedia.org/wikipedia/en/c/c8/Seven_Samurai_Poster.png',
      1954,
      array['action', 'drama']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Akira Kurosawa.',
      null::int,
      'Akira Kurosawa'
    ),
    (
      'Harakiri',
      'An aging ronin requests permission to commit ritual suicide in a lord''s courtyard, exposing hypocrisy.',
      'https://upload.wikimedia.org/wikipedia/en/f/fd/Harakiri_Poster.jpg',
      1962,
      array['action', 'drama', 'thriller']::text[],
      'classic',
      8.6::numeric,
      'IMDb chart mainstay. Directed by Masaki Kobayashi.',
      null::int,
      'Masaki Kobayashi'
    ),
    (
      'Gladiator',
      'A former Roman general seeks vengeance against the corrupt emperor who murdered his family.',
      'https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png',
      2000,
      array['action', 'adventure', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Ridley Scott.',
      null::int,
      'Ridley Scott'
    ),
    (
      'Alien',
      'The crew of a commercial spacecraft encounters a deadly extraterrestrial organism.',
      'https://upload.wikimedia.org/wikipedia/en/c/c3/Alien_movie_poster.jpg',
      1979,
      array['horror', 'sci-fi']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Ridley Scott.',
      null::int,
      'Ridley Scott'
    ),
    (
      'Parasite',
      'Greed and class discrimination threaten the symbiotic relationship between the wealthy Park family and the destitute Kims.',
      'https://upload.wikimedia.org/wikipedia/en/5/53/Parasite_%282019_film%29.png',
      2019,
      array['drama', 'thriller']::text[],
      'trending',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Bong Joon-ho.',
      null::int,
      'Bong Joon-ho'
    ),
    (
      'The Departed',
      'An undercover cop and a mole in the police try to identify each other while infiltrating an Irish gang.',
      'https://upload.wikimedia.org/wikipedia/en/5/50/Departed234.jpg',
      2006,
      array['crime', 'drama', 'thriller']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Martin Scorsese.',
      null::int,
      'Martin Scorsese'
    ),
    (
      'The Prestige',
      'Two stage magicians engage in competitive one-upmanship in Victorian London—with deadly consequences.',
      'https://upload.wikimedia.org/wikipedia/en/d/d2/Prestige_poster.jpg',
      2006,
      array['drama', 'thriller', 'sci-fi']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Christopher Nolan.',
      null::int,
      'Christopher Nolan'
    ),
    (
      'Whiplash',
      'A young drummer enrolls at a cut-throat music conservatory where a conductor pushes him past his limits.',
      'https://upload.wikimedia.org/wikipedia/en/0/01/Whiplash_poster.jpg',
      2014,
      array['drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Damien Chazelle.',
      null::int,
      'Damien Chazelle'
    ),
    (
      'Back to the Future',
      'A teen is sent 30 years into the past in a time-traveling DeLorean invented by his eccentric friend.',
      'https://upload.wikimedia.org/wikipedia/en/d/d2/Back_to_the_Future.jpg',
      1985,
      array['adventure', 'comedy', 'sci-fi']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Robert Zemeckis.',
      null::int,
      'Robert Zemeckis'
    ),
    (
      'Léon: The Professional',
      'A hitman takes in a young girl after her family is murdered, and teaches her his trade.',
      'https://upload.wikimedia.org/wikipedia/en/0/03/Leon-poster.jpg',
      1994,
      array['action', 'crime', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Luc Besson.',
      null::int,
      'Luc Besson'
    ),
    (
      'Django Unchained',
      'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal plantation owner.',
      'https://upload.wikimedia.org/wikipedia/en/8/8b/Django_Unchained_Poster.jpg',
      2012,
      array['drama', 'crime']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Quentin Tarantino.',
      null::int,
      'Quentin Tarantino'
    ),
    (
      'The Lion King',
      'A lion prince flees his kingdom after his father''s murder, only to learn the true meaning of responsibility.',
      'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg',
      1994,
      array['animation', 'adventure', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Roger Allers and Rob Minkoff.',
      null::int,
      'Roger Allers'
    ),
    (
      'The Usual Suspects',
      'A sole survivor recounts the twist-filled path to a deadly harbor shoot-out.',
      'https://upload.wikimedia.org/wikipedia/en/9/9c/Usual_suspects_ver1.jpg',
      1995,
      array['crime', 'drama', 'thriller']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Bryan Singer.',
      null::int,
      'Bryan Singer'
    ),
    (
      'American History X',
      'A former neo-nazi tries to prevent his younger brother from going down the same wrong path.',
      'https://upload.wikimedia.org/wikipedia/en/3/39/American_History_X_poster.png',
      1998,
      array['crime', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Tony Kaye.',
      null::int,
      'Tony Kaye'
    ),
    (
      'Psycho',
      'A secretary on the run checks into a remote motel run by a young man dominated by his mother.',
      'https://upload.wikimedia.org/wikipedia/commons/7/76/Psycho_%281960%29_theatrical_poster_%28retouched%29.jpg',
      1960,
      array['horror', 'thriller']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Alfred Hitchcock.',
      null::int,
      'Alfred Hitchcock'
    ),
    (
      'The Pianist',
      'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto during World War II.',
      'https://upload.wikimedia.org/wikipedia/en/a/a6/The_Pianist_movie.jpg',
      2002,
      array['drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Roman Polanski.',
      null::int,
      'Roman Polanski'
    ),
    (
      'Casablanca',
      'A cynical expatriate struggles to decide whether to help his former lover and her fugitive husband escape.',
      'https://upload.wikimedia.org/wikipedia/commons/b/b3/CasablancaPoster-Gold.jpg',
      1942,
      array['drama', 'romance']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Michael Curtiz.',
      null::int,
      'Michael Curtiz'
    ),
    (
      'The Intouchables',
      'An unlikely friendship forms between a quadriplegic aristocrat and his exuberant caregiver from the projects.',
      'https://upload.wikimedia.org/wikipedia/en/9/93/The_Intouchables.jpg',
      2011,
      array['comedy', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Olivier Nakache and Éric Toledano.',
      null::int,
      'Olivier Nakache'
    ),
    (
      'Grave of the Fireflies',
      'A teenage boy and his younger sister struggle to survive in Japan during the final months of World War II.',
      'https://upload.wikimedia.org/wikipedia/en/a/a5/Grave_of_the_Fireflies_Japanese_poster.jpg',
      1988,
      array['animation', 'drama']::text[],
      'classic',
      8.5::numeric,
      'IMDb chart mainstay. Directed by Isao Takahata.',
      null::int,
      'Isao Takahata'
    )
) as v (
  title, overview, poster_url, release_year, genres, category, rating, review_text, runtime_minutes, director
)
where not exists (select 1 from public.movies m where m.title = v.title);

-- Poster URL fixes (formerly 0005_update_poster_urls_wikimedia.sql)
-- Fix broken TMDB poster URLs: point to stable Wikipedia/Wikimedia posters.
-- Safe to re-run; updates by exact title match.

update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/commons/b/b5/12_Angry_Men_%281957_film_poster%29.jpg' where title = '12 Angry Men';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/c/c3/Alien_movie_poster.jpg' where title = 'Alien';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/3/39/American_History_X_poster.png' where title = 'American History X';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/d/d2/Back_to_the_Future.jpg' where title = 'Back to the Future';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/commons/b/b3/CasablancaPoster-Gold.jpg' where title = 'Casablanca';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/1/10/CidadedeDeus.jpg' where title = 'City of God';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/8/8b/Django_Unchained_Poster.jpg' where title = 'Django Unchained';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/5/52/Dune_Part_Two_poster.jpeg' where title = 'Dune: Part Two';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg' where title = 'Fight Club';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg' where title = 'Forrest Gump';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png' where title = 'Gladiator';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/7/7b/Goodfellas.jpg' where title = 'Goodfellas';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/a/a5/Grave_of_the_Fireflies_Japanese_poster.jpg' where title = 'Grave of the Fireflies';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/f/fd/Harakiri_Poster.jpg' where title = 'Harakiri';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg' where title = 'Inception';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg' where title = 'Interstellar';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/commons/2/25/It%27s_a_Wonderful_Life_%281946_poster%29.jpeg' where title = 'It''s a Wonderful Life';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/7/7c/Vitaebella.jpg' where title = 'Life Is Beautiful';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/0/03/Leon-poster.jpg' where title = 'Léon: The Professional';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/2/26/One_Flew_Over_the_Cuckoo%27s_Nest_poster.jpg' where title = 'One Flew Over the Cuckoo''s Nest';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/4/4a/Oppenheimer_%28film%29.jpg' where title = 'Oppenheimer';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/5/53/Parasite_%282019_film%29.png' where title = 'Parasite';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/commons/7/76/Psycho_%281960%29_theatrical_poster_%28retouched%29.jpg' where title = 'Psycho';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg' where title = 'Pulp Fiction';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/a/ac/Saving_Private_Ryan_poster.jpg' where title = 'Saving Private Ryan';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg' where title = 'Schindler''s List';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/6/68/Seven_%28movie%29_poster.jpg' where title = 'Se7en';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Seven_Samurai_Poster.png' where title = 'Seven Samurai';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/b/b4/Spider-Man-_Across_the_Spider-Verse_poster.jpg' where title = 'Spider-Man: Across the Spider-Verse';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/d/db/Spirited_Away_Japanese_poster.png' where title = 'Spirited Away';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg' where title = 'Star Wars: Episode IV - A New Hope';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/The_Empire_Strikes_Back_%281980_film%29.jpg' where title = 'Star Wars: Episode V - The Empire Strikes Back';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Terminator_2-Judgment_Day.png' where title = 'Terminator 2: Judgment Day';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg' where title = 'The Dark Knight';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/5/50/Departed234.jpg' where title = 'The Departed';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg' where title = 'The Godfather';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/0/03/Godfather_part_ii.jpg' where title = 'The Godfather Part II';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/4/45/Good_the_bad_and_the_ugly_poster.jpg' where title = 'The Good, the Bad and the Ugly';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/e/e2/The_Green_Mile_%28movie_poster%29.jpg' where title = 'The Green Mile';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/9/93/The_Intouchables.jpg' where title = 'The Intouchables';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg' where title = 'The Lion King';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg' where title = 'The Lord of the Rings: The Fellowship of the Ring';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/4/48/Lord_Rings_Return_King.jpg' where title = 'The Lord of the Rings: The Return of the King';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/a/a1/Lord_Rings_Two_Towers.jpg' where title = 'The Lord of the Rings: The Two Towers';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/d/db/The_Matrix.png' where title = 'The Matrix';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/The_Pianist_movie.jpg' where title = 'The Pianist';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/d/d2/Prestige_poster.jpg' where title = 'The Prestige';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg' where title = 'The Shawshank Redemption';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg' where title = 'The Silence of the Lambs';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/9/9c/Usual_suspects_ver1.jpg' where title = 'The Usual Suspects';
update public.movies set poster_url = 'https://upload.wikimedia.org/wikipedia/en/0/01/Whiplash_poster.jpg' where title = 'Whiplash';

-- ---- 0008_seed_imdb_ls099020539.sql ----
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

-- ---- 0009_seed_imdb_ls055422143.sql ----
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Silence of the Lambs',
  'A young F.B.I. cadet must confide in an incarcerated and manipulative killer to receive his help on catching another serial killer who skins his victims.',
  '',
  1991,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  118,
  'Jonathan Demme',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Silence of the Lambs'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Prestige',
  'Two stage magicians engage in competitive one-upmanship in an attempt to create the ultimate stage illusion.',
  '',
  2006,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  130,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Prestige'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fight Club',
  'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more.',
  '',
  1999,
  array[]::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  139,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Fight Club'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mr. Nobody',
  'A boy stands on a station platform as a train is about to leave. Should he go with his mother or stay with his father? Infinite possibilities arise from this decision. As long as he doesn''t choose, anything is possible.',
  '',
  2009,
  array[]::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls055422143.',
  141,
  'Jaco Van Dormael',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mr. Nobody'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Butterfly Effect',
  'Evan Treborn suffers blackouts during significant events of his life. As he grows up, he finds a way to remember these lost memories and a supernatural way to alter his life by reading his journal.',
  '',
  2004,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  113,
  'Eric Bress',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Butterfly Effect'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Memento',
  'A man juggles searching for his wife''s murderer and keeping his short-term memory loss from being an obstacle.',
  '',
  2000,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  113,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Memento'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Se7en',
  'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi.',
  '',
  1995,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  127,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Se7en'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Misery',
  'After a famous author is rescued from a car crash by a fan of his novels, he comes to realize that the care he is receiving is only the beginning of a nightmare of captivity and abuse.',
  '',
  1990,
  array[]::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  107,
  'Rob Reiner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Misery'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Usual Suspects',
  'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.',
  '',
  1995,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  106,
  'Bryan Singer',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Usual Suspects'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Devil''s Advocate',
  'An exceptionally adept Florida lawyer is offered a job to work in New York City for a high-end law firm with a high-end boss - the biggest opportunity of his career to date.',
  '',
  1997,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  144,
  'Taylor Hackford',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Devil''s Advocate'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Headhunters',
  'An accomplished headhunter risks everything to obtain a valuable painting owned by a former mercenary.',
  '',
  2011,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  100,
  'Morten Tyldum',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Headhunters'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Game',
  'Nicholas Van Orton is a very wealthy San Francisco banker, but he is an absolute loner, even spending his birthday alone...',
  '',
  1997,
  array[]::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  129,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Game'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Primal Fear',
  'An altar boy is accused of murdering a priest, and the truth is buried several layers deep.',
  '',
  1996,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  129,
  'Gregory Hoblit',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Primal Fear'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Sixth Sense',
  'A boy who communicates with spirits that don''t know they''re dead seeks the help of a disheartened child psychologist.',
  '',
  1999,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  107,
  'M. Night Shyamalan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Sixth Sense'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Others',
  'A woman who lives in a darkened old house with her two photosensitive children becomes convinced that her family home is haunted.',
  '',
  2001,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  101,
  'Alejandro Amenábar',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Others'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Machinist',
  'An industrial worker who hasn''t slept in a year begins to doubt his own sanity.',
  '',
  2004,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  101,
  'Brad Anderson',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Machinist'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Source Code',
  'A soldier wakes up in someone else''s body and discovers he''s part of an experimental government program to find the bomber of a commuter train. A mission he has only 8 minutes to complete.',
  '',
  2011,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  93,
  'Duncan Jones',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Source Code'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Predestination',
  'For his final assignment, a top temporal agent must pursue the one criminal that has eluded him throughout time. The chase turns into a unique, surprising and mind-bending exploration of love, fate, identity and time travel taboos.',
  '',
  2014,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  97,
  'The Spierig Brothers',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Predestination'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Inception',
  'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.',
  '',
  2010,
  array[]::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  148,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Inception'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Shutter Island',
  'In 1954, a U.S. marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.',
  '',
  2010,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  138,
  'Martin Scorsese',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Shutter Island'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mulholland Dr.',
  'After a car wreck on the winding Mulholland Drive renders a woman amnesiac, she and a perky Hollywood-hopeful search for clues and answers across Los Angeles in a twisting venture beyond dreams and reality.',
  '',
  2001,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  147,
  'David Lynch',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mulholland Dr.'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Oldboy',
  'After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must find his captor in five days.',
  '',
  2003,
  array[]::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  120,
  'Chan-wook Park',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Oldboy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Battle Royale',
  'In the future, the Japanese government captures a class of ninth-grade students and forces them to kill each other under the revolutionary "Battle Royale" act.',
  '',
  2000,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  114,
  'Kinji Fukasaku',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Battle Royale'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Life of David Gale',
  'A man against capital punishment is accused of murdering a fellow activist and is sent to death row.',
  '',
  2003,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  130,
  'Alan Parker',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Life of David Gale'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Secret in Their Eyes',
  'A retired legal counselor writes a novel hoping to find closure for one of his past unresolved homicide cases and for his unreciprocated love with his superior - both of which still haunt him decades later.',
  '',
  2009,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  129,
  'Juan José Campanella',
  '',
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
  'Insomnia',
  'Two Los Angeles homicide detectives are dispatched to a northern town where the sun doesn''t set to investigate the methodical murder of a local teen.',
  '',
  2002,
  array[]::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  118,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Insomnia'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mystic River',
  'With a childhood tragedy that overshadowed their lives, three men are reunited by circumstance when one has a family tragedy.',
  '',
  2003,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  138,
  'Clint Eastwood',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mystic River'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Gone Girl',
  'With his wife''s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it''s suspected that he may not be innocent.',
  '',
  2014,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  149,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Gone Girl'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Prisoners',
  'When Keller Dover''s daughter and her friend go missing, he takes matters into his own hands as the police pursue multiple leads and the pressure mounts. But just how far will this desperate father go to protect his family?',
  '',
  2013,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  153,
  'Denis Villeneuve',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Prisoners'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Room',
  'A young boy is raised within the confines of a small shed.',
  '',
  2015,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  118,
  'Lenny Abrahamson',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Room'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Donnie Darko',
  'A troubled teenager is plagued by visions of a man in a large rabbit suit who manipulates him to commit a series of crimes, after he narrowly escapes a bizarre accident.',
  '',
  2001,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  113,
  'Richard Kelly',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Donnie Darko'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Nightcrawler',
  'When Louis Bloom, a driven man desperate for work, muscles into the world of L.A. crime journalism, he blurs the line between observer and participant to become the star of his own story.',
  '',
  2014,
  array[]::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls055422143.',
  118,
  'Dan Gilroy',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Nightcrawler'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Talented Mr. Ripley',
  'In late 1950s New York, Tom Ripley, a young underachiever, is sent to Italy to retrieve Dickie Greenleaf, a rich and spoiled millionaire playboy. But when the errand fails, Ripley takes extreme measures.',
  '',
  1999,
  array[]::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  139,
  'Anthony Minghella',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Talented Mr. Ripley'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Skin I Live In',
  'A brilliant plastic surgeon, haunted by past tragedies, creates a type of synthetic skin that withstands any kind of damage. His guinea pig: a mysterious and volatile woman who holds the key to his obsession.',
  '',
  2011,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  120,
  'Pedro Almodóvar',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Skin I Live In'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'I Origins',
  'A molecular biologist and his laboratory partner uncover evidence that may fundamentally change society as we know it.',
  '',
  2014,
  array[]::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  106,
  'Mike Cahill',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'I Origins'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Identity',
  'Stranded at a desolate Nevada motel during a nasty rain-storm, ten strangers become acquainted with each other when they realize that they''re being killed off one by one.',
  '',
  2003,
  array[]::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  90,
  'James Mangold',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Identity'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Forrest Gump',
  'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.',
  '',
  1994,
  array[]::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  142,
  'Robert Zemeckis',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Forrest Gump'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Shawshank Redemption',
  'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
  '',
  1994,
  array[]::text[],
  'classic',
  9.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  142,
  'Frank Darabont',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Shawshank Redemption'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Titanic',
  'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.',
  '',
  1997,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  194,
  'James Cameron',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Titanic'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The English Patient',
  'At the close of WWII, a young nurse tends to a badly-burned plane crash victim. His past is shown in flashbacks, revealing an involvement in a fateful love affair.',
  '',
  1996,
  array[]::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  162,
  'Anthony Minghella',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The English Patient'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Beautiful Mind',
  'After John Nash, a brilliant but asocial mathematician, accepts secret work in cryptography, his life takes a turn for the nightmarish.',
  '',
  2001,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  135,
  'Ron Howard',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Beautiful Mind'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Theory of Everything',
  'A look at the relationship between the famous physicist Stephen Hawking and his wife.',
  '',
  2014,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'James Marsh',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Theory of Everything'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Imitation Game',
  'During World War II, mathematician Alan Turing tries to crack the enigma code with help from fellow mathematicians.',
  '',
  2014,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  114,
  'Morten Tyldum',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Imitation Game'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Saving Mr. Banks',
  'Author P.L. Travers reflects on her childhood after reluctantly meeting with Walt Disney, who seeks to adapt her Mary Poppins books for the big screen.',
  '',
  2013,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  125,
  'John Lee Hancock',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Saving Mr. Banks'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Truman Show',
  'An insurance salesman/adjuster discovers his entire life is actually a television show.',
  '',
  1998,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  103,
  'Peter Weir',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Truman Show'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Green Mile',
  'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.',
  '',
  1999,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  189,
  'Frank Darabont',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Green Mile'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Diving Bell and the Butterfly',
  'The true story of Elle editor Jean-Dominique Bauby who suffers a stroke and has to live with an almost totally paralyzed body; only his left eye isn''t paralyzed.',
  '',
  2007,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  112,
  'Julian Schnabel',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Diving Bell and the Butterfly'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Intouchables',
  'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.',
  '',
  2011,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  112,
  'Olivier Nakache',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Intouchables'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Sea Inside',
  'The factual story of Spaniard Ramon Sampedro, who fought a thirty-year campaign in favor of euthanasia and his own right to die.',
  '',
  2004,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  125,
  'Alejandro Amenábar',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Sea Inside'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Talk to Her',
  'Two men share an odd friendship while they care for two women who are both in deep comas.',
  '',
  2002,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  112,
  'Pedro Almodóvar',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Talk to Her'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Hunt',
  'A teacher lives a lonely life, all the while struggling over his son''s custody. His life slowly gets better as he finds love and receives good news from his son, but his new luck is about to be brutally shattered by an innocent little lie.',
  '',
  2012,
  array[]::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  115,
  'Thomas Vinterberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Hunt'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '25th Hour',
  'Cornered by the DEA, convicted New York drug dealer Montgomery Brogan reevaluates his life in the 24 remaining hours before facing a seven-year jail term.',
  '',
  2002,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  135,
  'Spike Lee',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '25th Hour'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'American History X',
  'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.',
  '',
  1998,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  119,
  'Tony Kaye',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'American History X'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Requiem for a Dream',
  'The drug-induced utopias of four Coney Island people are shattered when their addictions run deep.',
  '',
  2000,
  array[]::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  102,
  'Darren Aronofsky',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Requiem for a Dream'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Trainspotting',
  'Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.',
  '',
  1996,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  94,
  'Danny Boyle',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Trainspotting'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Saving Private Ryan',
  'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.',
  '',
  1998,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  169,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Saving Private Ryan'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fury',
  'A grizzled tank commander makes tough decisions as he and his crew fight their way across Germany in April, 1945.',
  '',
  2014,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  134,
  'David Ayer',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Fury'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Braveheart',
  'When his secret bride is executed for assaulting an English soldier who tried to rape her, Sir William Wallace begins a revolt against King Edward I of England.',
  '',
  1995,
  array[]::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  178,
  'Mel Gibson',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Braveheart'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Gladiator',
  'When a Roman general is betrayed and his family murdered by an emperor''s corrupt son, he comes to Rome as a gladiator to seek revenge.',
  '',
  2000,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  155,
  'Ridley Scott',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Gladiator'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Count of Monte Cristo',
  'A young man, falsely imprisoned by his jealous "friend," escapes and uses a hidden treasure to exact his revenge.',
  '',
  2002,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  131,
  'Kevin Reynolds',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Count of Monte Cristo'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Legends of the Fall',
  'In the 1900s, three brothers and their father living in the remote wilderness of Montana are affected by betrayal, history, love, nature, and war.',
  '',
  1994,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  133,
  'Edward Zwick',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Legends of the Fall'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Revenant',
  'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.',
  '',
  2015,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  156,
  'Alejandro G. Iñárritu',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Revenant'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Atonement',
  'Fledgling writer Briony Tallis, as a thirteen-year-old, irrevocably changes the course of several lives when she accuses her older sister''s lover of a crime he did not commit.',
  '',
  2007,
  array[]::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'Joe Wright',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Atonement'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Words',
  'A writer at the peak of his literary success discovers the steep price he must pay for stealing another man''s work.',
  '',
  2012,
  array[]::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  102,
  'Brian Klugman',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Words'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mud',
  'Two young boys encounter a fugitive and form a pact to help him evade the vigilantes that are on his trail and to reunite him with his true love.',
  '',
  2012,
  array[]::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  130,
  'Jeff Nichols',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mud'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Good Will Hunting',
  'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.',
  '',
  1997,
  array[]::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  126,
  'Gus Van Sant',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Good Will Hunting'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Million Dollar Baby',
  'A determined woman works with a hardened boxing trainer to become a professional.',
  '',
  2004,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  132,
  'Clint Eastwood',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Million Dollar Baby'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Gran Torino',
  'Disgruntled Korean War veteran Walt Kowalski sets out to reform his neighbor, a Hmong teenager who tried to steal Kowalski''s prized possession: a 1972 Gran Torino.',
  '',
  2008,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  116,
  'Clint Eastwood',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Gran Torino'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Pursuit of Happyness',
  'A struggling salesman takes custody of his son as he''s poised to begin a life-changing professional endeavor.',
  '',
  2006,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  117,
  'Gabriele Muccino',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Pursuit of Happyness'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Warrior',
  'The youngest son of an alcoholic former boxer returns home, where he''s trained by his father for competition in a mixed martial arts tournament - a path that puts the fighter on a collision course with his estranged, older brother.',
  '',
  2011,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  140,
  'Gavin O''Connor',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Warrior'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Rush',
  'The merciless 1970s rivalry between Formula One rivals James Hunt and Niki Lauda.',
  '',
  2013,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'Ron Howard',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Rush'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Whiplash',
  'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student''s potential.',
  '',
  2014,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  107,
  'Damien Chazelle',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Whiplash'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ben X',
  'As an alternative to getting bullied at school, an autistic teenager retreats into the world of online role-playing games.',
  '',
  2007,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  93,
  'Nic Balthazar',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Ben X'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '12 Years a Slave',
  'In the antebellum United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery.',
  '',
  2013,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  134,
  'Steve McQueen',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '12 Years a Slave'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hotel Rwanda',
  'Paul Rusesabagina was a hotel manager who housed over a thousand Tutsi refugees during their struggle against the Hutu militia in Rwanda.',
  '',
  2004,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  121,
  'Terry George',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hotel Rwanda'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Argo',
  'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.',
  '',
  2012,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  120,
  'Ben Affleck',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Argo'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'In the Name of the Father',
  'A man''s coerced confession to an IRA bombing he did not commit results in the imprisonment of his father as well. An English lawyer fights to free them.',
  '',
  1993,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  133,
  'Jim Sheridan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'In the Name of the Father'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Lives of Others',
  'In 1984 East Berlin, an agent of the secret police, conducting surveillance on a writer and his lover, finds himself becoming increasingly absorbed by their lives.',
  '',
  2006,
  array[]::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  137,
  'Florian Henckel von Donnersmarck',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Lives of Others'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Good Bye Lenin!',
  'In 1990, to protect his fragile mother from a fatal shock after a long coma, a young man must keep her from learning that her beloved nation of East Germany as she knew it has disappeared.',
  '',
  2003,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  121,
  'Wolfgang Becker',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Good Bye Lenin!'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Downfall',
  'Traudl Junge, the final secretary for Adolf Hitler, tells of the Nazi dictator''s final days in his Berlin bunker at the end of WWII.',
  '',
  2004,
  array[]::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  156,
  'Oliver Hirschbiegel',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Downfall'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Life Is Beautiful',
  'When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor and imagination to protect his son from the dangers around their camp.',
  '',
  1997,
  array[]::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  116,
  'Roberto Benigni',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Life Is Beautiful'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Schindler''s List',
  'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazi Germans.',
  '',
  1993,
  array[]::text[],
  'classic',
  8.9::numeric,
  'Catalogue: IMDb list ls055422143.',
  195,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Schindler''s List'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Separation',
  'A married couple are faced with a difficult decision - to improve the life of their child by moving to another country or to stay in Iran and look after a deteriorating parent who has Alzheimer''s disease.',
  '',
  2011,
  array[]::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'Asghar Farhadi',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Separation'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Persepolis',
  'A precocious and outspoken Iranian girl grows up during the Islamic Revolution.',
  '',
  2007,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  96,
  'Vincent Paronnaud',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Persepolis'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wild Tales',
  'Six short stories that explore the extremities of human behavior involving people in distress.',
  '',
  2014,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  122,
  'Damián Szifron',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Wild Tales'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Babel',
  'Tragedy strikes a married couple on vacation in the Moroccan desert, touching off an interlocking story involving four different families.',
  '',
  2006,
  array[]::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls055422143.',
  143,
  'Alejandro González Iñárritu',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Babel'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Slumdog Millionaire',
  'A Mumbai teen reflects on his upbringing in the slums when he is accused of cheating on the Indian Version of "Who Wants to be a Millionaire?"',
  '',
  2008,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  120,
  'Danny Boyle',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Slumdog Millionaire'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Life of Pi',
  'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.',
  '',
  2012,
  array[]::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls055422143.',
  127,
  'Ang Lee',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Life of Pi'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Beach',
  'Twenty-something Richard travels to Thailand and finds himself in possession of a strange map. Rumours state that it leads to a solitary beach paradise, a tropical bliss - excited and intrigued, he sets out to find it.',
  '',
  2000,
  array[]::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  119,
  'Danny Boyle',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Beach'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Into the Wild',
  'After graduating from Emory University, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity and hitchhikes to Alaska to live in the wilderness. Along the way, Christopher encounters a series of characters that shape his life.',
  '',
  2007,
  array[]::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls055422143.',
  148,
  'Sean Penn',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Into the Wild'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Curious Case of Benjamin Button',
  'Tells the story of Benjamin Button, a man who starts aging backwards with bizarre consequences.',
  '',
  2008,
  array[]::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  166,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Curious Case of Benjamin Button'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fountain',
  'As a modern-day scientist, Tommy is struggling with mortality, desperately searching for the medical breakthrough that will save the life of his cancer-stricken wife, Izzi.',
  '',
  2006,
  array[]::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls055422143.',
  96,
  'Darren Aronofsky',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fountain'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Big Fish',
  'A frustrated son tries to determine the fact from fiction in his dying father''s life.',
  '',
  2003,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  125,
  'Tim Burton',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Big Fish'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fall',
  'In a hospital on the outskirts of 1920s Los Angeles, an injured stuntman begins to tell a fellow patient, a little girl with a broken arm, a fantastic story of five mythical heroes. Thanks to his fractured state of mind and her vivid imagination, the line between fiction and reality blurs as the tale advances.',
  '',
  2006,
  array[]::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls055422143.',
  117,
  'Tarsem',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fall'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pirates of the Caribbean: The Curse of the Black Pearl',
  'Blacksmith Will Turner teams up with eccentric pirate "Captain" Jack Sparrow to save his love, the governor''s daughter, from Jack''s former pirate allies, who are now undead.',
  '',
  2003,
  array[]::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls055422143.',
  143,
  'Gore Verbinski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Pirates of the Caribbean: The Curse of the Black Pearl'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Lord of the Rings: The Fellowship of the Ring',
  'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.',
  '',
  2001,
  array[]::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls055422143.',
  178,
  'Peter Jackson',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Lord of the Rings: The Fellowship of the Ring'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pan''s Labyrinth',
  'In the falangist Spain of 1944, the bookish young stepdaughter of a sadistic army officer escapes into an eerie but captivating fantasy world.',
  '',
  2006,
  array[]::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls055422143.',
  118,
  'Guillermo del Toro',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Pan''s Labyrinth'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Interview with the Vampire: The Vampire Chronicles',
  'A vampire tells his epic life story: love, betrayal, loneliness, and hunger.',
  '',
  1994,
  array[]::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'Neil Jordan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Interview with the Vampire: The Vampire Chronicles'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Harry Potter and the Goblet of Fire',
  'Harry finds himself mysteriously selected as an under-aged competitor in a dangerous tournament between three schools of magic.',
  '',
  2005,
  array[]::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls055422143.',
  157,
  'Mike Newell',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Harry Potter and the Goblet of Fire'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mary Shelley''s Frankenstein',
  'When the brilliant but unorthodox scientist Victor Frankenstein rejects the artificial man that he has created, the Creature escapes and later swears revenge.',
  '',
  1994,
  array[]::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls055422143.',
  123,
  'Kenneth Branagh',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mary Shelley''s Frankenstein'
);

-- ---- 0010_seed_imdb_ls000985554.sql ----
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Oldboy',
  'After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must track down his captor in five days.',
  'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_.jpg',
  2003,
  array['action', 'drama', 'mystery']::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  120,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Oldboy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Failan',
  'A marriage of convenience between a petty gangster and an illegal immigrant he has never met has unforeseen consequences for them both.',
  'https://m.media-amazon.com/images/M/MV5BN2M4YTFmNDgtMjE2OC00ODIwLWJkMTgtYjM0NjAzYzY1M2U2XkEyXkFqcGc@._V1_.jpg',
  2001,
  array['drama', 'romance']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  115,
  'Hae-sung Song',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Failan'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Chaser',
  'A disgraced ex-policeman who runs a small ring of prostitutes finds himself in a race against time when one of his women goes missing.',
  'https://m.media-amazon.com/images/M/MV5BZGZjMDU2ODAtMzFlNy00MWU1LWE1YTEtYTFmZTE0ZmEyYjYxXkEyXkFqcGc@._V1_.jpg',
  2008,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls000985554.',
  125,
  'Na Hong-jin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Chaser'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'I Saw the Devil',
  'A secret agent exacts revenge on a serial killer through a series of captures and releases.',
  'https://m.media-amazon.com/images/M/MV5BM2Q1ZGZiNTYtMWNjOC00NmU2LTg1MDQtZGZkNmY0Y2RlOTBmXkEyXkFqcGc@._V1_.jpg',
  2010,
  array['action', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls000985554.',
  144,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'I Saw the Devil'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Bittersweet Life',
  'Things go wrong for a high ranking mobster when he doesn''t follow his boss''s orders.',
  'https://m.media-amazon.com/images/M/MV5BNmQyNzdkZmItM2ZiMi00ZjQ3LWE4YjctZDdlNDEwNjFiMjJkXkEyXkFqcGc@._V1_.jpg',
  2005,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  119,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Bittersweet Life'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Classic',
  'Shy Ji-hae''s friend asks Ji-hae to write e-mails to the boy she loves in her name. As the boy falls in love with her letters, Ji-hae discovers the story of her mother''s romance which is remarkably similar to her own circumstances.',
  'https://m.media-amazon.com/images/M/MV5BZjIyNDk5ODMtMTM5Yy00ZmEzLWExMWYtY2MzMWI4YzI1MmI5XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['drama', 'romance']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  127,
  'Jae-young Kwak',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Classic'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Memories of Murder',
  'In a small Korean province in 1986, two detectives struggle with the case of multiple young women being found raped and murdered by an unknown culprit.',
  'https://m.media-amazon.com/images/M/MV5BYmRjOWE5NmMtYTdkYS00ODFlLWJiMTMtYzE2NDZlZjlkZDQ0XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  132,
  'Bong Joon Ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Memories of Murder'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Tae Guk Gi: The Brotherhood of War',
  'When two brothers are forced to fight in the Korean War, the elder decides to take the riskiest missions if it will help shield the younger from battle.',
  'https://m.media-amazon.com/images/M/MV5BNjUzNTVlYzQtOGYxMy00NmExLTgzYTQtOGEyM2YyM2YzYjJkXkEyXkFqcGc@._V1_.jpg',
  2004,
  array['action', 'drama', 'war']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  140,
  'Kang Je-kyu',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Tae Guk Gi: The Brotherhood of War'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sympathy for Mr. Vengeance',
  'A recently laid off factory worker kidnaps his former boss'' friend''s daughter, hoping to use the ransom money to pay for his sister''s kidney transplant.',
  'https://m.media-amazon.com/images/M/MV5BZTM1ZWUzYzktYjM2Zi00MzNlLTllOTgtYThjZWM2ZjkyY2YwXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  129,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Sympathy for Mr. Vengeance'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Yellow Sea',
  'When the attempt to kill a professor goes wrong, a series of violent events are triggered which force a taxi driver to run for his life.',
  'https://m.media-amazon.com/images/M/MV5BOTRhOWY0NDMtNjgzNy00YTg3LWIxOWEtMDViNWU5OGI0Y2JlXkEyXkFqcGc@._V1_.jpg',
  2010,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  136,
  'Na Hong-jin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Yellow Sea'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Joint Security Area',
  'After a shooting incident at the North-South Korean border DMZ leaves two North Korean soldiers dead, a neutral Swiss and Swedish team investigates what actually happened.',
  'https://m.media-amazon.com/images/M/MV5BMTI1NDA4NTMyN15BMl5BanBnXkFtZTYwNTA2ODc5._V1_.jpg',
  2000,
  array['action', 'drama', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  110,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Joint Security Area'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Dirty Carnival',
  'A small time thug collecting debts for the local triad is torn between his criminal aspirations and his devotion to family.',
  'https://m.media-amazon.com/images/M/MV5BMTc5Mzc3ODUyMl5BMl5BanBnXkFtZTgwNDk0ODc1MjE@._V1_.jpg',
  2006,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  140,
  'Ha Yoo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Dirty Carnival'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Lady Vengeance',
  'After being wrongfully imprisoned for thirteen years and having her child taken away from her, a woman seeks revenge through increasingly brutal means.',
  'https://m.media-amazon.com/images/M/MV5BMTczMTI1MzYwMV5BMl5BanBnXkFtZTgwMDI1OTE3MjE@._V1_.jpg',
  2005,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  115,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Lady Vengeance'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Man from Nowhere',
  'A quiet pawnshop keeper with a violent past takes on a drug-and-organ trafficking ring in hope of saving the child who is his only friend.',
  'https://m.media-amazon.com/images/M/MV5BMTgzMTkxNjAxNV5BMl5BanBnXkFtZTgwMDU3MDE0MjE@._V1_.jpg',
  2010,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  119,
  'Lee Jeong-beom',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Man from Nowhere'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '3-Iron',
  'A transient young man breaks into empty homes to partake of the vacationing residents'' lives for a few days.',
  'https://m.media-amazon.com/images/M/MV5BMTM1ODIwNzM5OV5BMl5BanBnXkFtZTcwNjk5MDkyMQ@@._V1_.jpg',
  2004,
  array['crime', 'drama', 'romance']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  88,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '3-Iron'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Moment to Remember',
  'A young couple''s enduring love is tested when 27-year-old Su-jin is diagnosed with a rare form of Alzheimer''s disease.',
  'https://m.media-amazon.com/images/M/MV5BODYzODg5Mjg3Ml5BMl5BanBnXkFtZTgwNDM1MDQ2MzE@._V1_.jpg',
  2004,
  array['drama', 'romance']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  117,
  'Park Kyung-Jin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Moment to Remember'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mother',
  'A mother desperately searches for the killer who framed her son for a girl''s horrific murder.',
  'https://m.media-amazon.com/images/M/MV5BMTQzMTg0NDA1M15BMl5BanBnXkFtZTgwODUzMTE0MjE@._V1_.jpg',
  2009,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  129,
  'Bong Joon Ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mother'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Parasite',
  'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
  'https://m.media-amazon.com/images/M/MV5BYjk1Y2U4MjQtY2ZiNS00OWQyLWI3MmYtZWUwNmRjYWRiNWNhXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['drama', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  132,
  'Bong Joon Ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Parasite'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Good, the Bad, the Weird',
  'The story of two outlaws and a bounty hunter in 1940s Manchuria and their rivalry to possess a treasure map while being pursued by the Japanese army and Chinese bandits.',
  'https://m.media-amazon.com/images/M/MV5BMDQxOGMwMTUtZTNmMi00ODJmLThiMDctYTJhMzM2YTMzMDhkXkEyXkFqcGc@._V1_.jpg',
  2008,
  array['action', 'adventure', 'comedy']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  130,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Good, the Bad, the Weird'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Tale of Two Sisters',
  'After being institutionalized in a mental hospital, Su-mi reunites with her sister, Su-yeon, and they return to live at their country home. But strange events plague the house, leading to surprising revelations and a shocking conclusion.',
  'https://m.media-amazon.com/images/M/MV5BMTEwMTYwMGQtY2ZhNi00Y2QwLWIxYjktMGY1Mzk4YmE4ODY2XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  114,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Tale of Two Sisters'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'No Mercy',
  'Despite being nearly proven the murderer, a serial killer threatens to kill the daughter of a forensic pathologist if he doesn''t get him bailed out.',
  'https://m.media-amazon.com/images/M/MV5BMTk0MDQwNTM4Nl5BMl5BanBnXkFtZTgwMTc3MDE0MjE@._V1_.jpg',
  2010,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  123,
  'Kim Hyeong-joon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'No Mercy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Thirst',
  'Through a failed medical experiment, a priest is stricken with vampirism and is forced to abandon his ascetic ways.',
  'https://m.media-amazon.com/images/M/MV5BMDIxMTk2MjAtYTgzNy00NDE5LTg2MWQtYjM5ODBhODZkN2M4XkEyXkFqcGc@._V1_.jpg',
  2009,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  134,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Thirst'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'My Way',
  'In World War II-era Korea, rival runners, one Korean (Jang Dong-gun) and one Japanese (Joe Odagiri), go to war together against the Soviets.',
  'https://m.media-amazon.com/images/M/MV5BMjM2MTI4OTc5OF5BMl5BanBnXkFtZTgwNDk1MTAzMjE@._V1_.jpg',
  2011,
  array['action', 'drama', 'war']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  137,
  'Kang Je-kyu',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'My Way'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Il Mare',
  'In 1999, a voice actor moves from Il Mare, a seaside house, and leaves a Christmas card in its mailbox. An architecture student receives it in 1997, and a friendship separated by two years begins.',
  'https://m.media-amazon.com/images/M/MV5BMzlhNzdhNWYtMDZiNS00M2E2LTk2ZTMtYTY4MmQ4OGY1N2RhXkEyXkFqcGc@._V1_.jpg',
  2000,
  array['drama', 'fantasy', 'romance']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  105,
  'Hyun-seung Lee',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Il Mare'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Daisy',
  'About a tragic love triangle story involving young painter Hye-young, Interpol detective Jeong Woo, and professional hitman Park Yi.',
  'https://m.media-amazon.com/images/M/MV5BNjhhYzVhYTQtOGEyZC00MjE4LThkNjItM2ZlZWUzNzM4ZWJjXkEyXkFqcGc@._V1_.jpg',
  2006,
  array['action', 'adventure', 'drama']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  110,
  'Wai Keung Lau',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Daisy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pieta',
  'A loan shark is forced to reconsider his violent lifestyle after the arrival of a mysterious woman claiming to be his long-lost mother.',
  'https://m.media-amazon.com/images/M/MV5BODQ3Nzg1NjkyNl5BMl5BanBnXkFtZTcwMzEyOTQzOQ@@._V1_.jpg',
  2012,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  103,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Pieta'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spring, Summer, Fall, Winter... and Spring',
  'In the midst of the Korean wilderness, a Buddhist master patiently raises a boy while teaching wisdom and compassion through experience and endless exercises.',
  'https://m.media-amazon.com/images/M/MV5BMTI0ODMwOTIxOV5BMl5BanBnXkFtZTcwMzE2NDUyMQ@@._V1_.jpg',
  2003,
  array['drama', 'romance']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  103,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Spring, Summer, Fall, Winter... and Spring'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'My Sassy Girl',
  'A young man sees a drunk, cute woman standing too close to the tracks at a metro station in Seoul and pulls her back. She ends up getting him into trouble repeatedly after that, starting on the train.',
  'https://m.media-amazon.com/images/M/MV5BNjNlYTg0MGItM2VhMy00NTZhLTlmNTktM2NmYmM4YmJhYmZkXkEyXkFqcGc@._V1_.jpg',
  2001,
  array['comedy', 'drama', 'romance']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  137,
  'Jae-young Kwak',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'My Sassy Girl'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Crying Fist',
  'Tae Sik, a troubled middle aged man and Sang Hwan, a troubled youth will meet in the ring with their respective mission. To change their life.',
  'https://m.media-amazon.com/images/M/MV5BMDAyZTMzNzgtNGJkMS00Yzk3LWE3YmQtNjViMjhiZTkzMGY3XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['action', 'drama', 'sport']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  134,
  'Ryoo Seung-wan',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Crying Fist'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Host',
  'A monster emerges from Seoul''s Han River and begins attacking people. One victim''s loving family does what it can to rescue her from its clutches.',
  'https://m.media-amazon.com/images/M/MV5BMTU4OTEzMzg4OF5BMl5BanBnXkFtZTcwMzUyNzYzMQ@@._V1_.jpg',
  2006,
  array['drama', 'horror', 'sci-fi']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  120,
  'Bong Joon Ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Host'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Silenced',
  'Based on real events, this film depicts the story of a school for the hearing-impaired where young deaf students were sexually assaulted by the faculty members over a long period of time.',
  'https://m.media-amazon.com/images/M/MV5BMTUyNTc3NTg3M15BMl5BanBnXkFtZTgwMzc1MTAzMjE@._V1_.jpg',
  2011,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  125,
  'Hwang Dong-hyuk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Silenced'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Welcome to Dongmakgol',
  'Soldiers from both sides of the Korean divide live among villagers who know nothing of the war.',
  'https://m.media-amazon.com/images/M/MV5BNjg3OThiZjYtMDMyZS00MGQzLThiYmUtZjUyZmYzMjVjOTcyXkEyXkFqcGc@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'war']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  133,
  'Kwang-Hyun Park',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Welcome to Dongmakgol'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'I''m a Cyborg, But That''s OK',
  'A girl who thinks she is a combat cyborg checks into a mental hospital, where she encounters other psychotics. Eventually, she falls for a man who thinks he can steal people''s souls.',
  'https://m.media-amazon.com/images/M/MV5BMTAwMjQ0NjQzMTReQTJeQWpwZ15BbWU4MDEyNjg3NTIx._V1_.jpg',
  2006,
  array['comedy', 'drama', 'romance']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  107,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'I''m a Cyborg, But That''s OK'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Moebius',
  'A father driven into desire, a son coveting that of his father''s and the sorrowful maternity that hovers them into tragedy.',
  'https://m.media-amazon.com/images/M/MV5BNjkwMDA0Njg0OV5BMl5BanBnXkFtZTgwNTcxNDUxMjE@._V1_.jpg',
  2013,
  array['drama', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  89,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Moebius'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Man of Vendetta',
  'The life of a respected minister and loving family man shatters after his daughter is kidnapped. When she is not returned, he renounces God and becomes a corrupt businessman.',
  'https://m.media-amazon.com/images/M/MV5BOTNmMGMwNjYtNDBkZC00MjNhLWIxNjktNGMwMTAwMDE5YTQwXkEyXkFqcGc@._V1_.jpg',
  2010,
  array['action', 'drama', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  113,
  'Min-ho Woo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Man of Vendetta'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fists of Legend',
  'Three old friends and rivals get set to face off on a TV program billed as "The Greatest Fight Show on Earth".',
  'https://m.media-amazon.com/images/M/MV5BNDE3ODI2MTY3M15BMl5BanBnXkFtZTgwOTcyMjEyMjE@._V1_.jpg',
  2013,
  array['action']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  154,
  'Kang Woo-suk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Fists of Legend'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Painted Fire',
  'In a time of political and social unrest in nineteenth-century Korea, an uncouth, self-taught painter explores his natural talent amidst the repressive world around him.',
  'https://m.media-amazon.com/images/M/MV5BMmYzYjMxMTctMzllZS00N2FkLWIzNGQtMGFmZjczZTY0MGM1XkEyXkFqcGc@._V1_.jpg',
  2002,
  array['biography', 'drama', 'history']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  120,
  'Im Kwon-taek',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Painted Fire'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Attack the Gas Station',
  'Four disaffected youths rob a gas station but find their plans complicated and sidetracked before the night is through.',
  'https://m.media-amazon.com/images/M/MV5BMTMyMjYyNDY2MV5BMl5BanBnXkFtZTcwMzU2NzAzMQ@@._V1_.jpg',
  1999,
  array['comedy', 'crime']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  113,
  'Sang-Jin Kim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Attack the Gas Station'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Moby Dick',
  'A mysterious explosion occurs at the Balam Bridge in Seoul on November 20th, 1994. In front of hot-blooded local news reporter Lee Bang-Woo, Yoon Hyeok appears. Yoon Hyeok is from the same hometown as Lee Bang-Woo, but they haven''t seen each other in a long time. Yoon Hyeok hands over documents to Lee Bang-Woo and hints that the case of the Balam Bridge was fabricated. In order to uncover the truth behind the case, Lee Bang-Woo teams up with fellow reporters Son Jin-gi and Seong Hyo-gwan. While they dig further for the truth, they come within the cross hairs of men intent on covering up the case. Their office is broken into and they are threatened. Meanwhile, Yoon Hyeok holds the key to case ...',
  'https://m.media-amazon.com/images/M/MV5BOGNmNDRhYzAtOWU5Yi00M2MzLWIxZmUtMDVmNmQ3MDcwMDA5XkEyXkFqcGc@._V1_.jpg',
  2011,
  array['action']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  112,
  'Park In-je',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Moby Dick'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Quiet Family',
  'A family opens a mountain inn where their first guest commits suicide. Suddenly all their guests befall horrible fates.',
  'https://m.media-amazon.com/images/M/MV5BNzNkYjdlM2QtYmNkZS00NDFiLWIyYzgtYjEwZmQ5NzllYjNhXkEyXkFqcGc@._V1_.jpg',
  1998,
  array['comedy', 'crime', 'horror']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  101,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Quiet Family'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The President''s Last Bang',
  'A look at the life of President Park Chung-hee and the events leading up to his assassination.',
  'https://m.media-amazon.com/images/M/MV5BMTQzODI1NDc3OF5BMl5BanBnXkFtZTcwODgwNzA0MQ@@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'history']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  102,
  'Im Sang-soo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The President''s Last Bang'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'New World',
  'An undercover cop finds it difficult to play both a cop and a goon.',
  'https://m.media-amazon.com/images/M/MV5BMTYxODg5ODMxOV5BMl5BanBnXkFtZTcwNzkwMzYyOQ@@._V1_.jpg',
  2013,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  135,
  'Park Hoon-jung',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'New World'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Secret Sunshine',
  'A woman moves to the town where her dead husband was born. As she tries to fit in, another tragic event overturns her life.',
  'https://m.media-amazon.com/images/M/MV5BMjAzMDE5MDM5OV5BMl5BanBnXkFtZTgwMDE1NzE1MjE@._V1_.jpg',
  2007,
  array['drama']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  142,
  'Lee Chang-dong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Secret Sunshine'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Shiri',
  'South Korean agents Ryu and Lee are tracking a female assassin from North Korea who has mysteriously disappeared. With new killings and the theft of a deadly bomb, time is running out to catch her.',
  'https://m.media-amazon.com/images/M/MV5BYzRlNjczZjEtNGQyYy00YmIyLWI1MjAtOTI4YzUzOTI1YzYzXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['action', 'thriller']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  125,
  'Kang Je-kyu',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Shiri'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Poetry',
  'A sixty-something woman, faced with the discovery of a heinous family crime and in the early stages of Alzheimer''s disease, finds strength and purpose when she enrolls in a poetry class.',
  'https://m.media-amazon.com/images/M/MV5BYjBlMDUwYzEtODcwMy00MDgzLTlhYmQtYWM5ZWNmOTk3Y2U2XkEyXkFqcGc@._V1_.jpg',
  2010,
  array['drama']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls000985554.',
  139,
  'Lee Chang-dong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Poetry'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Front Line',
  'A drama centered on the Korean War''s final battle that will determine the border between north and south.',
  'https://m.media-amazon.com/images/M/MV5BMzM1NzM2NzM0NF5BMl5BanBnXkFtZTcwMzY0NDUyNw@@._V1_.jpg',
  2011,
  array['action', 'drama', 'history']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  133,
  'Hun Jang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Front Line'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Three... Extremes',
  'An Asian cross-cultural trilogy of horror films from accomplished indie directors.',
  'https://m.media-amazon.com/images/M/MV5BNzM5MTM2OTgzOF5BMl5BanBnXkFtZTcwNzc4NTUzMQ@@._V1_.jpg',
  2004,
  array['horror']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  125,
  'Fruit Chan',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Three... Extremes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Housemaid',
  'A man''s affair with his family''s housemaid leads to dark consequences.',
  'https://m.media-amazon.com/images/M/MV5BN2EzODIwYjItNTQ1YS00NzFjLWI3MTQtNjBlOWQ0MzUyMzQ5XkEyXkFqcGc@._V1_.jpg',
  2010,
  array['drama', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  107,
  'Im Sang-soo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Housemaid'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Take Care of My Cat',
  'In the port city of Icheon, five female friends struggle to stay close while forging a life for themselves after high school. When one of the group, upwardly-mobile Hae-ju, moves to Seoul, the other girls deal with the loss in different ways. Feeling most rejected, shy Ji-yeong finds comfort in her new friendship with rebel Tae-hee.',
  'https://m.media-amazon.com/images/M/MV5BY2MyMTc5OTUtOGRlNS00NmExLWI4ZDYtYTQxODMwNWNjNjk2XkEyXkFqcGc@._V1_.jpg',
  2001,
  array['drama']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  112,
  'Jae-eun Jeong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Take Care of My Cat'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Unjust',
  'When the most probable serial killer suspect dies and the case looks like it''s reached a dead end, police brass decide to create a killer - and anyone will do.',
  'https://m.media-amazon.com/images/M/MV5BMTY2MTI5ODIzMl5BMl5BanBnXkFtZTgwNzI3MDE0MjE@._V1_.jpg',
  2010,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  119,
  'Ryoo Seung-wan',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Unjust'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Handmaiden',
  'In 1930s Korea, a girl is hired as a handmaiden to a Japanese heiress who lives a secluded life on a countryside estate. But the maid has a secret: She is a pickpocket recruited by a swindler to help seduce the Lady and steal her fortune.',
  'https://m.media-amazon.com/images/M/MV5BOTllZDI1OGItOGUxNS00OGZhLWIzMjAtYzllZTY1YTA0ZmYwXkEyXkFqcGc@._V1_.jpg',
  2016,
  array['drama', 'romance', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  145,
  'Park Chan-wook',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Handmaiden'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Time',
  'To save her relationship, a woman puts herself through extensive plastic surgery.',
  'https://m.media-amazon.com/images/M/MV5BMjA1NjU5OTcxNl5BMl5BanBnXkFtZTcwNTMyNjYzMQ@@._V1_.jpg',
  2006,
  array['drama', 'mystery', 'romance']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  97,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Time'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Tell Me Something',
  'Lieutenant Cho, a cop on the edge, is mourning his mother''s recent death while under investigation for graft; on top of that he is suddenly put in charge of a seemingly-impenetrable mystery.',
  'https://m.media-amazon.com/images/M/MV5BYTE1NTAyZjItNDI5Mi00MzRhLTlhNDItMzVlMWFhYWM1ZjVkXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  118,
  'Yun-hyeon Jang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Tell Me Something'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Nameless Gangster: Rules of the Time',
  'On the verge of being fired, a corrupt customs official finds a haul of drugs and teams up with a vicious gangster to become the most powerful crime partnership in Busan.',
  'https://m.media-amazon.com/images/M/MV5BNGYyZjdiM2UtMjk2Ni00ZmZiLThjNzEtNDRiZWZmMWNhM2Q1XkEyXkFqcGc@._V1_.jpg',
  2012,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  134,
  'Yoon Jong-bin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Nameless Gangster: Rules of the Time'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Shower',
  'Country boy Suk-ie learns the meaning of love and loss when he meets city girl Yeon-ie.',
  'https://m.media-amazon.com/images/M/MV5BMDhmMmQ0NDMtZDk3Ni00ZWU3LWIxMmItODZiNzkxYzE4ZGQxXkEyXkFqcGc@._V1_.jpg',
  1979,
  array['drama', 'romance']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  100,
  'Young Nam Ko',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Shower'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bedevilled',
  'A woman subject to mental, physical and sexual abuse on a remote island seeks a way out.',
  'https://m.media-amazon.com/images/M/MV5BMjAyNDEwMDgzMl5BMl5BanBnXkFtZTcwNzMyMTYwNQ@@._V1_.jpg',
  2010,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  115,
  'Cheol-soo Jang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bedevilled'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Isle',
  'Working at a fishing resort in an idyllic location, but surrounded by various facets of human unpleasantness, a young mute woman falls in love with a man on the run from the law for committing murder.',
  'https://m.media-amazon.com/images/M/MV5BZWJhODRiNGYtZGNlOS00ZGM0LWEzYWQtZGE0MDNhMDFlNWIxXkEyXkFqcGc@._V1_.jpg',
  2000,
  array['drama', 'thriller']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  90,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Isle'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sad Movie',
  'Follows the lives of four very different couples as they deal with love, loss and life in these romantic, loosely interconnected tales.',
  'https://m.media-amazon.com/images/M/MV5BOThhMDkwMWMtNDYzYy00NzQ3LTg5ODQtMTgzZjY4NDI4ODk2XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['comedy', 'drama', 'romance']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  108,
  'Kwon Jong-kwan',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Sad Movie'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Last Witness',
  'A detective investigating a murder follows a convoluted trail littered with treachery, ruined lives, and tragedy.',
  'https://m.media-amazon.com/images/M/MV5BMmI0NmYzMTctNmI0NS00ZDEwLWJlYWMtNzAyZDYyODU5YjBiXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  158,
  'Lee Doo-yong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Last Witness'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Antarctic Journal',
  'Strange things begin happening to an expedition deep in the Antarctic.',
  'https://m.media-amazon.com/images/M/MV5BNWY2OTkwNzQtNmE0Yy00MjVhLTgzNTctNmExMDg0ZmFkYzQ3XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  115,
  'Pil-sung Yim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Antarctic Journal'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Public Enemy',
  'A detective plays cat-and-mouse with a banker who brutally murdered his own parents.',
  'https://m.media-amazon.com/images/M/MV5BYmIwMGNhMDAtZjI0MS00YzdlLThlMDUtMTI5ZjFjN2M0MzMwXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['action', 'crime']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  138,
  'Kang Woo-suk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Public Enemy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Voice of a Murderer',
  'One day, the only son of famous news anchor HAN Kyung-bae, disappears without a trace. Soon, the kidnapper calls the mother demanding a $100,000 ransom. The police assign a veteran inspector to the case and assemble a top-notch task force to work under his command. But the kidnapper constantly outwits the police and continues calling the parents with yet more instructions for the money drop.',
  'https://m.media-amazon.com/images/M/MV5BNjk2MjY0ODE2OV5BMl5BanBnXkFtZTgwODI0NzE1MjE@._V1_.jpg',
  2007,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  122,
  'Park Jin-Pyo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Voice of a Murderer'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Moss',
  'A mysterious person calls a young man and informs him that his estranged father has died in a country village. The curious son travels to the town to discover what happened. From there out the audience is led on a thrilling and hauntingly atmospheric journey into the history of the father and the truth about his relationship to the threatening and violent locals. The film is 2h40m, long even for Korean standards, but it is the magically haunting and at the same time threatening atmosphere in the film that sustains the audience interest. Let yourself be carried away...',
  'https://m.media-amazon.com/images/M/MV5BMjM4MjAwNjI3OF5BMl5BanBnXkFtZTgwOTk3MDE0MjE@._V1_.jpg',
  2010,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  163,
  'Kang Woo-suk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Moss'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Rainbow Eyes',
  'Officers Kyung-yoon CHO and Eun-joo PARK are on the hunt a killer following duo of ghastly murders. The victims carry a common military past, and the secret of their past must be unraveled to find the killer.',
  'https://m.media-amazon.com/images/M/MV5BMTQ3MDU1Mjg3N15BMl5BanBnXkFtZTgwNDc1MjA2MDE@._V1_.jpg',
  2007,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  99,
  'Yun-ho Yang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Rainbow Eyes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Black House',
  'Jun-oh, an insurance claims agent, faces off with a client who he suspects of committing murders with the intention of collecting insurance premiums.',
  'https://m.media-amazon.com/images/M/MV5BMTQzMzg4MTQ0MV5BMl5BanBnXkFtZTgwNDkzNzE1MjE@._V1_.jpg',
  2007,
  array['horror', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  104,
  'Terra Shin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Black House'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Seven Days',
  'A successful lawyer who, in order to save her daughter, is pressured into defending the innocence of a man slated to receive the death penalty.',
  'https://m.media-amazon.com/images/M/MV5BMzk3MTI1MzQ3NV5BMl5BanBnXkFtZTcwMzU2NTk5Mw@@._V1_.jpg',
  2007,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  125,
  'Won Shin-yeon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Seven Days'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Blind',
  'A blind Min Soo-ah aids the police in investigating the disappearance of a female student. The taxi driver who drove her on the night of the car accident that left her blind may be the perpetrator.',
  'https://m.media-amazon.com/images/M/MV5BNjhiZTVlNzYtNzU5MC00ZTBhLWFlZTEtMTEwZTQyMzMxNjBlXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls000985554.',
  111,
  'Ahn Sang-hoon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Blind'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Arang',
  'Veteran detective So-young and her rookie partner Hyun-gi happen onto an incendiary homicide case. They discover that the present case is somehow related to the mysterious death of a girl ten years previously.',
  'https://m.media-amazon.com/images/M/MV5BMTY5NTJiZmItNWVlZS00OWRhLWFmNTItMjRhMjMwYTQyNGRkXkEyXkFqcGc@._V1_.jpg',
  2006,
  array['horror', 'thriller']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  97,
  'Ahn Sang-hoon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Arang'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Warrior',
  '1375. Nine Koryo warriors, envoys exiled by Imperial China, battle to protect a Chinese Ming Princess from Mongolian troops.',
  'https://m.media-amazon.com/images/M/MV5BMDQ4MDg1MjQtNDdjZi00ZDQ2LTkwNDMtNTNhNDJiZmQ5MjJjXkEyXkFqcGc@._V1_.jpg',
  2001,
  array['action', 'drama', 'history']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  158,
  'Sung Soo Kim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Warrior'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Haunters',
  'Cho-In can control other people''s minds when they are within his field of sight.Except one man.',
  'https://m.media-amazon.com/images/M/MV5BYjBiNDI0NzUtYzBhNi00NzlmLTkwMDgtY2MwMWQ5ZjdkYjFlXkEyXkFqcGc@._V1_.jpg',
  2010,
  array['action', 'sci-fi', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  119,
  'Min-suk Kim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Haunters'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Samaritan Girl',
  'Jae-Young is an amateur prostitute who sleeps with men while her best friend Yeo-Jin "manages" her, fixing dates, taking care of the money and making sure the coast is clear. When Jae-Young falls in love with one of those man she suppresses her feelings towards him in respect of her friend who''s jealous.',
  'https://m.media-amazon.com/images/M/MV5BY2RkMmI1OGMtOTYzZS00NjczLWI3ODktNmU0NGExNzNiN2JlXkEyXkFqcGc@._V1_.jpg',
  2004,
  array['drama']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  97,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Samaritan Girl'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Howling',
  'Veteran detective Sang-gil and beat cop Eun-yeong are in charge of a case that seems to involve a simple act of self-immolation. Sang-gil initially thinks that it was an accident, but dog bite marks discovered on the body lead him to believe that someone had terrorized and murdered the victim. He and Eun-yeong investigate the source of the drugs found in the body and discover the victim had been pimping out young girls. At the same time, another murder involving a wolf-dog crossbreed occurs The two cases are labeled serial killings. With a connection between the victims uncovered, Sang-gil and Eun-yeong track down a potential witness. While questioning her, one of the mysterious dogs strikes out of the blue, killing the witness and stunning the cops.',
  'https://m.media-amazon.com/images/M/MV5BMTYxNjQ4MzczMF5BMl5BanBnXkFtZTgwODI1MTAzMjE@._V1_.jpg',
  2012,
  array['action', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  114,
  'Ha Yoo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Howling'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Forgotten',
  'Jin-seok, 21-year-old, moves into a new house with his family. One night, his beloved brother is kidnapped before his eyes. After long silence of 19 days, suddenly Yu-seok returns home. And soon Jin-seok feels Yu-seok is a total stranger.',
  'https://m.media-amazon.com/images/M/MV5BYWU5YzhiNTEtMDg5ZC00ZWRiLTkyNmItYzRkNGNmMzY5NmRmXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  108,
  'Jang Hang-jun',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Forgotten'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Secret',
  'Sung-ryeol is a detective in charge of violent crimes. He is an upright man, but is having an affair with his colleague''s wife, and it is the reason he loses his own daughter in a car accident. Wracked with guilt but unable to explain to his wife, Ji-yeon, what happened on that day and why, he loses her in her grief. Ji-yeon comes home shaken and bloody late one evening, peaking Sung-ryeol''s curiosity about his wife''s behavior. The next day, Sung-ryeol finds trace evidence that points to his wife while investigating a murder scene. He presumes that his wife is connected to the case, and does all he can to keep her from being identified as a suspect. When an unidentified man shows up claiming to know Ji-yeon is involved and asking for money, the situation is made worse by Ji-yeon refusing to offer Sung-ryeol an explanation or tell him any kind of truth.',
  'https://m.media-amazon.com/images/M/MV5BMTcxMTI5ODg4N15BMl5BanBnXkFtZTgwNTU0MTE0MjE@._V1_.jpg',
  2009,
  array['thriller']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  105,
  'Je-gu Yun',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Secret'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Voice',
  'While practicing after hours in her high school, an aspiring singer is mysteriously killed and her body vanishes. Her invisible ghost is trapped in the school, but her best friend is able to hear her voice.',
  'https://m.media-amazon.com/images/M/MV5BNzc0MTMxMzU4MF5BMl5BanBnXkFtZTgwODU1OTE3MjE@._V1_.jpg',
  2005,
  array['horror']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  104,
  'Equan Choi',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Voice'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hansel and Gretel',
  'After meeting a mysterious girl on an dark stretch of road, a young salesman is invited to a beautiful house with bizarre secrets and no way to escape.',
  'https://m.media-amazon.com/images/M/MV5BNmYzMzA5OWEtMTdiYy00NjEyLTg4ZDAtNjZhMWY3Y2NlOTEzXkEyXkFqcGc@._V1_.jpg',
  2007,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  117,
  'Pil-sung Yim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hansel and Gretel'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'R-Point',
  'During the Vietnam War, a South Korean base receives a radio transmission from a missing squad, presumed dead, and sends a platoon to rescue the lost squad from the R-Point.',
  'https://m.media-amazon.com/images/M/MV5BMjM5MTExNzE0Ml5BMl5BanBnXkFtZTgwNjM5MDQ2MzE@._V1_.jpg',
  2004,
  array['action', 'horror', 'war']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  107,
  'Su-chang Kong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'R-Point'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Into the Mirror',
  'An ex-cop, now working as a security guard in a shopping mall, tries to uncover the secret behind a series of mysterious deaths linked to mirrors.',
  'https://m.media-amazon.com/images/M/MV5BNTc5ZmY0MDUtNjY0YS00NTZkLTlhNmMtNjMyYjA5MDVmODNmXkEyXkFqcGc@._V1_.jpg',
  2003,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  113,
  'Kim Sung-ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Into the Mirror'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bad Guy',
  'An unfeeling gangster seeks to ruin the life of a young girl who rejected him. He forces her into prostitution and spies on her regularly, then he soon begins to fall for her.',
  'https://m.media-amazon.com/images/M/MV5BYjE0YmE3YzgtMjUyNC00NmZiLTg3ZGMtOTBlZDcwYzdkZWJhXkEyXkFqcGc@._V1_.jpg',
  2001,
  array['drama', 'romance']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  100,
  'Kim Ki-duk',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bad Guy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bloody Reunion',
  'Buried grudges have disasterous consequences for a class reunion in this unapologetically bloody film from Korean director Dae-wung Lim.',
  'https://m.media-amazon.com/images/M/MV5BMTc4OTA1NzMzMV5BMl5BanBnXkFtZTgwNjgwODkwMzE@._V1_.jpg',
  2006,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  93,
  'Dae-wung Lim',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bloody Reunion'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Memento Mori',
  'In this second installment of the Whispering Corridors series, a young girl finds a strange diary, capable of arousing hallucinations, kept by two of her senior fellow-students who seem to have an unusually close bond.',
  'https://m.media-amazon.com/images/M/MV5BYTA4NWE2YTgtMTljZS00OTgxLWFmZDktZmVmZGI3NTIxN2U0XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['horror', 'romance', 'drama']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  97,
  'Kyu-dong Min',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Memento Mori'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'I Wish I Had a Wife',
  'Bong Soo has been working as manager of a small bank in an apartment complex for three years. During his three years there, no, for 23 years if you count his school days, he has never been late. However, he purposely decides to skip work one day. There is only one reason. Inside a subway train that has suddenly stopped on his way to work, everyone around him reaches for their cell phones to call someone. At that moment, he realized that he does not have a single person to call. He does not know that inside the educational center across the street from the bank where he works, a 27-year-old woman Won Ju is looking over to him, nourishing a small love. Bong Soo and Won Ju run into each other every day, at the Ramen restaurant, at the bank, at the bus station - Various trivial incidents occur, but Bong Soo still does not truly recognize Won Ju''s presence.',
  'https://m.media-amazon.com/images/M/MV5BYzM2MmExZDItYWVkNi00MmU0LThiNzUtMDM3M2RiYTFjNDA3XkEyXkFqcGc@._V1_.jpg',
  2001,
  array['comedy', 'drama', 'romance']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  123,
  'Heung-sik Park',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'I Wish I Had a Wife'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Christmas in August',
  'A terminally ill bachelor Hahn Suk-Kyu runs a photo studio in Seoul. One day a young meter maid Shim Eun-Ha visits his studio. Over time they form an untimely though touching bond which leads to an unfinished love story.',
  'https://m.media-amazon.com/images/M/MV5BMDY1NzQ0NGItZDA0Zi00YjQ3LWJkNDQtYjYyYjllMzQzMDQxXkEyXkFqcGc@._V1_.jpg',
  1998,
  array['drama', 'romance']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls000985554.',
  97,
  'Hur Jin-ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Christmas in August'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Taxi Driver',
  'A widowed father and taxi driver who drives a German reporter from Seoul to Gwangju to cover the 1980 uprising, soon finds himself regretting his decision after being caught in the violence around him.',
  'https://m.media-amazon.com/images/M/MV5BNTczN2QxM2MtMjBkYi00ZDk4LWI3MGYtMzcyYTAxM2JmMzJiXkEyXkFqcGc@._V1_.jpg',
  2017,
  array['action', 'drama', 'history']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  137,
  'Hun Jang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Taxi Driver'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Burning',
  'Jong-su bumps into a girl who used to live in the same neighborhood, who asks him to look after her cat while she''s on a trip to Africa. When back, she introduces Ben, a mysterious guy she met there, who confesses his secret hobby.',
  'https://m.media-amazon.com/images/M/MV5BZjVlOGRmMTgtZDU4NS00Y2JmLTgxYTMtZmNhMGE1ODIwNTkzXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['drama', 'mystery', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  148,
  'Lee Chang-dong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Burning'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Cello',
  '10 years ago, Mi-ju lost her ambition to become a cellist when her entire family was brutally murdered. Due to the trauma, she now leads a quiet life as a teacher with her husband and children. However, dreadful events begin to occur.',
  'https://m.media-amazon.com/images/M/MV5BODE4YTU5N2YtOTY5MS00OTlkLTlmZDItY2VmNTUzZjk4OGY1XkEyXkFqcGc@._V1_.jpg',
  2005,
  array['horror', 'mystery']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls000985554.',
  94,
  'Lee Woo-cheol',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Cello'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Wailing',
  'Soon after a stranger arrives in a little village, a mysterious sickness starts spreading. A policeman, drawn into the incident, is forced to solve the mystery in order to save his daughter...',
  'https://m.media-amazon.com/images/M/MV5BODkwMTgxNjA2NF5BMl5BanBnXkFtZTgwMDc0OTcwOTE@._V1_.jpg',
  2016,
  array['drama', 'horror']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls000985554.',
  156,
  'Na Hong-jin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Wailing'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Drug King',
  'Set in Busan, South Korea during the 1970s, Lee Doo-sam builds an empire as a drug smuggler in the Busan underworld, while public prosecutor Kim In-goo attempts to take down Lee Doo-sam.',
  'https://m.media-amazon.com/images/M/MV5BNjcwMWUxYzgtMDNlYy00NDdjLWFjNzItOGQ2MDcyZGM4YTIzXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  139,
  'Min-ho Woo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Drug King'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Train to Busan',
  'While a zombie virus breaks out in South Korea, passengers struggle to survive on the train from Seoul to Busan.',
  'https://m.media-amazon.com/images/M/MV5BMTkwOTQ4OTg0OV5BMl5BanBnXkFtZTgwMzQyOTM0OTE@._V1_.jpg',
  2016,
  array['action', 'horror', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  118,
  'Yeon Sang-ho',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Train to Busan'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Muse',
  'In this film, Lee Jeok-yo is a respected poet who cares fondly for his 30ish year old disciple Seo Ji-woo. The world of these two men is shaken when 17-year-old Han Eun-gyo comes into the picture.',
  'https://m.media-amazon.com/images/M/MV5BZWViOGVlNjgtYTc4OS00NDRlLWExMTktOGQ2N2JjZWQwOWJlXkEyXkFqcGc@._V1_.jpg',
  2012,
  array['drama', 'romance']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  129,
  'Jung Ji-woo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Muse'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Peppermint Candy',
  'Following a man''s suicide, time traverses back to reveal six chapters of his life on why he committed suicide.',
  'https://m.media-amazon.com/images/M/MV5BYmY4YjIzY2QtZjJjMS00ZDQ4LTgyNzUtZmJlZTg5YTExMDE1XkEyXkFqcGc@._V1_.jpg',
  1999,
  array['drama']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls000985554.',
  129,
  'Lee Chang-dong',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Peppermint Candy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Gangster, the Cop, the Devil',
  'A crime boss teams up with a cop to track down a serial killer.',
  'https://m.media-amazon.com/images/M/MV5BMTdjOTAzOTgtNWI1My00YzZkLWI2YWMtYjQ2MTAxOTI4YWQzXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  109,
  'Lee Won-tae',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Gangster, the Cop, the Devil'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Miracle in Cell No. 7',
  'A story about the love between a mentally-ill father and his lovingly adorable daughter.',
  'https://m.media-amazon.com/images/M/MV5BNDg0NmExZjYtNjBkYS00ZmRiLTk4MjQtYjM4YTFiMTBlZjlkXkEyXkFqcGc@._V1_.jpg',
  2013,
  array['comedy', 'drama']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  127,
  'Lee Hwan-kyung',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Miracle in Cell No. 7'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hope',
  'Story of an 8-year-old girl who faces a horrible rape that damages her internally and affects her emotionally, trying to overcome all the obstacles following the incident with the good support of those around her.',
  'https://m.media-amazon.com/images/M/MV5BNzBiMDNhOWMtMTI0ZC00MjUxLTk0NzYtYzQxZGRjMjFmNDA3XkEyXkFqcGc@._V1_.jpg',
  2013,
  array['drama']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  122,
  'Lee Joon-ik',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hope'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Attorney',
  'An ambitious tax attorney decides to represent an old friend in court.',
  'https://m.media-amazon.com/images/M/MV5BMjI2ODg5NDcxN15BMl5BanBnXkFtZTgwMDEzNzIwMTE@._V1_.jpg',
  2013,
  array['crime', 'drama', 'history']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls000985554.',
  127,
  'Woo-seok Yang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Attorney'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Man Standing Next',
  'In the 1970s, Korea is under the absolute control of President Park, who controls the KCIA, the organization with the edge over any branch of government.',
  'https://m.media-amazon.com/images/M/MV5BOGYyNGIwNDItMDRjOS00YmZiLWIxMTAtMTQ3YzA0MTAwMzkxXkEyXkFqcGc@._V1_.jpg',
  2020,
  array['thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls000985554.',
  114,
  'Min-ho Woo',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Man Standing Next'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Age of Shadows',
  'Korean resistance fighters smuggle explosives to destroy facilities controlled by Japanese forces in this period action thriller.',
  'https://m.media-amazon.com/images/M/MV5BMjA4NDk2MzYxM15BMl5BanBnXkFtZTgwNzA4MDYyMDI@._V1_.jpg',
  2016,
  array['action', 'history', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls000985554.',
  140,
  'Kim Jee-woon',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Age of Shadows'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Time to Hunt',
  'In the near future, a financial crisis will hit Korea and slums arise. From those areas, a group of young people commit crime to survive.',
  'https://m.media-amazon.com/images/M/MV5BZTI2OTlhOTQtYzY5My00MzIwLWFiMWQtNDZhYmQ4OGQ0MzEzXkEyXkFqcGc@._V1_.jpg',
  2020,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls000985554.',
  134,
  'Yoon Sunghyun',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Time to Hunt'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Secretly Greatly',
  'Three elite North Korean sleeper agents live undercover for so long that they believe their cover stories are their real identities. They''re shocked when they are ordered to kill one another or face death at the hands of an elite hit team.',
  'https://m.media-amazon.com/images/M/MV5BMjhlZmMyNGQtYzQyMi00ZDllLWJhZGEtZDJlMWM5YmIxYTQ0XkEyXkFqcGc@._V1_.jpg',
  2013,
  array['action', 'comedy', 'drama']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls000985554.',
  124,
  'Cheol-soo Jang',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Secretly Greatly'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '24 Hours to Die',
  'Chul-min is a simple truck driver whose usual cargo is liquor, vegetables and other necessities.',
  'https://m.media-amazon.com/images/M/MV5BMTg5MjY3NTY5MF5BMl5BanBnXkFtZTgwMTM5MzA5NjE@._V1_.jpg',
  2008,
  array['crime', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls000985554.',
  96,
  'Kwon Hyeong-jin',
  'Korean',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '24 Hours to Die'
);

-- ---- 0011_seed_imdb_ls072530725.sql ----
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'La isla minima',
  'In the MARSHLAND a serial killer is on the loose. Two homicide detectives who appear to be poles apart must settle their differences and bring the murderer to justice before more young women lose their lives.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg0NzY0MjI0NF5BMl5BanBnXkFtZTgwMjcxMjU5MzE@._V1_UY209_CR3,0,140,209_AL_.jpg',
  2014,
  array['crime', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls072530725.',
  105,
  'Alberto Rodriguez',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'La isla minima'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mystic River',
  'The lives of three men who were childhood friends are shattered when one of them has a family tragedy.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTIzNDUyMjA4MV5BMl5BanBnXkFtZTYwNDc4ODM3._V1_UY209_CR0,0,140,209_AL_.jpg',
  2003,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls072530725.',
  138,
  'Clint Eastwood',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mystic River'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Killing',
  'A police investigation, the saga of a grieving family, and a Seattle mayoral campaign all interlock after the body of 17-year-old Rosie Larsen is found in the trunk of a submerged car.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ5MTUxMzU3Ml5BMl5BanBnXkFtZTgwMDU3NDYxMjE@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2011,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  45,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Killing'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Se7en',
  'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX140_CR0,0,140,209_AL_.jpg',
  1995,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  127,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Se7en'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Usual Suspects',
  'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BYTViNjMyNmUtNDFkNC00ZDRlLThmMDUtZDU2YWE4NGI2ZjVmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY209_CR0,0,140,209_AL_.jpg',
  1995,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  106,
  'Bryan Singer',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Usual Suspects'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Girl with the Dragon Tattoo',
  'Journalist Mikael Blomkvist is aided in his search for a woman who has been missing for forty years by Lisbeth Salander, a young computer hacker.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTczNDk4NTQ0OV5BMl5BanBnXkFtZTcwNDAxMDgxNw@@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2011,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  158,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Girl with the Dragon Tattoo'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Zodiac',
  'In the late 1960s/early 1970s, a San Francisco cartoonist becomes an amateur detective obsessed with tracking down the Zodiac Killer, an unidentified individual who terrorizes Northern California with a killing spree.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQxNjc2NzAwNF5BMl5BanBnXkFtZTcwMDg3NzMzMw@@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2007,
  array['crime', 'drama', 'history']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls072530725.',
  157,
  'David Fincher',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Zodiac'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'L.A. Confidential',
  'As corruption grows in 1950s LA, three policemen - one strait-laced, one brutal, and one sleazy - investigate a series of murders with their own brand of justice.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMDQ2YzEyZGItYWRhOS00MjBmLTkzMDUtMTdjYzkyMmQxZTJlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1997,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.3::numeric,
  'Catalogue: IMDb list ls072530725.',
  138,
  'Curtis Hanson',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'L.A. Confidential'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Eastern Promises',
  'A Russian teenager living in London who dies during childbirth leaves clues to a midwife in her journal that could tie her child to a rape involving a violent Russian mob family.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTcwMzU0OTY3NF5BMl5BanBnXkFtZTYwNzkwNjg2._V1_UY209_CR0,0,140,209_AL_.jpg',
  2007,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls072530725.',
  100,
  'David Cronenberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Eastern Promises'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Oldeuboi',
  'After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must find his captor in five days.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2003,
  array['mystery', 'thriller']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls072530725.',
  120,
  'Chan-wook Park',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Oldeuboi'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Chinatown',
  'A private detective hired to expose an adulterer finds himself caught up in a web of deceit, corruption, and murder.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BYWRkNGJhMmEtMWM3Ni00MDc3LThhMTQtMWI2OTMxYmE5MTZhXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1974,
  array['drama', 'mystery', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  130,
  'Roman Polanski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Chinatown'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Twin Peaks: Fire Walk with Me',
  'A young FBI agent disappears while investigating a murder miles from Twin Peaks that may be related to the future murder of Laura Palmer; the last week of the life of Laura Palmer is chronicled.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMzc5ODcyNTYtMDAwNy00MDhjLWFmOWUtNGVhMDRlYjE1YzNjXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX140_CR0,0,140,209_AL_.jpg',
  1992,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  135,
  'David Lynch',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Twin Peaks: Fire Walk with Me'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Insomnia',
  'Two Los Angeles homicide detectives are dispatched to a northern town where the sun doesn''t set to investigate the methodical murder of a local teen.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BYzlkZTEyYjUtMTY5NS00ZjU0LTk5OTYtM2M0ZDg1NmNjMzhkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX140_CR0,0,140,209_AL_.jpg',
  2002,
  array['drama', 'mystery', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  118,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Insomnia'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Identity',
  'Stranded at a desolate Nevada motel during a nasty rain-storm, ten strangers become acquainted with each other when they realize that they''re being killed off one by one.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMjE2NzgyNDYzNl5BMl5BanBnXkFtZTYwODM2Nzc2._V1_UX140_CR0,0,140,209_AL_.jpg',
  2003,
  array['mystery', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls072530725.',
  90,
  'James Mangold',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Identity'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'In the Valley of Elah',
  'A retired military investigator works with a police detective to uncover the truth behind his son''s disappearance following his return from a tour of duty in Iraq.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg2ODAxOTE2OF5BMl5BanBnXkFtZTcwODYxODE1MQ@@._V1_UY209_CR1,0,140,209_AL_.jpg',
  2007,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  121,
  'Paul Haggis',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'In the Valley of Elah'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Shutter Island',
  'In 1954, a U.S. Marshal investigates the disappearance of a murderer, who escaped from a hospital for the criminally insane.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BY2NkNTcxNjAtODhjMS00Mjg2LWI1OGItMjRhMGJlODBkZTVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzAxMjE1NDg@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2010,
  array['mystery', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls072530725.',
  138,
  'Martin Scorsese',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Shutter Island'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Rear Window',
  'A wheelchair-bound photographer spies on his neighbours from his apartment window and becomes convinced one of them has committed murder.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1954,
  array['mystery', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls072530725.',
  112,
  'Alfred Hitchcock',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Rear Window'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Silence of the Lambs',
  'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1991,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  118,
  'Jonathan Demme',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Silence of the Lambs'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bron/Broen',
  'When a body is found on the bridge between Denmark and Sweden, right on the border, Danish inspector Martin Rohde and Swedish Saga Noren have to share jurisdiction and work together to find the killer.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMjQ3MDAzNDU4NV5BMl5BanBnXkFtZTgwNjE2NDQ0NzE@._V1_UY209_CR3,0,140,209_AL_.jpg',
  2011,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  60,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bron/Broen'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Top of the Lake',
  'Obsessed with the disappearance of a 12-year-old pregnant girl near a freezing lake in New Zealand, a brave detective will find herself up against small-town secrets and a side of herself that was meticulously kept at bay.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMjU3NDkwOV5BMl5BanBnXkFtZTgwMDI3Mzg0MTI@._V1_UY209_CR3,0,140,209_AL_.jpg',
  2013,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  60,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Top of the Lake'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Broadchurch',
  'The murder of a young boy in a small coastal town brings a media frenzy, which threatens to tear the community apart.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMWRmYjVjM2YtNDAwMi00ZGZmLTgzMjQtYjY4MTNjMTljNjhjXkEyXkFqcGdeQXVyMjExMjk0ODk@._V1_UY209_CR4,0,140,209_AL_.jpg',
  2013,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls072530725.',
  48,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Broadchurch'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fall',
  'A seemingly cold but very passionate policewoman goes head to head with a seemingly passionate father who is in fact a cold serialist in this procedural out of Belfast. The only thing they share is their common complexity.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BODk1MzM0MjQtNGUzOS00ZjBmLTliMjgtMzBjYmQwMzUwZDdkXkEyXkFqcGdeQXVyMjExMjk0ODk@._V1_UY209_CR4,0,140,209_AL_.jpg',
  null::int,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  60,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fall'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'M',
  'When the police in a German city are unable to catch a child-murderer, other criminals join in the manhunt.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BZjIwMTM0ZDEtMTdiMy00NmQ0LWJmYmMtNGJmNmMzZmJlZjVkXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UY209_CR0,0,140,209_AL_.jpg',
  1931,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls072530725.',
  99,
  'Fritz Lang',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'M'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Primal Fear',
  'An altar boy is accused of murdering a priest, and the truth is buried several layers deep.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNTljMTEwMGUtYzUyMi00Y2U4LTk3ZDItYWRlNTA5NjkyMjU1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1996,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls072530725.',
  129,
  'Gregory Hoblit',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Primal Fear'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Citizen X',
  'During the 1980s, Soviet authorities hunt for a serial killer who picks his victims in railway stations and commuter trains and lures them into the woods.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTk1NDM1NzMxN15BMl5BanBnXkFtZTcwMzQyODEyMQ@@._V1_UX140_CR0,0,140,209_AL_.jpg',
  1995,
  array['biography', 'crime', 'drama']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  105,
  'Chris Gerolmo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Citizen X'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A History of Violence',
  'A mild-mannered man becomes a local hero through an act of violence, which sets off repercussions that will shake his family to its very core.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTczMzIzMTQ1OV5BMl5BanBnXkFtZTYwMDQwNjk2._V1_UY209_CR0,0,140,209_AL_.jpg',
  2005,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls072530725.',
  96,
  'David Cronenberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A History of Violence'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Fargo',
  'Jerry Lundegaard''s inept crime falls apart due to his and his henchmen''s bungling and the persistent police work of the quite pregnant Marge Gunderson.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNDJiZDgyZjctYmRjMS00ZjdkLTkwMTEtNGU1NDg3NDQ0Yzk1XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY209_CR1,0,140,209_AL_.jpg',
  1996,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls072530725.',
  98,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Fargo'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Memento',
  'A man juggles searching for his wife''s murderer and keeping his short-term memory loss from being an obstacle.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY209_CR1,0,140,209_AL_.jpg',
  2000,
  array['mystery', 'thriller']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls072530725.',
  113,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Memento'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Chaser',
  'A cash-strapped pimp and former police detective draws upon the skills of his old job to track down his missing stable of prostitutes.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BY2ViOTU5MDQtZTRiZi00YjViLWFiY2ItOTRhNWYyN2ZiMzUyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UY209_CR3,0,140,209_AL_.jpg',
  2008,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls072530725.',
  125,
  'Hong-jin Na',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Chaser'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Big Bad Wolves',
  'A series of brutal murders puts the lives of three men on a collision course: The father of the latest victim now out for revenge, a vigilante police detective operating outside the ...                See full summary >',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg3ODc1ODIzOV5BMl5BanBnXkFtZTgwMzg2NTc3MDE@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2013,
  array['comedy', 'thriller']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  110,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Big Bad Wolves'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Memories of Murder',
  'In a small Korean province in 1986, three detectives struggle with the case of multiple young women being found raped and murdered by an unknown culprit.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BZWYyYTk5ODQtNjFjZi00ZDFlLWEwNGEtNGQwZTdmYWRhNmU3L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UX140_CR0,0,140,209_AL_.jpg',
  2003,
  array['action', 'crime', 'drama']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls072530725.',
  132,
  'Joon-ho Bong',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Memories of Murder'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Vanishing',
  'Rex and Saskia, a young couple in love, are on vacation. They stop at a busy service station and Saskia is abducted. After three years and no sign of Saskia, Rex begins receiving letters from the abductor.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNDcwMTYzMjctN2M2Yy00ZDcxLWJhNTEtMGNhYzEwYzc2NDE4XkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_UY209_CR3,0,140,209_AL_.jpg',
  1988,
  array['mystery', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  107,
  'George Sluizer',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Vanishing'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Pledge',
  'A retiring police chief pledges to catch the killer of a young child.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BNTJjNTMyOGUtOTE2Ni00MGZhLWI5OGEtNWQ3MzQ2NGIzYTJiXkEyXkFqcGdeQXVyMjA0MzYwMDY@._V1_UY209_CR1,0,140,209_AL_.jpg',
  null::int,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  124,
  'Sean Penn',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Pledge'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dirty Harry',
  'When a mad man calling himself ''the Scorpio Killer'' menaces the city, tough as nails San Francisco Police Inspector Harry Callahan is assigned to track down and ferret out the crazed psychopath.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg3MDQ4Njg5MV5BMl5BanBnXkFtZTgwMTU2OTM5NDE@._V1._CR96,139,852,1256_UY209_CR1,0,140,209_AL_.jpg',
  1971,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  102,
  'Don Siegel',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Dirty Harry'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Department Q: The Keeper of Lost Causes',
  'Police inspector Carl Morck is put in charge of a department of cold cases, joined only by his assistant, Assad. They dig into a case about a disappeared woman.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQyNTE0MDQ1MF5BMl5BanBnXkFtZTgwOTYxMTkwMDE@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2013,
  array['crime', 'mystery', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls072530725.',
  96,
  'Mikkel Norgaard',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Department Q: The Keeper of Lost Causes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wind River',
  'A veteran tracker with the Fish and Wildlife Service helps to investigate the murder of a young Native American woman, and uses the case as a means of seeking redemption for an earlier act of irresponsibility which ended in tragedy.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTUyMjU1OTUwM15BMl5BanBnXkFtZTgwMDg1NDQ2MjI@._V1_UY209_CR0,0,140,209_AL_.jpg',
  2017,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls072530725.',
  107,
  'Taylor Sheridan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Wind River'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mindhunter',
  'In the late 1970s two FBI agents expand criminal science by delving into the psychology of murder and getting uneasily close to all-too-real monsters.',
  'https://images-na.ssl-images-amazon.com/images/M/MV5BMzNkZmNmZjMtZWI5OC00MzdiLTgxMjAtZWY2ZTIwMWM2Yzc2XkEyXkFqcGdeQXVyMjM5NDQzNTk@._V1_UX140_CR0,0,140,209_AL_.jpg',
  2017,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls072530725.',
  60,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mindhunter'
);

-- ---- 0012_seed_imdb_ls063897780.sql ----
insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Terminator 2: Judgment Day',
  'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten year old son John from an even more advanced and powerful cyborg.',
  'https://m.media-amazon.com/images/M/MV5BNGMyMGNkMDUtMjc2Ni00NWFlLTgyODEtZTY2MzBiZTg0OWZiXkEyXkFqcGc@._V1_.jpg',
  1991,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  137,
  'James Cameron',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Terminator 2: Judgment Day'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Die Hard',
  'A New York City police officer tries to save his estranged wife and several others taken hostage by terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles.',
  'https://m.media-amazon.com/images/M/MV5BMGNlYmM1NmQtYWExMS00NmRjLTg5ZmEtMmYyYzJkMzljYWMxXkEyXkFqcGc@._V1_.jpg',
  1988,
  array['action', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  132,
  'John McTiernan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Die Hard'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Aliens',
  'Decades after surviving the Nostromo incident, Ellen Ripley is sent out to re-establish contact with a terraforming colony but finds herself battling the Alien Queen and her offspring.',
  'https://m.media-amazon.com/images/M/MV5BZjIyNGJhYzYtN2I1My00OTVhLWEyMzItZTVjNDMzOTVkYWViXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  137,
  'James Cameron',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Aliens'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mad Max: Fury Road',
  'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshipper and a drifter named Max.',
  'https://m.media-amazon.com/images/M/MV5BZDRkODJhOTgtOTc1OC00NTgzLTk4NjItNDgxZDY4YjlmNDY2XkEyXkFqcGc@._V1_.jpg',
  2015,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls063897780.',
  120,
  'George Miller',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mad Max: Fury Road'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Raiders of the Lost Ark',
  'In 1936, archaeologists and adventurers of the U.S. government hired Indiana Jones to find the Ark of the Covenant before the Nazis could obtain its extraordinary powers.',
  'https://m.media-amazon.com/images/M/MV5BOGNhMjg2ZjgtYzk4Ni00MTViLTg1MmUtYzM2MDZiYjZlMmU3XkEyXkFqcGc@._V1_.jpg',
  1981,
  array['action', 'adventure']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  115,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Raiders of the Lost Ark'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mission: Impossible - Fallout',
  'A group of terrorists plans to detonate three plutonium cores for a simultaneous nuclear attack on different cities. Ethan Hunt, along with his IMF team, sets out to stop the carnage.',
  'https://m.media-amazon.com/images/M/MV5BMTk3NDY5MTU0NV5BMl5BanBnXkFtZTgwNDI3MDE1NTM@._V1_.jpg',
  2018,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  147,
  'Christopher McQuarrie',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mission: Impossible - Fallout'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hard Boiled',
  'A tough-as-nails cop teams up with an undercover agent to shut down a sinister mobster and his crew.',
  'https://m.media-amazon.com/images/M/MV5BOTZkYjBlMTktOGNmMC00ZWMzLTlkYmYtNDAxYjNjNWRkNjE0XkEyXkFqcGc@._V1_.jpg',
  1992,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  128,
  'John Woo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hard Boiled'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dirty Harry',
  'When a man calling himself "the Scorpio Killer" menaces San Francisco, tough-as-nails Police Inspector "Dirty" Harry Callahan is assigned to track down the crazed psychopath.',
  'https://m.media-amazon.com/images/M/MV5BYzNmOWVjN2ItMTQzOS00MTI4LTgxZDItMmZjNTVlMjY5Mjc1XkEyXkFqcGc@._V1_.jpg',
  1971,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  102,
  'Don Siegel',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Dirty Harry'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Raid 2',
  'Only a short time after the first raid, Rama goes undercover with the thugs of Jakarta and plans to bring down the syndicate and uncover the corruption within his police force.',
  'https://m.media-amazon.com/images/M/MV5BMDMyNTMzZmYtNDIxYi00YTNkLWE2ZTMtM2M4ZGQwYTFjZTEyXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  150,
  'Gareth Evans',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Raid 2'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Last Boy Scout',
  'A private detective''s protected female witness is murdered, prompting him and the victim''s boyfriend to investigate the crime that leads to a corrupt politician and a crooked football team owner.',
  'https://m.media-amazon.com/images/M/MV5BNTI4MDcyZTktNTVhMC00NmQ3LWJiN2UtMzZkNDgwMzRkMzIwXkEyXkFqcGc@._V1_.jpg',
  1991,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  105,
  'Tony Scott',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Last Boy Scout'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bullet in the Head',
  'When three close friends escape from Hong Kong to war-time Saigon to start a criminal''s life, they all go through a harrowing experience which totally shatters their lives and their friendship forever.',
  'https://m.media-amazon.com/images/M/MV5BZGZkNWE0MjYtZjBiNy00MDI1LTg3ZDItNDI1NDgyZTQ2OTJjXkEyXkFqcGc@._V1_.jpg',
  1990,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  136,
  'John Woo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bullet in the Head'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Inception',
  'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.',
  'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
  2010,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  8.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  148,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Inception'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Matrix',
  'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.',
  'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['action', 'sci-fi']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  136,
  'Lana Wachowski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Matrix'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Dark Knight',
  'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.',
  'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
  2008,
  array['action', 'crime', 'drama']::text[],
  'classic',
  9.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  152,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Dark Knight'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Top Gun: Maverick',
  'The story involves Maverick confronting his past while training a group of younger Top Gun graduates, including the son of his deceased best friend, for a dangerous mission.',
  'https://m.media-amazon.com/images/M/MV5BMDBkZDNjMWEtOTdmMi00NmExLTg5MmMtNTFlYTJlNWY5YTdmXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['action', 'drama']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  130,
  'Joseph Kosinski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Top Gun: Maverick'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'John Wick: Chapter 4',
  'John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.',
  'https://m.media-amazon.com/images/M/MV5BY2Q2ZmI5ZjUtNWVhMC00YzJkLTlmYjMtY2RmZDhkNzEzYjZhXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  169,
  'Chad Stahelski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'John Wick: Chapter 4'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Tenet',
  'Armed with only the word "Tenet," and fighting for the survival of the entire world, CIA operative, The Protagonist, journeys through a twilight world of international espionage on a global mission that unfolds beyond real time.',
  'https://m.media-amazon.com/images/M/MV5BMTU0ZjZlYTUtYzIwMC00ZmQzLWEwZTAtZWFhMWIwYjMxY2I3XkEyXkFqcGc@._V1_.jpg',
  2020,
  array['action', 'sci-fi', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  150,
  'Christopher Nolan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Tenet'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Star Wars: Episode V - The Empire Strikes Back',
  'After the Empire overpowers the Rebel Alliance, Luke Skywalker begins his Jedi training with Yoda. At the same time, Darth Vader and bounty hunter Boba Fett pursue his friends across the galaxy.',
  'https://m.media-amazon.com/images/M/MV5BMTkxNGFlNDktZmJkNC00MDdhLTg0MTEtZjZiYWI3MGE5NWIwXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['action', 'adventure', 'fantasy']::text[],
  'classic',
  8.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  124,
  'Irvin Kershner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Star Wars: Episode V - The Empire Strikes Back'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Rock',
  'A mild-mannered chemist and an ex-con must lead the counterstrike when a rogue group of military men, led by a renegade general, threaten a nerve gas attack from Alcatraz against San Francisco.',
  'https://m.media-amazon.com/images/M/MV5BMDhkYjRiZWEtZTE0Ny00ZjA1LThmNjgtM2UyYTQzODA4MjdhXkEyXkFqcGc@._V1_.jpg',
  1996,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  136,
  'Michael Bay',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Rock'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Better Tomorrow II',
  'A restauranteur teams up with a police officer and his ex-con brother to avenge the death of a friend''s daughter.',
  'https://m.media-amazon.com/images/M/MV5BNDFjNjc4MzktOWU1MS00YmM5LTgzNzEtYTdkMDNiODFlNDYzXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  105,
  'John Woo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Better Tomorrow II'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Speed',
  'A young police officer must prevent a bomb exploding aboard a city bus by keeping its speed above 50 mph.',
  'https://m.media-amazon.com/images/M/MV5BMDc2ODI5YWQtMmM2ZS00MTdmLWEyNWEtNmRmOGE5NGZlYWMzXkEyXkFqcGc@._V1_.jpg',
  1994,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  116,
  'Jan de Bont',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Speed'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Die Hard with a Vengeance',
  'John McClane and a Harlem store owner are targeted by German terrorist Simon in New York City, where he plans to rob the Federal Reserve Building.',
  'https://m.media-amazon.com/images/M/MV5BYjkzNzdkMTctNzMwMS00M2Q0LWIyOTMtNmM2NDY5NWZjNTJlXkEyXkFqcGc@._V1_.jpg',
  1995,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  128,
  'John McTiernan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Die Hard with a Vengeance'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Gladiator',
  'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.',
  'https://m.media-amazon.com/images/M/MV5BYWQ4YmNjYjEtOWE1Zi00Y2U4LWI4NTAtMTU0MjkxNWQ1ZmJiXkEyXkFqcGc@._V1_.jpg',
  2000,
  array['action', 'adventure', 'drama']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  155,
  'Ridley Scott',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Gladiator'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Drunken Master II',
  'A young martial artist is caught between respecting his pacifist father''s wishes or stopping a group of disrespectful foreigners from stealing precious artifacts.',
  'https://m.media-amazon.com/images/M/MV5BNzBlMGZlZTctODdmYi00N2ZkLThkYjItZDdiNTQzNWIxMjAzXkEyXkFqcGc@._V1_.jpg',
  1994,
  array['action', 'comedy']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  102,
  'Chia-Liang Liu',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Drunken Master II'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Raid: Redemption',
  'A S.W.A.T. team becomes trapped in a tenement run by a ruthless mobster and his army of killers and thugs.',
  'https://m.media-amazon.com/images/M/MV5BOGUxM2Q0MzItZDRmYy00ZWY1LWFiNzctNmY3Njg2ODJjZWNmXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  101,
  'Gareth Evans',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Raid: Redemption'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Untouchables',
  'During Prohibition, Treasury agent Eliot Ness sets out to stop ruthless Chicago gangster Al Capone, and assembles a small, incorruptible team to help him.',
  'https://m.media-amazon.com/images/M/MV5BYjVlNTk3NGYtOWE0OC00MDI4LThlZWItZGMwMTdmYzcwM2Y5XkEyXkFqcGc@._V1_.jpg',
  1987,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  119,
  'Brian De Palma',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Untouchables'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Elite Squad 2: The Enemy Within',
  'After a prison riot, former-Captain Nascimento, now a high ranking security officer in Rio de Janeiro, is swept into a bloody political dispute that involves government officials and paramilitary groups.',
  'https://m.media-amazon.com/images/M/MV5BMjEzMzMxOTUyNV5BMl5BanBnXkFtZTcwNjI3MDc5Ng@@._V1_.jpg',
  2010,
  array['action', 'crime', 'drama']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  115,
  'Jose Padilha',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Elite Squad 2: The Enemy Within'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Predator',
  'A team of commandos on a mission in a Central American jungle find themselves hunted by an extraterrestrial warrior.',
  'https://m.media-amazon.com/images/M/MV5BOWEzMDI0MTUtMjQ0Yy00MGRhLWI4YjAtZTgzZTM3NTYxZGJkXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['action', 'adventure', 'horror']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  107,
  'John McTiernan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Predator'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Hitcher',
  'A young man who escapes the clutches of a murderous hitchhiker is subsequently stalked by the hitcher and framed for his crimes.',
  'https://m.media-amazon.com/images/M/MV5BMTk0ZmM5YTAtNGE3OC00YjI2LTg4MzItODUyYzhkMjMxODA5XkEyXkFqcGc@._V1_.jpg',
  1986,
  array['action', 'mystery', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  97,
  'Robert Harmon',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Hitcher'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dog Soldiers',
  'A routine military exercise turns into a nightmare in the Scottish wilderness.',
  'https://m.media-amazon.com/images/M/MV5BNDI3ZTk0ZjItOTMwMi00NWM1LTk4YmItMjY3NDYyZWI4ZjYxXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['action', 'horror', 'thriller']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  105,
  'Neil Marshall',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Dog Soldiers'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Killer',
  'A disillusioned assassin accepts one last hit in hopes of using his earnings to restore the vision of a singer he accidentally blinded.',
  'https://m.media-amazon.com/images/M/MV5BMjQyZDJhNTktYjZiZC00ODU4LTg5OTYtYjc2MzA2OGFjMzZmXkEyXkFqcGc@._V1_.jpg',
  1989,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  111,
  'John Woo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Killer'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Lethal Weapon',
  'Two newly paired cops who are complete opposites must put aside their differences in order to catch a gang of drug smugglers.',
  'https://m.media-amazon.com/images/M/MV5BMWVlNWZlODktMzhhNS00YThhLWEzZWYtYzU0NDFmNzk0MGVlXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  109,
  'Richard Donner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Lethal Weapon'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Nobody',
  'A docile family man slowly reveals his true character after his house gets burgled by two petty thieves, which, coincidentally, leads him into a bloody war with a Russian crime boss.',
  'https://m.media-amazon.com/images/M/MV5BYmIzOWViNDEtOWRiZS00ZWM4LWFiMmEtNGJjMmQ3NTIxN2U0XkEyXkFqcGc@._V1_.jpg',
  2021,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  92,
  'Ilya Naishuller',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Nobody'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'John Wick',
  'John Wick is a former hitman grieving the loss of his true love. When his home is broken into, robbed, and his dog killed, he is forced to return to action to exact revenge.',
  'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg',
  2014,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  101,
  'Chad Stahelski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'John Wick'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Scott Pilgrim vs. the World',
  'In a magically realistic version of Toronto, a young man must defeat his new girlfriend''s seven evil exes one by one in order to win her heart.',
  'https://m.media-amazon.com/images/M/MV5BNTA5ZWMwNmYtNWI1ZS00NDRlLTkxNzktMzdhZDU2ZDhjNDJmXkEyXkFqcGc@._V1_.jpg',
  2010,
  array['action', 'comedy', 'fantasy']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  112,
  'Edgar Wright',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Scott Pilgrim vs. the World'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Elite Squad',
  'In 1997 Rio de Janeiro, Captain Nascimento has to find a substitute for his position while trying to take down drug dealers and criminals before the Pope visits.',
  'https://m.media-amazon.com/images/M/MV5BZjU3Yzk3NzctYWNiNy00YWMzLThiOGItODc3NmEzODBkYjRmXkEyXkFqcGc@._V1_.jpg',
  2007,
  array['action', 'crime', 'drama']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  115,
  'Jose Padilha',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Elite Squad'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man 2',
  'Peter Parker is beset with troubles in his failing personal life as he battles a former brilliant scientist named Otto Octavius.',
  'https://m.media-amazon.com/images/M/MV5BNGQ0YTQyYTgtNWI2YS00NTE2LWJmNDItNTFlMTUwNmFlZTM0XkEyXkFqcGc@._V1_.jpg',
  2004,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  127,
  'Sam Raimi',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Spider-Man 2'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kingsman: The Secret Service',
  'A spy organisation recruits a promising street kid into the agency''s training program, while a global threat emerges from a twisted tech genius.',
  'https://m.media-amazon.com/images/M/MV5BODk1MTYwNTAtYmI5Zi00OWYyLWE0MzQtOWE4NDIxZmU2MjMwXkEyXkFqcGc@._V1_.jpg',
  2014,
  array['action', 'adventure', 'comedy']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  129,
  'Matthew Vaughn',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Kingsman: The Secret Service'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Bourne Ultimatum',
  'Jason Bourne dodges a ruthless C.I.A. official and his Agents from a new assassination program while searching for the origins of his life as a trained killer.',
  'https://m.media-amazon.com/images/M/MV5BYzE3ZGM4MzctZjU5MC00NWE2LTg5ZjYtMDFiM2ZlMWQ1MjkwXkEyXkFqcGc@._V1_.jpg',
  2007,
  array['action', 'mystery', 'thriller']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  115,
  'Paul Greengrass',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Bourne Ultimatum'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mad Max 2: The Road Warrior',
  'In the post-apocalyptic Australian wasteland, a cynical drifter agrees to help a small, gasoline-rich community get rid of a horde of bandits.',
  'https://m.media-amazon.com/images/M/MV5BYTAyNzBiZWUtMGY4YS00YzkzLWJhNGUtNTU5OThlZjZhZTYyXkEyXkFqcGc@._V1_.jpg',
  1981,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  96,
  'George Miller',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mad Max 2: The Road Warrior'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Man from Nowhere',
  'A quiet pawnshop keeper with a violent past takes on a drug-and-organ trafficking ring in hope of saving the child who is his only friend.',
  'https://m.media-amazon.com/images/M/MV5BMTgzMTkxNjAxNV5BMl5BanBnXkFtZTgwMDU3MDE0MjE@._V1_.jpg',
  2010,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  119,
  'Lee Jeong-beom',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Man from Nowhere'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'GoldenEye',
  'When a powerful secret defense system is stolen, James Bond is assigned to stop a Russian crime syndicate from using it.',
  'https://m.media-amazon.com/images/M/MV5BOGQxNmYyY2YtZGIyNy00ODgxLThhZWEtZGIyNjJhYzFlOTllXkEyXkFqcGc@._V1_.jpg',
  1995,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  130,
  'Martin Campbell',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'GoldenEye'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'John Wick: Chapter 2',
  'After returning to the criminal underworld to repay a debt, John Wick discovers that a large bounty has been put on his life.',
  'https://m.media-amazon.com/images/M/MV5BMjE2NDkxNTY2M15BMl5BanBnXkFtZTgwMDc2NzE0MTI@._V1_.jpg',
  2017,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  122,
  'Chad Stahelski',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'John Wick: Chapter 2'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'First Blood',
  'A veteran Green Beret is forced by a cruel Sheriff and his deputies to flee into the mountains and wage an escalating one-man war against his pursuers.',
  'https://m.media-amazon.com/images/M/MV5BYzc4ZmQ5YzEtYTQzYy00ZDdiLWI2NmQtZTA3MzM1ZGIyYmUzXkEyXkFqcGc@._V1_.jpg',
  1982,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  93,
  'Ted Kotcheff',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'First Blood'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Skyfall',
  'James Bond''s loyalty to M is tested when her past comes back to haunt her. When MI6 comes under attack, 007 must track down and destroy the threat, no matter how personal the cost.',
  'https://m.media-amazon.com/images/M/MV5BNjAzMWNkODUtM2FlMi00NzgyLWJhMGUtMWEyNDYyZGFiN2RlXkEyXkFqcGc@._V1_.jpg',
  2012,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  143,
  'Sam Mendes',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Skyfall'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'True Lies',
  'A fearless, globe-trotting, terrorist-battling secret agent has his life turned upside down when he discovers his wife might be having an affair with a used-car salesman while terrorists smuggle nuclear war heads into the United States.',
  'https://m.media-amazon.com/images/M/MV5BYjU1ZjNhMjMtOTMxZS00MDc1LTlkNzQtZTdjNGQyYjQ4YTA4XkEyXkFqcGc@._V1_.jpg',
  1994,
  array['action', 'comedy', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  141,
  'James Cameron',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'True Lies'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Spider-Man',
  'After being bitten by a genetically-modified spider, a shy teenager gains spider-like abilities that he uses to fight injustice as a masked superhero and face a vengeful enemy.',
  'https://m.media-amazon.com/images/M/MV5BZWM0OWVmNTEtNWVkOS00MzgyLTkyMzgtMmE2ZTZiNjY4MmFiXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  121,
  'Sam Raimi',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Spider-Man'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kingsman: The Golden Circle',
  'After the Kingsman''s headquarters is destroyed and the world is held hostage, an allied spy organization in the United States is discovered. These two elite secret agencies must band together to defeat a common enemy.',
  'https://m.media-amazon.com/images/M/MV5BMjQ3OTgzMzY4NF5BMl5BanBnXkFtZTgwOTc4OTQyMzI@._V1_.jpg',
  2017,
  array['action', 'adventure', 'comedy']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  141,
  'Matthew Vaughn',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Kingsman: The Golden Circle'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Upgrade',
  'Set in the near-future, technology controls nearly all aspects of life. But when the world of Grey, a self-labeled technophobe, is turned upside down, his only hope for revenge is an experimental computer chip implant.',
  'https://m.media-amazon.com/images/M/MV5BMjI0NzcyMjM5Ml5BMl5BanBnXkFtZTgwMzk2NzAyNTM@._V1_.jpg',
  2018,
  array['action', 'sci-fi', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  100,
  'Leigh Whannell',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Upgrade'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'RoboCop',
  'In a dystopic and crime-ridden Detroit, a terminally wounded cop returns to the force as a powerful cyborg haunted by submerged memories.',
  'https://m.media-amazon.com/images/M/MV5BZWM1YzRhODktZDE1MC00NzBlLTk0NGMtOGNhZDQyMmJiZGFiXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['action', 'crime', 'sci-fi']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  102,
  'Paul Verhoeven',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'RoboCop'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Casino Royale',
  'After earning a licence to kill, secret agent James Bond sets out on his first mission as 007. Bond must defeat a private banker funding terrorists in a high-stakes game of poker at Casino Royale, in Montenegro.',
  'https://m.media-amazon.com/images/M/MV5BMTM5MjI4NDExNF5BMl5BanBnXkFtZTcwMDM1MjMzMQ@@._V1_.jpg',
  2006,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  8.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  144,
  'Martin Campbell',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Casino Royale'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Beverly Hills Cop',
  'A freewheeling Detroit cop pursuing a murder investigation finds himself dealing with the very different culture of Beverly Hills.',
  'https://m.media-amazon.com/images/M/MV5BNjU4OGM2MzctNGU3ZC00M2EzLThiN2ItOTlmN2FjODM0MzFhXkEyXkFqcGc@._V1_.jpg',
  1984,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  105,
  'Martin Brest',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Beverly Hills Cop'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kill Bill: Vol. 1',
  'After waking from a four-year coma, a former assassin wreaks vengeance on the team of assassins who betrayed her.',
  'https://m.media-amazon.com/images/M/MV5BZmMyYzJlZmYtY2I3NC00NjAyLTkyZWItZjdjZDI1YTYyYTEwXkEyXkFqcGc@._V1_.jpg',
  2003,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  111,
  'Quentin Tarantino',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Kill Bill: Vol. 1'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Boondock Saints',
  'Two Irish Catholic brothers become vigilantes and wipe out Boston''s criminal underworld in the name of God.',
  'https://m.media-amazon.com/images/M/MV5BMzIzYjE3YmMtYjdjOC00NTk5LWI0N2MtZDliYjUxNGYyNGZhXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  108,
  'Troy Duffy',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Boondock Saints'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The World''s End',
  'Five friends who reunite in an attempt to top their epic pub crawl from twenty years earlier unwittingly become humanity''s only hope for survival.',
  'https://m.media-amazon.com/images/M/MV5BNzA1MTk1MzY0OV5BMl5BanBnXkFtZTgwNjkzNTUwMDE@._V1_.jpg',
  2013,
  array['action', 'comedy', 'sci-fi']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  109,
  'Edgar Wright',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The World''s End'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'From Dusk Till Dawn',
  'Two criminals and their hostages unknowingly seek temporary refuge in a truck stop populated by vampires, with chaotic results.',
  'https://m.media-amazon.com/images/M/MV5BZGNjMWMwNWEtYTQ2YS00N2E5LTg5ZWYtMDgzM2UxMTE1ZTE4XkEyXkFqcGc@._V1_.jpg',
  1996,
  array['action', 'crime', 'horror']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  108,
  'Robert Rodriguez',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'From Dusk Till Dawn'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '16 Blocks',
  'An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.',
  'https://m.media-amazon.com/images/M/MV5BMTQ1NDEwMzEwMl5BMl5BanBnXkFtZTcwNzM4MTEzMw@@._V1_.jpg',
  2006,
  array['action', 'drama', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  102,
  'Richard Donner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '16 Blocks'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wrath of Man',
  'A mysteriously stoic character is hired as a security guard by a cash truck company responsible for transporting a lot of money around Los Angeles each week.',
  'https://m.media-amazon.com/images/M/MV5BODE4ZGY4OTktNDBjMy00NGVkLTk5YWUtNjA3NGU3MTA5NzM0XkEyXkFqcGc@._V1_.jpg',
  2021,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls063897780.',
  119,
  'Guy Ritchie',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Wrath of Man'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Extraction II',
  'After barely surviving his grievous wounds from his mission in Dhaka, Bangladesh, Tyler Rake is back, and his team is ready to take on their next mission.',
  'https://m.media-amazon.com/images/M/MV5BZGQwNDdhODAtY2Y0Ni00YzFhLTk1OGUtY2RkMDAzNzBmZjAxXkEyXkFqcGc@._V1_.jpg',
  2023,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  122,
  'Sam Hargrave',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Extraction II'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mission: Impossible III',
  'IMF agent Ethan Hunt comes into conflict with a dangerous and sadistic arms dealer who threatens his life and his fiancee in response.',
  'https://m.media-amazon.com/images/M/MV5BNzY1MzdjMjYtNDJiZS00N2U4LWI0MWQtZTRiZWYxMzU3ZmI4XkEyXkFqcGc@._V1_.jpg',
  2006,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  126,
  'J.J. Abrams',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mission: Impossible III'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Taken',
  'A retired CIA agent travels across Europe and relies on his old skills to save his estranged daughter, who has been kidnapped while on a trip to Paris.',
  'https://m.media-amazon.com/images/M/MV5BYTAxNTY2NjMtYjk5Yy00Nzg4LTkyMmItYmMzMDM2OWQ1ZGQ3XkEyXkFqcGc@._V1_.jpg',
  2008,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  90,
  'Pierre Morel',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Taken'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dredd',
  'In a violent, futuristic city where the police have the authority to act as judge, jury and executioner, a cop teams with a trainee to take down a gang that deals the reality-altering drug, SLO-MO.',
  'https://m.media-amazon.com/images/M/MV5BODkyNDQzMzUzOF5BMl5BanBnXkFtZTcwODYyMDEyOA@@._V1_.jpg',
  2012,
  array['action', 'crime', 'sci-fi']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls063897780.',
  95,
  'Pete Travis',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Dredd'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Bourne Identity',
  'A man is picked up by a fishing boat, bullet-riddled and suffering from amnesia, before racing to elude assassins and attempting to regain his memory.',
  'https://m.media-amazon.com/images/M/MV5BYTk1ZTcyMWMtMWUxYS00MmEzLTlmODYtOTk1MGRjOTg1ZjlmXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['action', 'mystery', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  119,
  'Doug Liman',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Bourne Identity'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mission: Impossible - Rogue Nation',
  'Ethan and his team take on their most impossible mission yet when they have to eradicate an international rogue organization as highly skilled as they are and committed to destroying the IMF.',
  'https://m.media-amazon.com/images/M/MV5BZjUwZjg2ZjAtY2RhZi00YmZjLTlhNGQtOWQwNDk1MjhhM2NhXkEyXkFqcGc@._V1_.jpg',
  2015,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  131,
  'Christopher McQuarrie',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mission: Impossible - Rogue Nation'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Top Gun',
  'The Top Gun Naval Fighter Weapons School is where the best of the best train to refine their elite flying skills. When hotshot fighter pilot Maverick is sent to the school, his reckless attitude and cocky demeanor put him at odds with the other pilots, especially the cool and collected Iceman.',
  'https://m.media-amazon.com/images/M/MV5BZmVjNzQ3MjYtYTZiNC00Y2YzLWExZTEtMTM2ZDllNDI0MzgyXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['action', 'drama']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  109,
  'Tony Scott',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Top Gun'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Nice Guys',
  'In 1970s Los Angeles, a mismatched pair of private eyes investigate a missing girl and the mysterious death of a porn star.',
  'https://m.media-amazon.com/images/M/MV5BM2YwNWZlZGEtYTEyZi00NjdjLWEwM2ItM2Q2MDMwZjkzMjk0XkEyXkFqcGc@._V1_.jpg',
  2016,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  116,
  'Shane Black',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Nice Guys'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Minority Report',
  'John works with the PreCrime police which stop crimes before they take place, with the help of three ''PreCogs'' who can foresee crimes. Events ensue when John finds himself framed for a future murder.',
  'https://m.media-amazon.com/images/M/MV5BYTdmNzM3YzItZTRkYS00MTY5LTg4ZmItNjFmNTk2N2Q2NmNlXkEyXkFqcGc@._V1_.jpg',
  2002,
  array['action', 'crime', 'mystery']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  145,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Minority Report'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Jack Reacher',
  'Jack Reacher, a homicide investigator, digs deeper into a case involving a trained military sniper responsible for a mass shooting.',
  'https://m.media-amazon.com/images/M/MV5BMTM1NjUxMDI3OV5BMl5BanBnXkFtZTcwNjg1ODM3OA@@._V1_.jpg',
  2012,
  array['action', 'mystery', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls063897780.',
  130,
  'Christopher McQuarrie',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Jack Reacher'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Smokin'' Aces',
  'When a Las Vegas performer-turned-snitch named Buddy Israel decides to turn state''s evidence and testify against the mob, it seems that a whole lot of people would like to make sure he''s no longer breathing.',
  'https://m.media-amazon.com/images/M/MV5BYzM4YmE2NWMtMjYxZS00OWU4LTk5NTctYzA4YTFlOTExNDM0XkEyXkFqcGc@._V1_.jpg',
  2006,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  108,
  'Joe Carnahan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Smokin'' Aces'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Captain America: The Winter Soldier',
  'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.',
  'https://m.media-amazon.com/images/M/MV5BNWY1NjFmNDItZDhmOC00NjI1LWE0ZDItMTM0MjBjZThiOTQ2XkEyXkFqcGc@._V1_.jpg',
  2014,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  136,
  'Anthony Russo',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Captain America: The Winter Soldier'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wanted',
  'A frustrated office worker discovers that he is the son of a professional assassin, and that he shares his father''s superhuman killing abilities.',
  'https://m.media-amazon.com/images/M/MV5BMTQwNDM2MTMwMl5BMl5BanBnXkFtZTgwMjE4NjQxMTE@._V1_.jpg',
  2008,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  110,
  'Timur Bekmambetov',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Wanted'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Vanishing Point',
  'During the 1970s, car-delivery driver Kowalski delivers hot rods in record time, but always runs into trouble.',
  'https://m.media-amazon.com/images/M/MV5BOWE1MDBiZjYtYjE5Ny00MGUxLWJhMTEtYTM5MjcyZjYzN2Q0XkEyXkFqcGc@._V1_.jpg',
  1971,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  99,
  'Richard C. Sarafian',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Vanishing Point'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fugitive',
  'Dr. Richard Kimble, unjustly accused of murdering his wife, must find the real killer while being the target of a nationwide manhunt led by a seasoned U.S. Marshal.',
  'https://m.media-amazon.com/images/M/MV5BM2RjMjEwODUtYTE4OC00MzhkLThjMjItZjYyZjk3YzA4YWUxXkEyXkFqcGc@._V1_.jpg',
  1993,
  array['action', 'crime', 'drama']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  130,
  'Andrew Davis',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fugitive'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Big Trouble in Little China',
  'A rough-and-tumble trucker and his sidekick face off with an ancient sorcerer in a supernatural battle beneath Chinatown.',
  'https://m.media-amazon.com/images/M/MV5BYWNjZDQyMjUtZDEzZC00OThhLTg1NWItOTQ1MWI3ODBlODcyXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['action', 'adventure', 'comedy']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  99,
  'John Carpenter',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Big Trouble in Little China'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Kick-Ass',
  'Dave Lizewski is an unnoticed high school student and comic book fan who one day decides to become a superhero, even though he has no powers, training or meaningful reason to do so.',
  'https://m.media-amazon.com/images/M/MV5BMTMzNzEzMDYxM15BMl5BanBnXkFtZTcwMTc0NTMxMw@@._V1_.jpg',
  2010,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  117,
  'Matthew Vaughn',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Kick-Ass'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Warriors',
  'A street gang known as the Warriors must fight its way from the Bronx to its home turf on Coney Island when its members are falsely accused of assassinating a respected gang leader.',
  'https://m.media-amazon.com/images/M/MV5BYjAzNTNlMTgtYzdlYi00NGViLWIwNzUtNjc3MDg1ZTAxNjc3XkEyXkFqcGc@._V1_.jpg',
  1979,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  93,
  'Walter Hill',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Warriors'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Enter the Dragon',
  'A Shaolin martial artist travels to an island fortress to spy on an opium lord - who is also a former monk from his temple - under the guise of attending a fighting tournament.',
  'https://m.media-amazon.com/images/M/MV5BZDAyYjAwNmMtMjM5OC00NTc5LThmNjAtOTUxODQxOWYwOTE5XkEyXkFqcGc@._V1_.jpg',
  1973,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  102,
  'Robert Clouse',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Enter the Dragon'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Long Kiss Goodnight',
  'Samantha Caine lives in a small town with her daughter. Eight years ago she emerged, two months pregnant, from a nearby river with no memory of her past or who she is. However, she''s getting closer to finding out about her past.',
  'https://m.media-amazon.com/images/M/MV5BZjJmNzZjODktNmNhMy00NDZiLWIwNGUtM2NjYWNhZWU4YTY1XkEyXkFqcGc@._V1_.jpg',
  1996,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  121,
  'Renny Harlin',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Long Kiss Goodnight'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Police Story',
  'A virtuous Hong Kong Police Officer must clear his good name when the drug lord he is after frames him for the murder of a dirty cop.',
  'https://m.media-amazon.com/images/M/MV5BZTMxMWUxNjctOGNiOC00MzRkLWI1NjktZWUzOGJiZTM2ZDg1XkEyXkFqcGc@._V1_.jpg',
  1985,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  100,
  'Jackie Chan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Police Story'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Indiana Jones and the Last Crusade',
  'In 1938, after his father goes missing while pursuing the Holy Grail, Indiana Jones finds himself up against the Nazis again to stop them from obtaining its powers.',
  'https://m.media-amazon.com/images/M/MV5BNGIxNzQ0YzYtMjNmYi00YjBlLWFjNzEtNGE3ZGFmYTczM2MwXkEyXkFqcGc@._V1_.jpg',
  1989,
  array['action', 'adventure']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  127,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Indiana Jones and the Last Crusade'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bad Boys',
  'Two hip detectives protect a witness to a murder while investigating a case of stolen heroin from the evidence storage room from their police precinct.',
  'https://m.media-amazon.com/images/M/MV5BMWNjZWEwNDMtMWE1ZC00MTgwLTk2YzAtYmE0NTkwOWVhMDI0XkEyXkFqcGc@._V1_.jpg',
  1995,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  119,
  'Michael Bay',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bad Boys'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Lethal Weapon 4',
  'With personal crises and age weighing in on them, LAPD officers Riggs and Murtaugh must contend with deadly Chinese triads that are trying to free their former leaders out of prison and onto American soil.',
  'https://m.media-amazon.com/images/M/MV5BMDU4MDIyMzEtZjEwZi00NmFjLTljMzQtNDgzNDE5ZDhlMTZmXkEyXkFqcGc@._V1_.jpg',
  1998,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  127,
  'Richard Donner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Lethal Weapon 4'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Armour of God',
  'Asian Hawk (Jackie Chan) and his bumbling sidekick are sent on a quest through Europe to find a mysterious treasure held by a shadowy organization of monks.',
  'https://m.media-amazon.com/images/M/MV5BMDE3ZDg0MDYtYmRhNi00ZWViLWFhZjctOWRkMzBjM2NlMTRlXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['action', 'adventure', 'comedy']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  88,
  'Jackie Chan',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Armour of God'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Air Force One',
  'Communist radicals led by Ivan Korshunov hijack Air Force One with US President James Marshall and his family on board. Vice President Kathryn Bennett negotiates from Washington D.C., while Marshall fights to rescue the hostages on board.',
  'https://m.media-amazon.com/images/M/MV5BOTVlYmFhZjktOTA2ZC00Y2YzLWFmNDMtZGU2YzBkNGZkODY4XkEyXkFqcGc@._V1_.jpg',
  1997,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  124,
  'Wolfgang Petersen',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Air Force One'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mad Max',
  'In a self-destructing world, a vengeful Australian policeman sets out to stop a violent motorcycle gang.',
  'https://m.media-amazon.com/images/M/MV5BMTM4Mjg5ODEzMV5BMl5BanBnXkFtZTcwMDc3NDk0NA@@._V1_.jpg',
  1979,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls063897780.',
  88,
  'George Miller',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mad Max'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Lethal Weapon 2',
  'Riggs and Murtaugh are on the trail of South African diplomats who are using their immunity to engage in criminal activities.',
  'https://m.media-amazon.com/images/M/MV5BZWE1OWYwZTAtMGUwMC00MGE3LWE1ODAtMTI0NGQ1NzU5YmYzXkEyXkFqcGc@._V1_.jpg',
  1989,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  114,
  'Richard Donner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Lethal Weapon 2'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Indiana Jones and the Temple of Doom',
  'In 1935, Indiana Jones is tasked by Indian villagers with reclaiming a rock stolen from them by a secret cult beneath the catacombs of an ancient palace.',
  'https://m.media-amazon.com/images/M/MV5BOGUwZjZiNWQtYzAzZi00NGI5LWE4YmUtN2Y4YWMwY2RlZDkyXkEyXkFqcGc@._V1_.jpg',
  1984,
  array['action', 'adventure']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  118,
  'Steven Spielberg',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Indiana Jones and the Temple of Doom'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Full Contact',
  'Two disreputable friends get tied in with a group of criminals who turn out to be excessively violent and deceptive.',
  'https://m.media-amazon.com/images/M/MV5BZDk1MWUxZmQtMjg0OC00Mzk4LTljZDYtMDhlZjk1N2JhOTQ4XkEyXkFqcGc@._V1_.jpg',
  1992,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls063897780.',
  99,
  'Ringo Lam',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Full Contact'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'They Live',
  'They influence our decisions without us knowing it. They numb our senses without us feeling it. They control our lives without us realizing it. They live.',
  'https://m.media-amazon.com/images/M/MV5BMTQ3MjM3ODU1NV5BMl5BanBnXkFtZTgwMjU3NDU2MTE@._V1_.jpg',
  1988,
  array['action', 'horror', 'sci-fi']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls063897780.',
  94,
  'John Carpenter',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'They Live'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Assault on Precinct 13',
  'A Highway Patrol Officer, two criminals and a station secretary defend a defunct Los Angeles precinct office against a siege by a bloodthirsty street gang.',
  'https://m.media-amazon.com/images/M/MV5BMjUzZmI1YjUtMDlhOS00MGQ1LTgxZWYtOWFhZGE0NTIyNWZlXkEyXkFqcGc@._V1_.jpg',
  1976,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  91,
  'John Carpenter',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Assault on Precinct 13'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Tiger on Beat',
  'A seasoned cop and his rookie partner are a pair of mismatched partners in this Hong Kong action-comedy in the style of ''Lethal Weapon''. The wacky twosome are up in arms as they try to solve the murder of a heroin trafficker.',
  'https://m.media-amazon.com/images/M/MV5BOWU1M2RkNGEtMzVmMC00MTU2LTlhMjEtZWZiMjY4YmQyOWMwXkEyXkFqcGc@._V1_.jpg',
  1988,
  array['action', 'comedy', 'crime']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  93,
  'Chia-Liang Liu',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Tiger on Beat'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Getaway',
  'A recently-released ex-con and his loyal wife go on the run after a heist goes awry.',
  'https://m.media-amazon.com/images/M/MV5BNmM5MzAzYTYtZjA5My00YmM4LTgzMTUtYWVkMWYxN2YzOTk5XkEyXkFqcGc@._V1_.jpg',
  1972,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  123,
  'Sam Peckinpah',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Getaway'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Lethal Weapon 3',
  'Martin Riggs and Roger Murtaugh pursue a former LAPD officer who uses his knowledge of police procedure and policies to steal and sell confiscated guns and ammunition to local street gangs.',
  'https://m.media-amazon.com/images/M/MV5BNDA3Zjc5NjYtODZiNy00Yjg3LTk0MWEtMDk3NDA4ZjU3YTY0XkEyXkFqcGc@._V1_.jpg',
  1992,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  118,
  'Richard Donner',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Lethal Weapon 3'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sherlock Holmes',
  'Detective Sherlock Holmes and his stalwart partner Watson engage in a battle of wits and brawn with a nemesis whose plot is a threat to all of England.',
  'https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_.jpg',
  2009,
  array['action', 'adventure', 'mystery']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls063897780.',
  128,
  'Guy Ritchie',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Sherlock Holmes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Escape from New York',
  'In 1997, when the U.S. president crashes into Manhattan, now a giant maximum security prison, a convicted bank robber is sent in to rescue him.',
  'https://m.media-amazon.com/images/M/MV5BMTUzMTY0Nzg0MV5BMl5BanBnXkFtZTgwMDU3MzQxMDE@._V1_.jpg',
  1981,
  array['action', 'adventure', 'sci-fi']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls063897780.',
  99,
  'John Carpenter',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Escape from New York'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Point Break',
  'An F.B.I. Agent goes undercover to catch a gang of surfers who may be bank robbers.',
  'https://m.media-amazon.com/images/M/MV5BNTI3YzY3N2MtODI1OC00NmU0LThlMDYtNmFjMGFkNzhhNTRlXkEyXkFqcGc@._V1_.jpg',
  1991,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls063897780.',
  122,
  'Kathryn Bigelow',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Point Break'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '13 Assassins',
  'A group of assassins come together for a suicide mission to kill an evil lord.',
  'https://m.media-amazon.com/images/M/MV5BODg3MTYwODY3MF5BMl5BanBnXkFtZTcwMDk2MzYwNQ@@._V1_.jpg',
  2010,
  array['action', 'adventure', 'drama']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls063897780.',
  141,
  'Takashi Miike',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '13 Assassins'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Con Air',
  'Newly-paroled ex-con and former U.S. Ranger Cameron Poe finds himself trapped in a prisoner-transport plane when the passengers seize control.',
  'https://m.media-amazon.com/images/M/MV5BODcxOGFjOTEtM2M3Zi00ZWNiLWFjMTYtZDQ0Yjg2NTE2MzNiXkEyXkFqcGc@._V1_.jpg',
  1997,
  array['action', 'crime', 'thriller']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls063897780.',
  115,
  'Simon West',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Con Air'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Commando',
  'A retired Special Forces colonel tries to save his daughter, who was abducted by his former subordinate.',
  'https://m.media-amazon.com/images/M/MV5BZjAyNTRiMTEtNzNlZS00YTZhLThmNzQtZjBkOWQ4N2Y4YjQzXkEyXkFqcGc@._V1_.jpg',
  1985,
  array['action', 'adventure', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls063897780.',
  90,
  'Mark L. Lester',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Commando'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Darkman',
  'A brilliant scientist left for dead returns to exact revenge on the people who burned him alive.',
  'https://m.media-amazon.com/images/M/MV5BMTc5MzUxMjk4NF5BMl5BanBnXkFtZTgwNTEzNDk4NjE@._V1_.jpg',
  1990,
  array['action', 'sci-fi', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls063897780.',
  96,
  'Sam Raimi',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Darkman'
);

-- ---- IMDb list ls062655785 (100 Scariest Movies of All Time) ----
-- https://www.imdb.com/list/ls062655785/
-- Parsed from Internet Archive snapshot 20251026203646 (__NEXT_DATA__).
-- Skips insert when title already exists.

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Exorcist',
  'When a mysterious entity possesses a young girl, her mother seeks the help of two Catholic priests to save her life.',
  'https://m.media-amazon.com/images/M/MV5BZjg3YjE4ZjAtYTdmYS00ZTBkLWE1ZjgtNzAzODUwNzRiYjlmXkEyXkFqcGc@._V1_.jpg',
  1973,
  array['horror']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  122,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Exorcist'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hereditary',
  'A grieving family is haunted by tragic and disturbing occurrences.',
  'https://m.media-amazon.com/images/M/MV5BNTEyZGQwODctYWJjZi00NjFmLTg3YmEtMzlhNjljOGZhMWMyXkEyXkFqcGc@._V1_.jpg',
  2018,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  127,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hereditary'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Witch',
  'An isolated Puritan family in 1630s New England comes unraveled by the forces of witchcraft and possession.',
  'https://m.media-amazon.com/images/M/MV5BMTUyNzkwMzAxOF5BMl5BanBnXkFtZTgwMzc1OTk1NjE@._V1_.jpg',
  2015,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  92,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Witch'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Texas Chain Saw Massacre',
  'Five friends head out to rural Texas to visit the grave of a grandfather. On the way they stumble across what appears to be a deserted house, only to discover something sinister within. Something armed with a chainsaw.',
  'https://m.media-amazon.com/images/M/MV5BYjE1MGJkMjUtY2VkNi00N2U1LWI2NWEtMDExNGYzYjRkZTM0XkEyXkFqcGc@._V1_.jpg',
  1974,
  array['horror']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  83,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Texas Chain Saw Massacre'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Babadook',
  'A single mother and her child fall into a deep well of paranoia when an eerie children''s book titled "Mister Babadook" manifests in their home.',
  'https://m.media-amazon.com/images/M/MV5BMTk0NzMzODc2NF5BMl5BanBnXkFtZTgwOTYzNTM1MzE@._V1_.jpg',
  2014,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  94,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Babadook'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'High Tension',
  'Best friends Marie and Alexia decide to spend a quiet weekend at Alexia''s parents'' secluded farmhouse. But on the night of their arrival, the girls'' idyllic getaway turns into an endless night of horror.',
  'https://m.media-amazon.com/images/M/MV5BNmU0M2E0MGItM2QzMy00MTE5LThkYWEtNmZkNmM5YTg0ZTE0XkEyXkFqcGc@._V1_.jpg',
  2003,
  array['horror']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  91,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'High Tension'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Get Out',
  'A young African-American visits his white girlfriend''s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.',
  'https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_.jpg',
  2017,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  104,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Get Out'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sleep Tight',
  'Cesar is the superintendent of an apartment building and keeps very close tabs on the tenants. He secretly enjoys inflicting pain on others, and the occupant of apartment 5B will be his new target.',
  'https://m.media-amazon.com/images/M/MV5BNTg0OGM3ZmMtZjAzZS00MTY2LWI1ZmUtMmZkZTZiNjY3MTdiXkEyXkFqcGc@._V1_.jpg',
  2011,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  102,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Sleep Tight'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Evil Dead',
  'Five friends head to a remote cabin, where the discovery of a Book of the Dead leads them to unwittingly summon up demons living in the nearby woods.',
  'https://m.media-amazon.com/images/M/MV5BYjkwODM5ZWUtMjI2Ni00Y2RiLWJkNDYtZWQ2ZTRhMjI1N2FmXkEyXkFqcGc@._V1_.jpg',
  2013,
  array['horror']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  91,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Evil Dead'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Friday the 13th Part 2',
  'Five years after the events of the first film, a summer camp next to the infamous Camp Crystal Lake is preparing to open, but the legend of Jason is weighing heavy on the proceedings.',
  'https://m.media-amazon.com/images/M/MV5BYjBkMGM2MDAtMjUwYS00ZjVlLWEzNGItZDJmOTA2YmE2NjRhXkEyXkFqcGc@._V1_.jpg',
  1981,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  87,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Friday the 13th Part 2'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Midsommar',
  'A couple travels to Northern Europe to visit a rural hometown''s fabled Swedish mid-summer festival. What begins as an idyllic retreat quickly devolves into an increasingly violent and bizarre competition at the hands of a pagan cult.',
  'https://m.media-amazon.com/images/M/MV5BMzQxNzQzOTQwM15BMl5BanBnXkFtZTgwMDQ2NTcwODM@._V1_.jpg',
  2019,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  148,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Midsommar'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Suspiria',
  'A darkness swirls at the center of a world-renowned dance company, one that will engulf the artistic director, an ambitious young dancer, and a grieving psychotherapist. Some will succumb to the nightmare. Others will finally wake up.',
  'https://m.media-amazon.com/images/M/MV5BMjQ2MTIyNjM2MF5BMl5BanBnXkFtZTgwMDE3NDMyNjM@._V1_.jpg',
  2018,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  152,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Suspiria'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Goodnight Mommy',
  'Twin boys move to a new house with their mother after she has face-changing cosmetic surgery, but under the bandages is someone the boys don''t recognize.',
  'https://m.media-amazon.com/images/M/MV5BMjAyMDU2NjU4OF5BMl5BanBnXkFtZTgwNDg5ODc0NjE@._V1_.jpg',
  2014,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Goodnight Mommy'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Martyrs',
  'A young woman''s quest for revenge against the people who kidnapped and tormented her as a child leads her and a friend, who is also a victim of child abuse, on a terrifying journey into a living hell of depravity.',
  'https://m.media-amazon.com/images/M/MV5BN2Q5MWQ0OWYtMTUzMC00ZmU3LWEyNDAtZjg1NjE2ZjVkM2I3XkEyXkFqcGc@._V1_.jpg',
  2008,
  array['horror']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Martyrs'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Them',
  'Lucas and Clementine live peacefully in their isolated country house, but one night they wake up to strange noise... they''re not alone... and a group of hooded assailants begin to terrorize them throughout the night.',
  'https://m.media-amazon.com/images/M/MV5BNjU0MDUxMjIyN15BMl5BanBnXkFtZTcwNzk3MTgzMQ@@._V1_.jpg',
  2006,
  array['horror', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  77,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Them'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Psycho',
  'A secretary on the run for embezzlement takes refuge at a secluded California motel owned by a repressed man and his overbearing mother.',
  'https://m.media-amazon.com/images/M/MV5BYjZhMzFiZjItODA3ZC00MmRhLWIzMGYtMmVjOWUwYTA3MTRjXkEyXkFqcGc@._V1_.jpg',
  1960,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  109,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Psycho'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Lighthouse',
  'Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s.',
  'https://m.media-amazon.com/images/M/MV5BMTI4MjFhMjAtNmQxYi00N2IxLWJjMGEtYWY1YmU3OTQ0Zjk3XkEyXkFqcGc@._V1_.jpg',
  2019,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  109,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Lighthouse'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Us',
  'In order to get away from their busy lives, the Wilson family takes a vacation to Santa Cruz, California. At night, four strangers break into Adelaide''s childhood home. The family is shocked to find out that the intruders look like them.',
  'https://m.media-amazon.com/images/M/MV5BMzhkMjFkN2YtODU2Ni00YWYwLWExN2MtOWNjZmQxM2U4YTM5XkEyXkFqcGc@._V1_.jpg',
  2019,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  116,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Us'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Shining',
  'A family heads to an isolated hotel for the winter, where a sinister presence influences the father into violence. At the same time, his psychic son sees horrifying forebodings from both the past and the future.',
  'https://m.media-amazon.com/images/M/MV5BNmM5ZThhY2ItOGRjOS00NzZiLWEwYTItNDgyMjFkOTgxMmRiXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['drama', 'horror']::text[],
  'classic',
  8.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  146,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Shining'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Devils',
  'In 17th-century France, Father Urbain Grandier''s protection of the city of Loudun from the corrupt Cardinal Richelieu is undermined by a sexually repressed nun''s accusation of witchcraft.',
  'https://m.media-amazon.com/images/M/MV5BYjQzYzFmNmUtMWVkNS00MmU1LTkyMzUtYzhmNjIwM2ZjOWZmXkEyXkFqcGc@._V1_.jpg',
  1971,
  array['biography', 'drama', 'history']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  111,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Devils'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mother!',
  'A couple''s relationship is tested when uninvited guests arrive at their home, disrupting their tranquil existence.',
  'https://m.media-amazon.com/images/M/MV5BMzc5ODExODE0MV5BMl5BanBnXkFtZTgwNDkzNDUxMzI@._V1_.jpg',
  2017,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  121,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mother!'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Dark and the Wicked',
  'On a secluded farm in a nondescript rural town, a man is slowly dying. His family gathers to mourn, and soon a darkness grows, marked by waking nightmares and a growing sense that something evil is taking over the family.',
  'https://m.media-amazon.com/images/M/MV5BMDllNzZjY2MtNWVjNC00YjlhLWI2MzItNjJjMmY4M2JlMTI0XkEyXkFqcGc@._V1_.jpg',
  2020,
  array['horror']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  95,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Dark and the Wicked'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'REC',
  'A television reporter and cameraman follow emergency workers into a dark apartment building and are quickly locked inside with something terrifying.',
  'https://m.media-amazon.com/images/M/MV5BMDEzNDc5ODMtZTAyNi00MTNkLThkNGUtZGE2MDY0MjBiYjMzXkEyXkFqcGc@._V1_.jpg',
  2007,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  78,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'REC'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Halloween',
  'After being committed for 15 years, Michael Myers, now a grown man and still very dangerous, escapes from the mental institution and immediately returns to Haddonfield to find his baby sister, Laurie.',
  'https://m.media-amazon.com/images/M/MV5BMTMzOTg4MzcxNF5BMl5BanBnXkFtZTcwMzY5MDE1MQ@@._V1_.jpg',
  2007,
  array['horror']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  109,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Halloween'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Repulsion',
  'A withdrawn young manicurist who lives with her sister sinks into deep depression. When her sister leaves for a vacation, she begins to hallucinate, which quickly devolves into homicidal mania.',
  'https://m.media-amazon.com/images/M/MV5BOTE0YzBjNWEtZTE4NC00ZmM5LTllZmUtZGYwOGFlYWVjOGU2XkEyXkFqcGc@._V1_.jpg',
  1965,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  105,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Repulsion'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Jaws',
  'When a massive killer shark unleashes chaos on a beach community off Long Island, it''s up to the local police chief, a marine biologist, and an old seafarer to hunt the beast down.',
  'https://m.media-amazon.com/images/M/MV5BYjViNDQzNmUtYzkxZi00NTk5LTljMmItYjJlZmZkODIxNjU1XkEyXkFqcGc@._V1_.jpg',
  1975,
  array['adventure', 'horror', 'thriller']::text[],
  'classic',
  8.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  124,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Jaws'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Barbarian',
  'A woman staying at an Airbnb discovers that the house she has rented is not what it seems.',
  'https://m.media-amazon.com/images/M/MV5BNWQ5MDgwMzMtNWZhMy00Y2Q4LWI5NTAtODA4MDIzYTExOGQzXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  102,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Barbarian'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Eraserhead',
  'Henry Spencer tries to survive his industrial environment, his angry girlfriend, and the unbearable screams of his newborn mutant child.',
  'https://m.media-amazon.com/images/M/MV5BNGYxNzZkYzAtMDExMS00MzE1LTg5ZGItMTgzMzJhZWMyNTBjXkEyXkFqcGc@._V1_.jpg',
  1977,
  array['fantasy', 'horror']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  89,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Eraserhead'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Children of the Corn',
  'A young couple is trapped in a remote town where a dangerous religious cult of children believes that everyone over age 18 must be killed.',
  'https://m.media-amazon.com/images/M/MV5BNjFmZjhkNDYtZThjZi00YWY4LWFkYjMtNDM3YjkyODMxZDNmXkEyXkFqcGc@._V1_.jpg',
  1984,
  array['horror', 'thriller']::text[],
  'classic',
  5.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  92,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Children of the Corn'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Maniac',
  'A psychopathic man goes on a killing and mutilation spree in New York City.',
  'https://m.media-amazon.com/images/M/MV5BOTk2NGNmNzAtODkyOS00ZDMzLWI0NDMtMWExNjZjZmVmNGVmXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['crime', 'drama', 'horror']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  87,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Maniac'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Baskin',
  'A squad of unsuspecting cops go through a trapdoor to Hell when they stumble upon a Black Mass in an abandoned building.',
  'https://m.media-amazon.com/images/M/MV5BNDI2NzAwOTEzOV5BMl5BanBnXkFtZTgwMzMxNzI2ODE@._V1_.jpg',
  2015,
  array['horror', 'thriller']::text[],
  'classic',
  5.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  97,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Baskin'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'House of 1000 Corpses',
  'Two young couples traveling across the backwoods of Texas searching for urban legends of murder end up as prisoners of a bizarre and sadistic backwater family of serial killers.',
  'https://m.media-amazon.com/images/M/MV5BNjUyNjU0NDE0OV5BMl5BanBnXkFtZTYwNzcwMzg3._V1_.jpg',
  2003,
  array['horror']::text[],
  'classic',
  6.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  89,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'House of 1000 Corpses'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'X',
  'In 1979, a group of young filmmakers set out to make an adult film in a rural Texas farm, but when their reclusive, elderly hosts catch them in the act, the crew find themselves fighting for their lives.',
  'https://m.media-amazon.com/images/M/MV5BODUwYTNhMTMtYWQ5Ny00YTdmLWIxOTAtNDczNzVlYzg2NDFkXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  105,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'X'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'V/H/S',
  'When a group of misfits are hired by an unknown third party to burglarize a desolate house and acquire a rare VHS tape, they discover more found footage than they bargained for.',
  'https://m.media-amazon.com/images/M/MV5BMTUwODAxMzMwNF5BMl5BanBnXkFtZTcwMTk3MTQ5Nw@@._V1_.jpg',
  2012,
  array['fantasy', 'horror', 'mystery']::text[],
  'classic',
  5.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  116,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'V/H/S'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'It Follows',
  'A young woman is followed by an unknown supernatural force after a sexual encounter.',
  'https://m.media-amazon.com/images/M/MV5BNGZiYWRiYjAtODU0NS00YzAzLTk2MzQtZGVlMzVjM2M3MGQ3XkEyXkFqcGc@._V1_.jpg',
  2014,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  100,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'It Follows'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Blair Witch Project',
  'Three film students vanish after traveling into a Maryland forest to film a documentary on the local Blair Witch legend, leaving only their footage behind.',
  'https://m.media-amazon.com/images/M/MV5BNGFmYzA5NzktOTc1Ni00YTIxLWJiZTEtNmEyZjBjNDM2MjRlXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['horror', 'mystery']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  81,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Blair Witch Project'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Evil Dead II',
  'Ash Williams, the lone survivor of an earlier onslaught of flesh-possessing spirits, holes up in a cabin with a group of strangers while the demons continue their attack.',
  'https://m.media-amazon.com/images/M/MV5BMGMxMWVhMzAtYWRlOS00YzY1LTlkYTQtYjU5ZDM4MGI1YWFjXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['comedy', 'horror']::text[],
  'classic',
  7.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  84,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Evil Dead II'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Descent',
  'A caving expedition goes horribly wrong, as the explorers become trapped and ultimately pursued by a strange breed of predators.',
  'https://m.media-amazon.com/images/M/MV5BMjA5NzQ1NTgwNV5BMl5BanBnXkFtZTcwNjUxMzUzMw@@._V1_.jpg',
  2005,
  array['adventure', 'horror', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Descent'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Open Water',
  'Based on the true story of two scuba divers accidentally stranded in shark infested waters after their tour boat has left.',
  'https://m.media-amazon.com/images/M/MV5BNjQ5ODAyOTk3OF5BMl5BanBnXkFtZTcwNzQ1NjYyMQ@@._V1_.jpg',
  2003,
  array['adventure', 'drama', 'horror']::text[],
  'classic',
  5.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  79,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Open Water'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Se7en',
  'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.',
  'https://m.media-amazon.com/images/M/MV5BY2IzNzMxZjctZjUxZi00YzAxLTk3ZjMtODFjODdhMDU5NDM1XkEyXkFqcGc@._V1_.jpg',
  1995,
  array['crime', 'drama', 'mystery']::text[],
  'classic',
  8.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  127,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Se7en'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Human Centipede 2 (Full Sequence)',
  'Inspired by the fictional Dr. Heiter, disturbed loner Martin dreams of creating a 12-person centipede and sets out to realize his sick fantasy.',
  'https://m.media-amazon.com/images/M/MV5BMjkwMDI0NjA5OV5BMl5BanBnXkFtZTcwODAxODI4Ng@@._V1_.jpg',
  2011,
  array['horror']::text[],
  'classic',
  3.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  91,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Human Centipede 2 (Full Sequence)'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Bug',
  'An unhinged war veteran holes up with a lonely woman in a spooky Oklahoma motel room. The line between reality and delusion is blurred as they discover a bug infestation.',
  'https://m.media-amazon.com/images/M/MV5BMjIzOTUzMDkzMV5BMl5BanBnXkFtZTcwMDY2MjMzMw@@._V1_.jpg',
  2006,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  102,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Bug'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Funny Games',
  'Two psychopathic young men take a family hostage in their cabin.',
  'https://m.media-amazon.com/images/M/MV5BMTg4OTExNTYzMV5BMl5BanBnXkFtZTcwOTg1MDU1MQ@@._V1_.jpg',
  2007,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  111,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Funny Games'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hellbound: Hellraiser II',
  'Kirsty is brought to an institution after the horrible events of Hellraiser (1987), where the occult-obsessive head doctor resurrects Julia and unleashes the Cenobites and their demonic underworld.',
  'https://m.media-amazon.com/images/M/MV5BZDU4NTQ3MjItZjhlNy00NDllLTllMjctYTE2MDI3OTUwNDM5XkEyXkFqcGc@._V1_.jpg',
  1988,
  array['horror', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  97,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hellbound: Hellraiser II'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Hills Have Eyes',
  'A traveling family falls victim to a group of mutated cannibals in a desert far away from civilization.',
  'https://m.media-amazon.com/images/M/MV5BMzk0MTg5MzEyOF5BMl5BanBnXkFtZTcwNDUyMzIzMQ@@._V1_.jpg',
  2006,
  array['horror', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  107,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Hills Have Eyes'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hostel',
  'Three backpackers head to a Slovak city that promises to meet their hedonistic expectations, with no idea of the hell that awaits them.',
  'https://m.media-amazon.com/images/M/MV5BMTY1NDA3ODM1OV5BMl5BanBnXkFtZTcwMDM5NzEzMQ@@._V1_.jpg',
  2005,
  array['horror']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls062655785.',
  94,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hostel'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Texas Chainsaw Massacre',
  'After picking up a traumatized young hitchhiker, five friends find themselves stalked and hunted by a deformed chainsaw-wielding loon and his family of equally psychopathic killers.',
  'https://m.media-amazon.com/images/M/MV5BNzY0MDQwMTctYzQ1Mi00ODIwLThlMWQtODQ0NzA2ZTg3ZDFhXkEyXkFqcGc@._V1_.jpg',
  2003,
  array['horror']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  98,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Texas Chainsaw Massacre'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Friday the 13th',
  'A group of teenage camp counselors attempt to re-open an abandoned summer camp with a tragic past, but they are stalked by a mysterious, relentless killer.',
  'https://m.media-amazon.com/images/M/MV5BNzI1ODZhNDctNTdjOC00Mzg2LTg1ZjktNjJkNjA2YzYxMGQzXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  95,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Friday the 13th'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Alien',
  'After investigating a mysterious transmission of unknown origin, the crew of a commercial spacecraft encounters a deadly lifeform.',
  'https://m.media-amazon.com/images/M/MV5BN2NhMDk2MmEtZDQzOC00MmY5LThhYzAtMDdjZGFjOGZjMjdjXkEyXkFqcGc@._V1_.jpg',
  1979,
  array['horror', 'sci-fi']::text[],
  'classic',
  8.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  117,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Alien'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Frailty',
  'A mysterious man arrives at the offices of an FBI agent and recounts his childhood: how his religious fanatic father received visions telling him to destroy people who were in fact "demons."',
  'https://m.media-amazon.com/images/M/MV5BM2MyMWVjNGYtZmRkOC00ZWI4LWI2OWEtYzY3YjNiZjgwNGFkXkEyXkFqcGc@._V1_.jpg',
  2001,
  array['crime', 'drama', 'thriller']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  100,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Frailty'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Thing',
  'A research team in Antarctica is hunted by a shape-shifting alien that assumes the appearance of its victims.',
  'https://m.media-amazon.com/images/M/MV5BYTA3NDU5MWEtNTk4Yy00ZDNkLThmZTQtMjU3ZGVhYzAyMzU4XkEyXkFqcGc@._V1_.jpg',
  1982,
  array['horror', 'mystery', 'sci-fi']::text[],
  'classic',
  8.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  109,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Thing'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Drag Me to Hell',
  'An ambitious loan officer must find a way to shatter a curse that threatens her soul with damnation.',
  'https://m.media-amazon.com/images/M/MV5BMTQwNTMyNjc5Ml5BMl5BanBnXkFtZTcwOTI2MTQ0Mg@@._V1_.jpg',
  2009,
  array['horror']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Drag Me to Hell'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'As Above, So Below',
  'When a team of explorers venture into the catacombs that lie beneath the streets of Paris, they uncover the dark secret that lies within this city of the dead.',
  'https://m.media-amazon.com/images/M/MV5BMTQzNzg0NDI2MF5BMl5BanBnXkFtZTgwMzgxNzY2MTE@._V1_.jpg',
  2014,
  array['adventure', 'horror', 'mystery']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  93,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'As Above, So Below'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Green Room',
  'A punk rock band is forced to fight for survival after witnessing a murder at a neo-Nazi skinhead bar.',
  'https://m.media-amazon.com/images/M/MV5BMjU1ODQ5NzA0N15BMl5BanBnXkFtZTgwMDg5MTA5NzE@._V1_.jpg',
  2015,
  array['crime', 'horror', 'music']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  95,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Green Room'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Omen',
  'Mysterious deaths surround an American ambassador. Could the child that he is raising actually be the Antichrist? The Devil''s own son?',
  'https://m.media-amazon.com/images/M/MV5BOTgxNjY0OTEtYWExOC00OWJiLWEzY2ItNzNjYTY0YjhjNjlhXkEyXkFqcGc@._V1_.jpg',
  1976,
  array['horror', 'mystery']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  111,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Omen'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Wicker Man',
  'A puritan police sergeant arrives in a Scottish island village in search of a missing girl, who the pagan locals claim never existed.',
  'https://m.media-amazon.com/images/M/MV5BMWU5NmUxMmYtM2QwYS00ODc1LTkxOGItMWY3ZmEzNzJkNGU3XkEyXkFqcGc@._V1_.jpg',
  1973,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  88,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Wicker Man'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Jeepers Creepers',
  'A brother and sister driving home through isolated countryside for spring break encounter a flesh-eating creature which is in the midst of its ritualistic eating spree.',
  'https://m.media-amazon.com/images/M/MV5BMTkwNDU0NTE0OV5BMl5BanBnXkFtZTgwNzAzNzQyMTI@._V1_.jpg',
  2001,
  array['horror', 'mystery']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  90,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Jeepers Creepers'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Devil''s Rejects',
  'The murderous, backwoods Firefly family take to the road to escape the vengeful Sheriff Wydell, who is not afraid of being as ruthless as his target.',
  'https://m.media-amazon.com/images/M/MV5BMzg0MmNkM2MtZDc1Ni00OTVhLTg1NjgtY2UxYjM1Y2JjMDgzXkEyXkFqcGc@._V1_.jpg',
  2005,
  array['crime', 'drama', 'horror']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  107,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Devil''s Rejects'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Event Horizon',
  'A rescue crew is tasked with investigating the mysterious reappearance of a spaceship that had been lost for seven years.',
  'https://m.media-amazon.com/images/M/MV5BM2M4ZTI2MjMtYjVlNy00Y2E3LTgzM2EtNDA0NTUzZmQxZjY3XkEyXkFqcGc@._V1_.jpg',
  1997,
  array['horror', 'sci-fi', 'thriller']::text[],
  'classic',
  6.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  96,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Event Horizon'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Serpent and the Rainbow',
  'An anthropologist goes to Haiti to research a drug that makes someone appear dead by suspending all vital signs.',
  'https://m.media-amazon.com/images/M/MV5BMDhhMzYyMjQtODUxYS00ZGVhLWFmMTYtOTBiZDljNjkyYTk2XkEyXkFqcGc@._V1_.jpg',
  1988,
  array['fantasy', 'horror']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  98,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Serpent and the Rainbow'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'A Nightmare on Elm Street',
  'Teenager Nancy Thompson must uncover the dark truth concealed by her parents after she and her friends become targets of the spirit of a serial killer with a bladed glove in their dreams, in which if they die, it kills them in real life.',
  'https://m.media-amazon.com/images/M/MV5BNTZmN2VlMWMtMTdlMi00NDBhLWIyODMtODEwMzM0ODMwMWYwXkEyXkFqcGc@._V1_.jpg',
  1984,
  array['horror']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  91,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'A Nightmare on Elm Street'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Cannibal Holocaust',
  'An anthropologist ventures into the Amazon rainforest on a rescue mission, where he recovers footage shot by a film crew documenting their disastrous encounters with local cannibal tribes.',
  'https://m.media-amazon.com/images/M/MV5BMWI4YWFkYmEtNTU4ZS00MjhkLTg0NTUtNWI4NDMxNTg2ZjEwXkEyXkFqcGc@._V1_.jpg',
  1980,
  array['adventure', 'horror']::text[],
  'classic',
  5.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  95,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Cannibal Holocaust'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Fly',
  'A botched experiment transmutes a man into a monstrous insect.',
  'https://m.media-amazon.com/images/M/MV5BOTBlNTliNTItY2VhNS00MjA5LTllYzItMmQyNGRjYTAyZWQxXkEyXkFqcGc@._V1_.jpg',
  1986,
  array['drama', 'horror', 'sci-fi']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  96,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Fly'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Audition',
  'A widower has his film producer friend organize a fake audition as a means of helping him find a new girlfriend, but the woman he selects is not who she appears to be.',
  'https://m.media-amazon.com/images/M/MV5BNmRiZjI3ZTctNjZiNC00ZWFhLTkwMTItZGZjYTJlZTBkMjZjXkEyXkFqcGc@._V1_.jpg',
  1999,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  115,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Audition'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '28 Days Later',
  'Four weeks after a mysterious, incurable virus spreads throughout the United Kingdom, a handful of survivors try to find sanctuary.',
  'https://m.media-amazon.com/images/M/MV5BM2I4NTI0ZGQtNGQ2ZC00ODIxLWI2N2QtMDBkNzI1NDhjYjE5XkEyXkFqcGc@._V1_.jpg',
  2002,
  array['drama', 'horror', 'sci-fi']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  113,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '28 Days Later'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Vivarium',
  'A young couple looking for the perfect home find themselves trapped in a mysterious labyrinth-like neighborhood of identical houses.',
  'https://m.media-amazon.com/images/M/MV5BZjdlZmRmOTUtN2IxZi00ZmY2LWE5MWMtOTYxNTkyNzA3ZGFjXkEyXkFqcGc@._V1_.jpg',
  2019,
  array['horror', 'mystery', 'sci-fi']::text[],
  'classic',
  5.9::numeric,
  'Catalogue: IMDb list ls062655785.',
  97,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Vivarium'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Cabin Fever',
  'Five college graduates rent a cabin in the woods and begin to fall victim to a horrifying flesh-eating virus, which attracts the unwanted attention of the homicidal locals.',
  'https://m.media-amazon.com/images/M/MV5BMTEwNTU3NzM2NDJeQTJeQWpwZ15BbWU2MDY2ODcyNw@@._V1_.jpg',
  2002,
  array['horror']::text[],
  'classic',
  5.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  93,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Cabin Fever'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Visit',
  'Two siblings become increasingly frightened by their grandparents'' disturbing behavior while visiting them on vacation.',
  'https://m.media-amazon.com/images/M/MV5BMTg3OTM2OTc5MV5BMl5BanBnXkFtZTgwMjMxNDM0NTE@._V1_.jpg',
  2015,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  94,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Visit'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Amityville Horror',
  'Newlyweds and their children battle a demonic presence in their home.',
  'https://m.media-amazon.com/images/M/MV5BNWRmOTdhMWEtYmExOC00Y2E5LTkwYjEtYTAwY2Q0MTU0MTBlXkEyXkFqcGc@._V1_.jpg',
  1979,
  array['horror']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  117,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Amityville Horror'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Poltergeist',
  'A family''s home becomes the center of paranormal activity that opens a doorway to the "other side." With help, they must cross over to get their daughter back.',
  'https://m.media-amazon.com/images/M/MV5BNzY4MGZkYjgtYTQ2YS00YTlhLWEyMjAtMjZhYzczNTRlM2ZmXkEyXkFqcGc@._V1_.jpg',
  1982,
  array['horror', 'thriller']::text[],
  'classic',
  7.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  114,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Poltergeist'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ichi the Killer',
  'As sadomasochistic yakuza enforcer Kakihara searches for his missing boss he comes across Ichi, a repressed and psychotic killer who may be able to inflict levels of pain that Kakihara has only dreamed of achieving.',
  'https://m.media-amazon.com/images/M/MV5BODJmM2NjNDctZjE3My00ZjE3LWExYzUtYjg1N2YyODEzNGIyXkEyXkFqcGc@._V1_.jpg',
  2001,
  array['action', 'crime', 'drama']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls062655785.',
  129,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Ichi the Killer'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Silent Hill',
  'Rose Da Silva takes her adopted daughter, Sharon, to the town of Silent Hill in an attempt to cure her of her ailment. After a violent car crash, Sharon disappears and Rose begins a horrific journey to get her back.',
  'https://m.media-amazon.com/images/M/MV5BYTczZmZlZmEtODU4ZS00YzgzLThiMDUtMGE0ZmJhYzdhZGY5XkEyXkFqcGc@._V1_.jpg',
  2006,
  array['horror', 'mystery']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  125,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Silent Hill'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Sleepaway Camp',
  'Bunks and showers are a mad stabber''s beat at a summer camp strictly for teens.',
  'https://m.media-amazon.com/images/M/MV5BN2IyOWU4MGUtZjEyNC00ODNjLTg3OGMtZmNlM2ZlZDYzOWJjXkEyXkFqcGc@._V1_.jpg',
  1983,
  array['horror']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  84,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Sleepaway Camp'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Strangers',
  'James Hoyt and Kristen McKay visit an isolated vacation home to enjoy some time together. However, they are in for a rude surprise when three masked assailants make their stay a nightmare.',
  'https://m.media-amazon.com/images/M/MV5BMTkxODAyODMwNV5BMl5BanBnXkFtZTcwNzk5Nzk2MQ@@._V1_.jpg',
  2008,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  86,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Strangers'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Ring',
  'A journalist must investigate a mysterious videotape which seems to cause the death of anyone one week to the day after they view it.',
  'https://m.media-amazon.com/images/M/MV5BNDA2NTg2NjE4Ml5BMl5BanBnXkFtZTYwMjYxMDg5._V1_.jpg',
  2002,
  array['horror', 'mystery']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  115,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Ring'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Paranormal Activity',
  'After moving into a suburban home, a couple becomes increasingly disturbed by a nightly demonic presence.',
  'https://m.media-amazon.com/images/M/MV5BMjY1NjcxODQ4MV5BMl5BanBnXkFtZTcwMzUxNjM4Mg@@._V1_.jpg',
  2007,
  array['horror', 'mystery']::text[],
  'classic',
  6.3::numeric,
  'Catalogue: IMDb list ls062655785.',
  86,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Paranormal Activity'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Jacob''s Ladder',
  'Mourning his dead son, a haunted Vietnam War veteran attempts to uncover his past while suffering from a severe case of dissociation. To do so, he must decipher reality and life from his own dreams, delusions, and perceptions of death.',
  'https://m.media-amazon.com/images/M/MV5BNjUwMTU2ODgxOF5BMl5BanBnXkFtZTgwMjU1NTk4NjE@._V1_.jpg',
  1990,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  113,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Jacob''s Ladder'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Raw',
  'A young woman, studying to be a vet, develops a craving for human flesh.',
  'https://m.media-amazon.com/images/M/MV5BMTU3MDUxMDI0MV5BMl5BanBnXkFtZTgwMzk3OTg3MDI@._V1_.jpg',
  2016,
  array['drama', 'horror']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Raw'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Wrong Turn',
  'Chris and a group of five friends are left stranded deep in the middle of the woods after their cars collide. As they venture deeper into the woods, they face an uncertain and bloodcurdling fate.',
  'https://m.media-amazon.com/images/M/MV5BMTU5MDU2NTQ0M15BMl5BanBnXkFtZTgwNjg4MzYyMDI@._V1_.jpg',
  2003,
  array['horror', 'thriller']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  84,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Wrong Turn'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Ouija: Origin of Evil',
  'In 1967 Los Angeles, a widowed mother''s daughter tries to communicate with her late father through a Ouija board, but unleashes a demon instead.',
  'https://m.media-amazon.com/images/M/MV5BNzhmYzkyNjUtNmI2OC00MWY2LWFjN2MtNjIwMGRkOWMyYzI0XkEyXkFqcGc@._V1_.jpg',
  2016,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  99,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Ouija: Origin of Evil'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Dawn of the Dead',
  'A nurse, a policeman, a young married couple and other survivors of a worldwide plague that is producing aggressive, flesh-eating zombies take refuge in a mega Midwestern shopping mall.',
  'https://m.media-amazon.com/images/M/MV5BM2ZiYjNlMWYtNTc2My00ZTM4LWJhMjQtM2FlOWM0ZmE0Yjg1XkEyXkFqcGc@._V1_.jpg',
  2004,
  array['action', 'horror']::text[],
  'classic',
  7.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  101,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Dawn of the Dead'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Pearl',
  'In 1918, a young woman on the brink of madness pursues stardom in a desperate attempt to escape the drudgery, isolation, and lovelessness of life on her parents'' farm.',
  'https://m.media-amazon.com/images/M/MV5BNzk0Y2RlZjItZDUzYi00Y2JhLTk5MzMtNjgzYWFmZmUxN2FmXkEyXkFqcGc@._V1_.jpg',
  2022,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  103,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Pearl'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Cabin in the Woods',
  'A group of kids go to a remote cabin in the woods where their fate is unknowingly controlled by technicians as part of a world-wide conspiracy where all horror movie cliches are revealed to be part of an elaborate sacrifice ritual.',
  'https://m.media-amazon.com/images/M/MV5BNTUxNzYyMjg2N15BMl5BanBnXkFtZTcwMTExNzExNw@@._V1_.jpg',
  2011,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  95,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Cabin in the Woods'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Saw',
  'Two men awaken to find themselves on the opposite sides of a dead body, each with specific instructions to kill the other, escape or face the consequences. These two are the latest contestants in Jigsaw''s games.',
  'https://m.media-amazon.com/images/M/MV5BZTE5MzFlMTktMzBkOC00ZjMxLThmOTAtOGU3ZGEwZGRlNDdjXkEyXkFqcGc@._V1_.jpg',
  2004,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  7.6::numeric,
  'Catalogue: IMDb list ls062655785.',
  103,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Saw'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'An American Werewolf in London',
  'American college students David Kessler and Jack Goodman on a walking tour of Britain are attacked by a werewolf that none of the locals will admit exists. Jack dies. David recovers in a hospital, where he has nightmares.',
  'https://m.media-amazon.com/images/M/MV5BOWYyNmMwMTUtZjE2OC00YWQzLWJmMzctNzhmMDI1OTQwNzdhXkEyXkFqcGc@._V1_.jpg',
  1981,
  array['comedy', 'horror']::text[],
  'classic',
  7.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  97,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'An American Werewolf in London'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Hellraiser',
  'A woman discovers the newly resurrected, partially formed, body of her brother-in-law and lover. She starts killing for him to revitalize his body and escape the demonic beings that are pursuing him after he escaped their underworld.',
  'https://m.media-amazon.com/images/M/MV5BZGI4MzkzNzQtYjA3MC00ZjE1LWI0NWUtMDdjNWQ3OTgxZTkwXkEyXkFqcGc@._V1_.jpg',
  1987,
  array['horror', 'thriller']::text[],
  'classic',
  6.9::numeric,
  'Catalogue: IMDb list ls062655785.',
  94,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Hellraiser'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Let the Right One In',
  'A bullied boy forms a unique friendship with his new neighbor, a peculiar girl with a dark secret.',
  'https://m.media-amazon.com/images/M/MV5BNjgxZGFlYjktNjE2NC00YTkzLTlhY2QtNDJmMDhmMGEzOTcwXkEyXkFqcGc@._V1_.jpg',
  2008,
  array['drama', 'fantasy', 'horror']::text[],
  'classic',
  7.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  114,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Let the Right One In'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Cannibal Ferox',
  'Three friends embark on a trip through the Amazon jungle to disprove cannibalism, where they meet a pair of fugitive drug smugglers forcing a vicious cannibal tribe to harvest cocaine.',
  'https://m.media-amazon.com/images/M/MV5BYjgxYWI3NmYtYWMzYy00OGI2LTgzNDYtZWJkYTc0YTNkMGVhXkEyXkFqcGc@._V1_.jpg',
  1981,
  array['adventure', 'horror']::text[],
  'classic',
  5.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  93,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Cannibal Ferox'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Re-Animator',
  'After an odd new medical student arrives on campus, a dedicated local and his girlfriend become involved in bizarre experiments centering around the re-animation of dead tissue.',
  'https://m.media-amazon.com/images/M/MV5BZGZhYzk5MDEtOTc2Yi00ZTAyLWI1MjctZDYzYzhmNzgyZThlXkEyXkFqcGc@._V1_.jpg',
  1985,
  array['comedy', 'horror', 'sci-fi']::text[],
  'classic',
  7.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  84,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Re-Animator'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Autopsy of Jane Doe',
  'Father and son coroners investigate the death of a beautiful Jane Doe.',
  'https://m.media-amazon.com/images/M/MV5BMjA2MTEzMzkzM15BMl5BanBnXkFtZTgwMjM2MTM5MDI@._V1_.jpg',
  2016,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  86,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Autopsy of Jane Doe'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  '1408',
  'Author Michael Enslin, who specializes in debunking paranormal occurrences, checks into the fabled room 1408 in the Dolphin Hotel in New York City, settles in, and soon confronts genuine terror.',
  'https://m.media-amazon.com/images/M/MV5BMjQ2ODkxMjc4OV5BMl5BanBnXkFtZTgwMTgzNzQyMTI@._V1_.jpg',
  2007,
  array['fantasy', 'horror', 'mystery']::text[],
  'classic',
  6.8::numeric,
  'Catalogue: IMDb list ls062655785.',
  104,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = '1408'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Mirrors',
  'Ben guards a partly-destroyed property by night but begins to see strange images in its impeccable mirrors. After his sister is killed, he is convinced that evil forces are out to get him.',
  'https://m.media-amazon.com/images/M/MV5BMTI2NTA1ODEyOF5BMl5BanBnXkFtZTcwNjc3MjY3MQ@@._V1_.jpg',
  2008,
  array['horror', 'mystery']::text[],
  'classic',
  6.1::numeric,
  'Catalogue: IMDb list ls062655785.',
  110,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Mirrors'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Last Exorcism',
  'A troubled evangelical minister agrees to let his last exorcism be filmed by a documentary crew.',
  'https://m.media-amazon.com/images/M/MV5BNDc4Mjk2MjA0NF5BMl5BanBnXkFtZTcwMzMyNjQ3Mw@@._V1_.jpg',
  2010,
  array['horror', 'mystery', 'thriller']::text[],
  'classic',
  5.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  87,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Last Exorcism'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'Child''s Play',
  'A dying serial killer transfers his consciousness into a popular kids doll using voodoo. A struggling single mother gifts her six-year-old son the much sought-after doll for his birthday, and the doll slowly begins to show its true colors.',
  'https://m.media-amazon.com/images/M/MV5BOTc2M2FjMDMtYzBmNS00ODMxLWJjOTYtZmNkMDYxMTU5ZTBhXkEyXkFqcGc@._V1_.jpg',
  1988,
  array['horror', 'thriller']::text[],
  'classic',
  6.7::numeric,
  'Catalogue: IMDb list ls062655785.',
  87,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'Child''s Play'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'His House',
  'A refugee couple makes a harrowing escape from war-torn South Sudan, but then they struggle to adjust to their new life in an English town that has an evil lurking beneath the surface.',
  'https://m.media-amazon.com/images/M/MV5BMDBjNmYxMjctMjViNC00NmRlLWJkZWYtOTE2ZmY4ZDg3NmMyXkEyXkFqcGc@._V1_.jpg',
  2020,
  array['drama', 'horror', 'thriller']::text[],
  'classic',
  6.4::numeric,
  'Catalogue: IMDb list ls062655785.',
  93,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'His House'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Last House on the Left',
  'After kidnapping and brutally assaulting two young women, a gang unknowingly finds refuge at a vacation home belonging to the parents of one of the victims: a mother and father who devise an increasingly gruesome series of revenge tactics.',
  'https://m.media-amazon.com/images/M/MV5BMjExMTM4MDAwOF5BMl5BanBnXkFtZTcwODcyMDIzMg@@._V1_.jpg',
  2009,
  array['horror', 'thriller']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  113,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Last House on the Left'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'I Spit on Your Grave',
  'A writer who is brutalized during her cabin retreat seeks revenge on her attackers, who left her for dead.',
  'https://m.media-amazon.com/images/M/MV5BMTkxMTE3NzEzMl5BMl5BanBnXkFtZTcwMzc4MTU2Mw@@._V1_.jpg',
  2010,
  array['horror', 'thriller']::text[],
  'classic',
  6.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  108,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'I Spit on Your Grave'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Lords of Salem',
  'Radio DJ Heidi is sent a box containing a record--a "gift from the Lords". The sounds within the grooves trigger flashbacks of her town''s violent past. Is Heidi going mad, or are the Lords back to take revenge on Salem, Massachusetts?',
  'https://m.media-amazon.com/images/M/MV5BMjA2NTc5Njc4MV5BMl5BanBnXkFtZTcwNTYzMTcwOQ@@._V1_.jpg',
  2012,
  array['horror', 'thriller']::text[],
  'classic',
  5.2::numeric,
  'Catalogue: IMDb list ls062655785.',
  101,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Lords of Salem'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Howling',
  'After a bizarre and near deadly encounter with a serial killer, a television newswoman is sent to a remote mountain resort whose residents may not be what they seem.',
  'https://m.media-amazon.com/images/M/MV5BM2RhZWNhZWYtOTVkZS00N2Q4LTk3MmQtNDI1YTVjZmY3NmRjXkEyXkFqcGc@._V1_.jpg',
  1981,
  array['horror']::text[],
  'classic',
  6.5::numeric,
  'Catalogue: IMDb list ls062655785.',
  91,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Howling'
);

insert into public.movies (
  title, overview, poster_url, release_year, genres, category, rating,
  review_text, runtime_minutes, director, language, approval_status, created_by
)
select
  'The Killing of a Sacred Deer',
  'Steven, a charismatic surgeon, is forced to make an unthinkable sacrifice after his life starts to fall apart, when the behavior of a teenage boy he has taken under his wing turns sinister.',
  'https://m.media-amazon.com/images/M/MV5BMjU4NDcwOTA2NF5BMl5BanBnXkFtZTgwMjE2OTg4MzI@._V1_.jpg',
  2017,
  array['drama', 'horror', 'mystery']::text[],
  'classic',
  7.0::numeric,
  'Catalogue: IMDb list ls062655785.',
  121,
  '',
  '',
  'approved',
  null::uuid
where not exists (
  select 1 from public.movies m where m.title = 'The Killing of a Sacred Deer'
);

