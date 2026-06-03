import Link from "next/link";
import { getSessionUserWithProfile } from "@/lib/auth/session";
import { HeaderNav } from "@/components/header-nav";
import Image from "next/image";

export async function Header() {
  const { user, profile, isAdmin } = await getSessionUserWithProfile();
  const displayLabel =
    profile?.display_name?.trim() ||
    user?.email?.split("@")[0] ||
    (user ? "Signed in" : "");

  return (
    <header className="sticky top-0 z-40 border-b border-white/10 bg-[var(--bms-red)] shadow-md shadow-[var(--bms-red)]/25">
      <div className="mx-auto flex h-14 min-w-0 max-w-7xl items-center gap-2 px-3 sm:h-16 sm:gap-4 sm:px-6">
        <Link href="/" className="group flex shrink-0 items-center gap-2 sm:gap-3">



          <Image
            src="/movie.png"
            alt="MovieLust"
            width={1024}
            height={682}
            className="h-8 w-auto max-w-[200px] object-contain object-left sm:h-9 sm:max-w-[240px]"
            priority
          />
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
