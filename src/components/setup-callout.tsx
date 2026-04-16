import { NavLinkButton } from "@/components/nav-link-button";
import { UiSeparator } from "@/components/ui/separator";

export function SetupCallout() {
  return (
    <div className="rounded-2xl border border-cyan-500/30 bg-cyan-500/10 p-6 text-cyan-100">
      <h2 className="text-lg font-semibold text-cyan-50">
        Connect Supabase to see movies
      </h2>
      <UiSeparator className="my-4 bg-cyan-500/20" />
      <p className="max-w-2xl text-sm leading-relaxed text-cyan-100/85">
        Copy{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-cyan-200/90">
          .env.local.example
        </code>{" "}
        to{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-cyan-200/90">
          .env.local
        </code>
        , add your project URL and anon key, then run the SQL in{" "}
        <code className="rounded bg-zinc-900/80 px-1.5 py-0.5 text-cyan-200/90">
          supabase/migrations/0001_init.sql
        </code>{" "}
        in the Supabase SQL editor.
      </p>
      <NavLinkButton
        href="https://supabase.com/dashboard"
        variant="link"
        target="_blank"
        rel="noreferrer"
        className="mt-4 inline-flex px-0 py-0 text-cyan-300 hover:text-cyan-200"
      >
        Open Supabase dashboard →
      </NavLinkButton>
    </div>
  );
}
