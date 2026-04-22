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
    <header className="sticky top-0 z-40 border-b border-white/10 bg-[var(--bms-red)] shadow-md shadow-black/10">
      <div className="mx-auto flex h-14 max-w-7xl items-center gap-4 px-4 sm:h-16 sm:px-6">
        <Link href="/" className="group flex shrink-0 items-center gap-2 sm:gap-3">
          <span className="text-lg font-extrabold tracking-tight text-white sm:text-xl">
            MovieLust
          </span>
          <span className="hidden rounded border border-white/35 px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider text-white/95 sm:inline">
            Kochi
          </span>
          <span className="hidden text-[11px] font-medium text-white/75 lg:inline">
            Movies
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
