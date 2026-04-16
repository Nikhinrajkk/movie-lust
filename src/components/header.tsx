import Link from "next/link";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { HeaderNav } from "@/components/header-nav";

export async function Header() {
  const { user, profile, isAdmin } = await getSessionUserWithProfile();
  const displayLabel =
    profile?.display_name?.trim() ||
    user?.email?.split("@")[0] ||
    (user ? "Signed in" : "");

  return (
    <header className="sticky top-0 z-40 border-b border-amber-500/15 bg-zinc-950/85 backdrop-blur-md">
      <div className="mx-auto flex h-16 max-w-7xl items-center gap-4 px-4 sm:px-6">
        <Link href="/" className="group flex shrink-0 items-baseline gap-2">
          <span className="text-xl font-bold tracking-tight text-amber-400 transition group-hover:text-amber-300">
            MovieLust
          </span>
          <span className="hidden text-xs font-medium uppercase tracking-widest text-zinc-500 sm:inline">
            Discover · Review · Curate
          </span>
        </Link>

        <HeaderNav
          user={user}
          displayLabel={displayLabel}
          email={user?.email}
          isAdmin={isAdmin}
        />
      </div>
    </header>
  );
}
