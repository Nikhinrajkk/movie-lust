"use client";

import Link from "next/link";
import { Button } from "@/components/ui/button";
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
    <nav className="flex min-w-0 flex-1 flex-wrap items-center justify-end gap-1.5 sm:gap-2">
      <Button
        asChild
        variant="ghost"
        className="text-white hover:bg-white/15 hover:text-white"
      >
        <Link href="/">Movies</Link>
      </Button>
      <Button
        asChild
        className="rounded-lg bg-white px-3 py-2 text-sm font-bold text-[var(--bms-red)] shadow-sm transition hover:bg-white/90"
      >
        <Link href="/movies/new">Add movie</Link>
      </Button>

      {user ? (
        <div className="flex shrink-0 items-center pl-1">
          <HeaderUserMenu
            displayLabel={displayLabel}
            email={email}
            isAdmin={isAdmin}
          />
        </div>
      ) : (
        <Button
          asChild
          variant="outline"
          className="border-white/80 bg-transparent px-3 py-2 text-xs font-semibold text-white hover:bg-white/10"
        >
          <Link href="/login">Sign in</Link>
        </Button>
      )}
    </nav>
  );
}
