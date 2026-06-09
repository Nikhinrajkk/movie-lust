-- Allow half-star ratings (0.5–5 in 0.5 steps) on movie_user_reviews.

alter table public.movie_user_reviews
  drop constraint if exists movie_user_reviews_stars_range;

alter table public.movie_user_reviews
  alter column stars type numeric(3, 1)
  using (
    case
      when stars is null then null
      else least(5::numeric, greatest(0.5::numeric, (stars::numeric * 2::numeric) / 2::numeric))
    end
  );

alter table public.movie_user_reviews
  add constraint movie_user_reviews_stars_range check (
    stars is null
    or (
      stars >= 0.5
      and stars <= 5
      and stars * 2 = trunc(stars * 2)
    )
  );
