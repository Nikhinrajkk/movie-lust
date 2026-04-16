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
    <nav className="flex min-w-0 flex-1 flex-wrap items-center justify-end gap-2 sm:gap-3">
      <Button
        asChild
        variant="ghost"
        className="text-zinc-300 hover:bg-zinc-800 hover:text-white"
      >
        <Link href="/">Browse</Link>
      </Button>
      <Button asChild variant="primary" className="px-3 py-2 text-sm font-semibold">
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
        <Button asChild variant="outline" className="px-3 py-2 text-xs">
          <Link href="/login">Sign in</Link>
        </Button>
      )}
    </nav>
  );
}
