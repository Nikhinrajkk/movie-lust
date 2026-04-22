import { Suspense } from "react";
import { LoginForm } from "@/components/login-form";
import { NavLinkButton } from "@/components/nav-link-button";
import { isSupabaseConfigured } from "@/lib/config";
import { SetupCallout } from "@/components/setup-callout";

function LoginFormFallback() {
  return (
    <div className="h-40 animate-pulse rounded-xl bg-gray-200" aria-hidden />
  );
}

export default function LoginPage() {
  const ready = isSupabaseConfigured();

  return (
    <div className="mx-auto max-w-md space-y-8 px-4 py-16 sm:px-6">
      <div className="space-y-2 text-center">
        <p className="text-xs font-semibold uppercase tracking-widest text-[var(--bms-red)]">
          Account
        </p>
        <h1 className="text-3xl font-bold tracking-tight text-gray-900">
          Sign in
        </h1>
        <p className="text-sm text-gray-600">
          We&apos;ll email you a one-time link — no password to remember.
        </p>
      </div>

      {!ready && <SetupCallout />}
      {ready && (
        <div className="rounded-2xl border border-zinc-800 bg-zinc-900/40 p-6">
          <Suspense fallback={<LoginFormFallback />}>
            <LoginForm />
          </Suspense>
        </div>
      )}

      <p className="text-center text-sm text-gray-600">
        <NavLinkButton
          href="/"
          variant="link"
          className="inline-flex px-0 py-0"
        >
          ← Back to browse
        </NavLinkButton>
      </p>
    </div>
  );
}
