import Link from "next/link";

export function SetupCallout() {
  return (
    <div className="rounded-2xl border border-amber-500/30 bg-amber-500/10 p-6 text-amber-100">
      <h2 className="text-lg font-semibold text-amber-50">
        Connect Supabase to see movies
      </h2>
      <p className="mt-2 max-w-2xl text-sm leading-relaxed text-amber-100/85">
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
      <Link
        href="https://supabase.com/dashboard"
        className="mt-4 inline-flex text-sm font-medium text-amber-300 underline-offset-4 hover:underline"
        target="_blank"
        rel="noreferrer"
      >
        Open Supabase dashboard →
      </Link>
    </div>
  );
}
