"use client";

import * as Avatar from "@radix-ui/react-avatar";
import * as DropdownMenu from "@radix-ui/react-dropdown-menu";
import Link from "next/link";
import { signOut } from "@/app/actions/auth";
import { AppThemeIcon, useAppTheme } from "@/components/app-theme-toggle";
import { clearAllBrowserStorage } from "@/lib/clear-browser-storage";
import { resetSupabaseBrowserClient } from "@/lib/supabase/client";
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
  "app-menu-item flex cursor-pointer select-none items-center rounded-lg px-2 py-2 text-sm outline-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50";

const linkItemClass = `${itemClass} no-underline`;

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
  const { theme, toggle, label } = useAppTheme();

  return (
    <DropdownMenu.Root>
      <DropdownMenu.Trigger asChild>
        <Button
          type="button"
          variant="ghost"
          className="h-auto rounded-full border-0 bg-transparent p-0 shadow-none hover:bg-transparent focus-visible:ring-2 focus-visible:ring-white/60"
          aria-label="Open account menu"
        >
          <Avatar.Root className="flex h-9 w-9 select-none items-center justify-center overflow-hidden rounded-full border-2 border-[var(--md-gold)]/70 bg-[var(--app-surface-muted)] shadow-md transition hover:ring-2 hover:ring-[var(--md-gold)]/40">
            <Avatar.Fallback
              delayMs={40}
              className="flex h-full w-full items-center justify-center bg-[var(--app-surface-muted)] text-[11px] font-bold tracking-tight text-[var(--md-gold)]"
            >
              {initials}
            </Avatar.Fallback>
          </Avatar.Root>
        </Button>
      </DropdownMenu.Trigger>

      <DropdownMenu.Portal>
        <DropdownMenu.Content
          className="app-menu-content z-50 min-w-[15.5rem] overflow-hidden rounded-xl p-1 shadow-xl"
          sideOffset={8}
          align="end"
          collisionPadding={12}
        >
          <div className="px-2 py-2">
            <p className="truncate text-sm font-semibold text-[var(--md-title)]">
              {displayLabel.trim() || "Account"}
            </p>
            {email ? (
              <p className="mt-0.5 truncate text-xs text-[var(--md-text-muted)]">{email}</p>
            ) : null}
          </div>

          <DropdownMenu.Separator className="app-menu-separator my-1 h-px" />

          <DropdownMenu.Item asChild>
            <Link href="/watchlist" className={linkItemClass}>
              Watchlist
            </Link>
          </DropdownMenu.Item>
          <DropdownMenu.Item asChild>
            <Link href="/my-movies" className={linkItemClass}>
              My Movies
            </Link>
          </DropdownMenu.Item>

          {isAdmin ? (
            <DropdownMenu.Item asChild>
              <Link href="/admin" className={linkItemClass}>
                Admin
              </Link>
            </DropdownMenu.Item>
          ) : null}

          <DropdownMenu.Separator className="app-menu-separator my-1 h-px" />

          <DropdownMenu.Item
            className={itemClass}
            aria-label={label}
            onSelect={(event) => {
              event.preventDefault();
              toggle();
            }}
          >
            <span className="flex w-full items-center gap-2">
              <AppThemeIcon theme={theme} />
              {theme === "dark" ? "Light mode" : "Dark mode"}
            </span>
          </DropdownMenu.Item>

          <DropdownMenu.Separator className="app-menu-separator my-1 h-px" />

          <DropdownMenu.Item
            className={`${itemClass} app-menu-item-danger`}
            onSelect={() => {
              void (async () => {
                await clearAllBrowserStorage();
                resetSupabaseBrowserClient();
                await signOut();
              })();
            }}
          >
            Sign out
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Portal>
    </DropdownMenu.Root>
  );
}
