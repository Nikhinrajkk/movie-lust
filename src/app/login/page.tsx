import { Suspense } from "react";
import { LoginForm } from "@/components/login-form";
import { NavLinkButton } from "@/components/nav-link-button";
import { isSupabaseConfigured } from "@/lib/config";
import { SetupCallout } from "@/components/setup-callout";

function LoginFormFallback() {
  return (
    <div className="h-40 animate-pulse rounded-xl bg-[var(--app-surface-muted)]" aria-hidden />
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
        <h1 className="app-page-title text-3xl font-bold tracking-tight">
          Sign in
        </h1>
        <p className="app-page-sub text-sm">
          Continue with Google, or get a one-time link by email — no password
          to remember.
        </p>
      </div>

      {!ready && <SetupCallout />}
      {ready && (
        <div className="app-panel p-6">
          <Suspense fallback={<LoginFormFallback />}>
            <LoginForm />
          </Suspense>
        </div>
      )}

      <p className="text-center text-sm text-[var(--md-text-muted)]">
        <NavLinkButton
          href="/"
          variant="link"
          className="app-nav-link inline-flex px-0 py-0"
        >
          ← Back to browse
        </NavLinkButton>
      </p>
    </div>
  );
}
