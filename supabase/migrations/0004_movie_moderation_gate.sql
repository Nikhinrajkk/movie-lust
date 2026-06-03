-- Every new movie must start as pending; only admins can publish via UPDATE.
-- Adds approved_by (moderator). Run after 0002_data.sql on new projects.

alter table public.movies
  add column if not exists approved_by uuid references auth.users (id) on delete set null;

create index if not exists movies_approved_by_idx on public.movies (approved_by);

alter table public.movies
  alter column approval_status set default 'pending';

comment on column public.movies.approved_by is
  'Auth user id of the admin who approved the row (set by moderation UI).';

-- Inserts may only enqueue as pending for the current user (admins included).
drop policy if exists "movies_insert_rules" on public.movies;

create policy "movies_insert_rules"
  on public.movies for insert
  to authenticated
  with check (
    approval_status = 'pending'
    and created_by = (select auth.uid())
  );

-- Block INSERT ... approved (or rejected) even as table owner in SQL editor.
create or replace function public.movies_insert_must_be_pending()
returns trigger
language plpgsql
as $$
begin
  if new.approval_status is distinct from 'pending' then
    raise exception
      'movies: new rows must use approval_status = pending (got %). Approve via Admin → Pending submissions.',
      new.approval_status;
  end if;
  new.approved_by := null;
  return new;
end;
$$;

drop trigger if exists trg_movies_insert_must_be_pending on public.movies;
create trigger trg_movies_insert_must_be_pending
  before insert on public.movies
  for each row
  execute function public.movies_insert_must_be_pending();
