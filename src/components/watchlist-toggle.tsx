"use client";

import { useTransition } from "react";
import { useRouter } from "next/navigation";
import { addToWatchlist, removeFromWatchlist } from "@/app/actions/watchlist";
import { Button } from "@/components/ui/button";

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
    <Button
      type="button"
      title={label}
      aria-label={label}
      disabled={disabled || pending}
      variant={initialInList ? "watchlistOn" : "watchlist"}
      onClick={onClick}
      className={`pointer-events-auto min-w-9 px-3 ${className}`.trim()}
    >
      {pending ? "…" : short}
    </Button>
  );
}
