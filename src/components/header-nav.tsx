"use client";

import Link from "next/link";
import { AppThemeToggle } from "@/components/app-theme-toggle";
import { HeaderUserMenu } from "@/components/header-user-menu";

export function HeaderNav({
  user,
  displayLabel,
  email,
  isAdmin,
}: {
  user: { email?: string | null } | null;
  displayLabel: string;
  email: string | null | undefined;
  isAdmin: boolean;
}) {
  return (
    <nav className="flex min-w-0 shrink-0 flex-wrap items-center justify-end self-center sm:gap-2">
      {!user && <AppThemeToggle />}

      {user ? (
        <div className="flex shrink-0 items-center pl-1">
          <HeaderUserMenu
            displayLabel={displayLabel}
            email={email}
            isAdmin={isAdmin}
          />
        </div>
      ) : (
        <Link
          href="/login"
          className="inline-flex items-center rounded-lg border border-[var(--app-border)] bg-transparent px-3 py-2 text-xs font-semibold text-[var(--md-text-muted)] transition hover:bg-[var(--app-surface-muted)] hover:text-[var(--md-title)]"
        >
          Sign in
        </Link>
      )}
    </nav>
  );
}
