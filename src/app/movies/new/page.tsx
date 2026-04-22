import { createMovieFromForm } from "@/app/actions/movies";
import { MovieForm } from "@/components/movie-form";
import { MovieJsonImport } from "@/components/movie-json-import";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function NewMoviePage() {
  const ready = isSupabaseConfigured();
  const { user, isAdmin } = await getSessionUserWithProfile();

  return (
    <div className="mx-auto max-w-3xl space-y-8 px-4 py-10 sm:px-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Add to collection
          </p>
          <h1 className="mt-2 text-3xl font-bold tracking-tight text-gray-900">
            New movie
          </h1>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="px-0 py-0 text-sm text-gray-600 hover:text-[var(--bms-red)]"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {!ready && <SetupCallout />}

      {ready && !user && (
        <div className="rounded-2xl border border-gray-200 bg-white px-6 py-8 text-center text-sm text-gray-700 shadow-sm">
          <p className="mb-4">
            Sign in to submit a new title. Submissions from members are queued
            for admin approval before they appear in browse.
          </p>
          <NavLinkButton href="/login?next=/movies/new" className="px-5 py-2.5">
            Sign in to continue
          </NavLinkButton>
        </div>
      )}

      {ready && user && !isAdmin && (
        <p className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
          Your submission will be reviewed by an admin. Until it is approved,
          it won&apos;t appear on the home page — you&apos;ll still be able to
          open it from your confirmation link or history.
        </p>
      )}

      {ready && user && (
        <div className="space-y-8">
          <MovieJsonImport />
          <MovieForm action={createMovieFromForm} />
        </div>
      )}
    </div>
  );
}
