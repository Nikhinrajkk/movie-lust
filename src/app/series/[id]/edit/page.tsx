import { notFound, redirect } from "next/navigation";
import { getSeriesById, updateSeriesFromForm } from "@/app/actions/series";
import { NavLinkButton } from "@/components/nav-link-button";
import { SeriesForm } from "@/components/series-form";
import { SetupCallout } from "@/components/setup-callout";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { isSupabaseConfigured } from "@/lib/config";

export default async function EditSeriesPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const ready = isSupabaseConfigured();
  const { user, isAdmin } = await getSessionUserWithProfile();
  const series = ready ? await getSeriesById(id) : null;

  if (ready && !series) notFound();

  const owner = Boolean(user && series?.created_by === user.id);
  const status = series?.approval_status ?? "approved";
  const canEdit = isAdmin || (owner && status === "pending");

  if (ready && series && !canEdit) {
    redirect(`/series/${id}`);
  }

  return (
    <div className="mx-auto max-w-3xl space-y-8 px-4 py-10 sm:px-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
            Edit listing
          </p>
          <h1 className="app-page-title mt-2 text-3xl font-bold tracking-tight">
            {series?.title ?? "Series"}
          </h1>
        </div>
        <NavLinkButton
          href={series ? `/series/${series.id}` : "/series"}
          variant="link"
          className="app-nav-link px-0 py-0 text-sm"
        >
          ← Cancel
        </NavLinkButton>
      </div>

      {!ready && <SetupCallout />}
      {ready && series && (
        <SeriesForm action={updateSeriesFromForm} series={series} />
      )}
    </div>
  );
}
