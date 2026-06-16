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
    <nav className="flex min-w-0 shrink-0 flex-wrap items-center justify-end gap-1.5 self-center sm:gap-2">
      {!user && <AppThemeToggle />}

      {isAdmin && (
        <Link
          href="/admin"
          className="inline-flex items-center gap-1.5 rounded-lg border border-[var(--md-border)] bg-transparent px-2.5 py-1.5 text-xs font-semibold text-[var(--md-text-muted)] transition hover:border-[var(--md-gold)] hover:text-[var(--md-gold)] sm:px-3"
        >
          <svg className="size-3.5 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>
          <span className="hidden sm:inline">Admin</span>
        </Link>
      )}

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
