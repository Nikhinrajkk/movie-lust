"use client";

import * as Avatar from "@radix-ui/react-avatar";
import * as DropdownMenu from "@radix-ui/react-dropdown-menu";
import Link from "next/link";
import { signOut } from "@/app/actions/auth";
import { Button } from "@/components/ui/button";

function initialsFrom(displayLabel: string, email: string | null | undefined) {
  const base = displayLabel.trim() || email?.split("@")[0]?.trim() || "?";
  const parts = base.split(/\s+/).filter(Boolean);
  if (parts.length >= 2) {
    const a = parts[0][0];
    const b = parts[parts.length - 1][0];
    if (a && b) return (a + b).toUpperCase();
  }
  return base.slice(0, 2).toUpperCase() || "?";
}

const itemClass =
  "flex cursor-pointer select-none items-center rounded-lg px-2 py-2 text-sm text-gray-800 outline-none data-[highlighted]:bg-gray-100 data-[disabled]:pointer-events-none data-[disabled]:opacity-50";

const linkItemClass = `${itemClass} no-underline hover:text-[var(--bms-red)]`;

export function HeaderUserMenu({
  displayLabel,
  email,
  isAdmin,
}: {
  displayLabel: string;
  email: string | null | undefined;
  isAdmin: boolean;
}) {
  const initials = initialsFrom(displayLabel, email);

  return (
    <DropdownMenu.Root>
      <DropdownMenu.Trigger asChild>
        <Button
          type="button"
          variant="ghost"
          className="h-auto rounded-full border-0 bg-transparent p-0 shadow-none hover:bg-transparent focus-visible:ring-2 focus-visible:ring-white/60"
          aria-label="Open account menu"
        >
          <Avatar.Root className="flex h-9 w-9 select-none items-center justify-center overflow-hidden rounded-full border-2 border-white/90 bg-white shadow-md transition hover:ring-2 hover:ring-white/50">
            <Avatar.Fallback
              delayMs={40}
              className="flex h-full w-full items-center justify-center bg-white text-[11px] font-bold tracking-tight text-[var(--bms-red)]"
            >
              {initials}
            </Avatar.Fallback>
          </Avatar.Root>
        </Button>
      </DropdownMenu.Trigger>

      <DropdownMenu.Portal>
        <DropdownMenu.Content
          className="z-50 min-w-[13.5rem] overflow-hidden rounded-xl border border-gray-200 bg-white p-1 shadow-xl"
          sideOffset={8}
          align="end"
          collisionPadding={12}
        >
          <div className="px-2 py-2">
            <p className="truncate text-sm font-semibold text-gray-900">
              {displayLabel.trim() || "Account"}
            </p>
            {email ? (
              <p className="mt-0.5 truncate text-xs text-gray-500">{email}</p>
            ) : null}
          </div>

          <DropdownMenu.Separator className="my-1 h-px bg-gray-200" />

          <DropdownMenu.Item asChild>
            <Link href="/watchlist" className={linkItemClass}>
              My list
            </Link>
          </DropdownMenu.Item>

          {isAdmin ? (
            <DropdownMenu.Item asChild>
              <Link href="/admin" className={linkItemClass}>
                Admin
              </Link>
            </DropdownMenu.Item>
          ) : null}

          <DropdownMenu.Separator className="my-1 h-px bg-gray-200" />

          <DropdownMenu.Item asChild>
            <form action={signOut} className="m-0 w-full">
              <Button
                type="submit"
                variant="ghost"
                className={`${itemClass} h-auto w-full justify-start rounded-lg border-0 bg-transparent px-2 py-2 text-left text-red-600 shadow-none hover:bg-red-50`}
              >
                Sign out
              </Button>
            </form>
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Portal>
    </DropdownMenu.Root>
  );
}
