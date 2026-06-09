import { createMovieFromForm } from "@/app/actions/movies";
import { MovieForm } from "@/components/movie-form";
import { MovieJsonImport } from "@/components/movie-json-import";
import { NavLinkButton } from "@/components/nav-link-button";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function NewMoviePage() {
  const ready = isSupabaseConfigured();
  const { user } = await getSessionUserWithProfile();

  return (
    <div className="mx-auto max-w-3xl space-y-8 px-4 py-10 sm:px-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Add to collection
          </p>
          <h1 className="app-page-title mt-2 text-2xl font-bold tracking-tight sm:text-3xl">
            New movie
          </h1>
        </div>
        <NavLinkButton
          href="/"
          variant="link"
          className="app-nav-link px-0 py-0 text-sm"
        >
          ← Back to browse
        </NavLinkButton>
      </div>

      {!ready && <SetupCallout />}

      {ready && !user && (
        <div className="app-panel px-6 py-8 text-center text-sm text-[var(--md-text-muted)]">
          <p className="mb-4">
            Sign in to submit a new title. Every submission is queued for admin
            approval before it appears in the public catalogue.
          </p>
          <NavLinkButton href="/login?next=/movies/new" className="px-5 py-2.5">
            Sign in to continue
          </NavLinkButton>
        </div>
      )}

      {ready && user && (
        <div className="space-y-8">
          <p className="mdc-moderation-pending rounded-2xl px-4 py-3 text-sm">
            New titles stay <span className="font-semibold">pending</span> until
            an admin approves them. They won&apos;t show on the home page or to
            other members until then — you can open yours from{" "}
            <NavLinkButton
              href="/my-movies"
              variant="link"
              className="inline-flex px-0 py-0 font-semibold"
            >
              My movies
            </NavLinkButton>{" "}
            or the link after you save.
          </p>
          <MovieJsonImport />
          <MovieForm action={createMovieFromForm} />
        </div>
      )}
    </div>
  );
}
