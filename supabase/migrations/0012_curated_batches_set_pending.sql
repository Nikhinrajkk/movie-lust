-- Set movies from migrations 0010 + 0011 to pending (not approved).
-- Safe to re-run: only touches rows tagged by those seed review_text values.

update public.movies
set
  approval_status = 'pending',
  approved_by = null,
  updated_at = now()
where review_text in (
  'Catalogue: curated IMDb batch (2026-06-11).',
  'Catalogue: IMDb list ls021615613 (Best Feel-Good Movies).'
)
  and approval_status is distinct from 'pending';
