import { NavLinkButton } from "@/components/nav-link-button";
import { UiSeparator } from "@/components/ui/separator";

export function SetupCallout() {
  return (
    <div className="rounded-2xl border border-amber-500/30 bg-amber-500/10 p-6 text-amber-100">
      <h2 className="text-lg font-semibold text-amber-50">
        Connect Supabase to see movies
      </h2>
      <UiSeparator className="my-4 bg-amber-500/20" />
      <p className="max-w-2xl text-sm leading-relaxed text-amber-100/85">
        Copy{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-amber-200/90">
          .env.local.example
        </code>{" "}
        to{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-amber-200/90">
          .env.local
        </code>
        , add your project URL and anon key, then run the SQL in{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-amber-200/90">
          supabase/migrations/0001_init.sql
        </code>{" "}
        in the Supabase SQL editor.
      </p>
      <NavLinkButton
        href="https://supabase.com/dashboard"
        variant="link"
        target="_blank"
        rel="noreferrer"
        className="mt-4 inline-flex px-0 py-0 text-amber-300 hover:text-amber-200"
      >
        Open Supabase dashboard →
      </NavLinkButton>
    </div>
  );
}
