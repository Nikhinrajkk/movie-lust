"use client";

import { useTransition } from "react";
import { useRouter } from "next/navigation";
import { addToWatchlist, removeFromWatchlist } from "@/app/actions/watchlist";

type Props = {
  movieId: string;
  initialInList: boolean;
  disabled?: boolean;
  className?: string;
};

export function WatchlistToggle({
  movieId,
  initialInList,
  disabled,
  className = "",
}: Props) {
  const router = useRouter();
  const [pending, start] = useTransition();

  function onClick(e: React.MouseEvent) {
    e.preventDefault();
    e.stopPropagation();
    if (disabled || pending) return;
    start(async () => {
      try {
        if (initialInList) {
          await removeFromWatchlist(movieId);
        } else {
          await addToWatchlist(movieId);
        }
        router.refresh();
      } catch {
        /* surface via toast in a larger app; keep minimal here */
      }
    });
  }

  const label = initialInList ? "Remove from my list" : "Add to my list";
  const short = initialInList ? "\u2713" : "+";

  return (
    <button
      type="button"
      title={label}
      aria-label={label}
      disabled={disabled || pending}
      onClick={onClick}
      className={`pointer-events-auto z-10 inline-flex h-9 min-w-9 items-center justify-center rounded-lg border text-xs font-bold shadow-lg transition disabled:opacity-50 ${initialInList ? "border-emerald-500/50 bg-emerald-500/20 text-emerald-200 hover:bg-emerald-500/30" : "border-amber-500/40 bg-zinc-950/85 text-amber-300 hover:bg-amber-500/15"} ${className}`}
    >
      {pending ? "…" : short}
    </button>
  );
}
