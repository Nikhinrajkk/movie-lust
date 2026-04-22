import { NavLinkButton } from "@/components/nav-link-button";
import { UiSeparator } from "@/components/ui/separator";

export function SetupCallout() {
  return (
    <div className="rounded-2xl border border-amber-200 bg-amber-50/90 p-6 text-amber-950">
      <h2 className="text-lg font-bold text-amber-950">
        Connect Supabase to see movies
      </h2>
      <UiSeparator className="my-4 bg-amber-200" />
      <p className="max-w-2xl text-sm leading-relaxed text-amber-900/90">
        Copy{" "}
        <code className="rounded border border-amber-200 bg-white px-1.5 py-0.5 text-amber-900">
          .env.local.example
        </code>{" "}
        to{" "}
        <code className="rounded border border-amber-200 bg-white px-1.5 py-0.5 text-amber-900">
          .env.local
        </code>
        , add your project URL and anon key, then run the SQL in{" "}
        <code className="rounded border border-amber-200 bg-white px-1.5 py-0.5 text-amber-900">
          supabase/migrations/0001_init.sql
        </code>{" "}
        in the Supabase SQL editor.
      </p>
      <NavLinkButton
        href="https://supabase.com/dashboard"
        variant="link"
        target="_blank"
        rel="noreferrer"
        className="mt-4 inline-flex px-0 py-0 font-semibold"
      >
        Open Supabase dashboard →
      </NavLinkButton>
    </div>
  );
}
