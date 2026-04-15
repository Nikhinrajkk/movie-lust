import Link from "next/link";
import { signOut } from "@/app/actions/auth";
import { getSessionUserWithProfile } from "@/lib/auth/session";

export async function Header() {
  const { user, profile, isAdmin } = await getSessionUserWithProfile();
  const label =
    profile?.display_name?.trim() ||
    user?.email?.split("@")[0] ||
    (user ? "Signed in" : null);

  return (
    <header className="sticky top-0 z-40 border-b border-amber-500/15 bg-zinc-950/85 backdrop-blur-md">
      <div className="mx-auto flex h-16 max-w-7xl items-center justify-between gap-4 px-4 sm:px-6">
        <Link href="/" className="group flex items-baseline gap-2">
          <span className="text-xl font-bold tracking-tight text-amber-400 transition group-hover:text-amber-300">
            MovieLust
          </span>
          <span className="hidden text-xs font-medium uppercase tracking-widest text-zinc-500 sm:inline">
            Discover · Review · Curate
          </span>
        </Link>
        <nav className="flex flex-wrap items-center justify-end gap-2 text-sm sm:gap-3">
          <Link
            href="/"
            className="rounded-lg px-3 py-2 text-zinc-300 transition hover:bg-zinc-800 hover:text-white"
          >
            Browse
          </Link>
          {user && (
            <Link
              href="/watchlist"
              className="rounded-lg px-3 py-2 text-zinc-300 transition hover:bg-zinc-800 hover:text-white"
            >
              My list
            </Link>
          )}
          {isAdmin && (
            <Link
              href="/admin"
              className="rounded-lg px-3 py-2 font-medium text-amber-200/90 transition hover:bg-zinc-800 hover:text-amber-100"
            >
              Admin
            </Link>
          )}
          <Link
            href="/movies/new"
            className="rounded-lg bg-amber-500 px-3 py-2 font-semibold text-zinc-950 shadow-lg shadow-amber-500/20 transition hover:bg-amber-400"
          >
            Add movie
          </Link>
          {user ? (
            <div className="flex items-center gap-2 pl-1">
              <span className="hidden max-w-[140px] truncate text-xs text-zinc-500 sm:inline">
                {label}
              </span>
              <form action={signOut}>
                <button
                  type="submit"
                  className="rounded-lg border border-zinc-700 px-3 py-2 text-xs font-medium text-zinc-200 transition hover:border-zinc-500 hover:text-white"
                >
                  Sign out
                </button>
              </form>
            </div>
          ) : (
            <Link
              href="/login"
              className="rounded-lg border border-zinc-700 px-3 py-2 text-xs font-medium text-zinc-200 transition hover:border-amber-500/40 hover:text-white"
            >
              Sign in
            </Link>
          )}
        </nav>
      </div>
    </header>
  );
}
