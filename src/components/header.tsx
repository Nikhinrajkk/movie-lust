import Link from "next/link";

export function Header() {
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
        <nav className="flex items-center gap-3 text-sm">
          <Link
            href="/"
            className="rounded-lg px-3 py-2 text-zinc-300 transition hover:bg-zinc-800 hover:text-white"
          >
            Browse
          </Link>
          <Link
            href="/movies/new"
            className="rounded-lg bg-amber-500 px-3 py-2 font-semibold text-zinc-950 shadow-lg shadow-amber-500/20 transition hover:bg-amber-400"
          >
            Add movie
          </Link>
        </nav>
      </div>
    </header>
  );
}
