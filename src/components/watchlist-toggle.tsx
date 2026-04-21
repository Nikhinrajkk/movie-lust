"use client";

import {
  useCallback,
  useEffect,
  useRef,
  useState,
  useTransition,
} from "react";
import { useRouter } from "next/navigation";
import { addToWatchlist, removeFromWatchlist } from "@/app/actions/watchlist";

type Props = {
  movieId: string;
  initialInList: boolean;
  disabled?: boolean;
  className?: string;
  /** xs = grid cards. sm/md = larger tap targets. */
  size?: "xs" | "sm" | "md";
};

function HeartGlyph({
  filled,
  className = "",
}: {
  filled: boolean;
  className?: string;
}) {
  return (
    <svg
      viewBox="0 0 24 24"
      className={className}
      aria-hidden
    >
      <path
        d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"
        className={
          filled
            ? "fill-rose-500"
            : "fill-transparent stroke-white stroke-[1.75]"
        }
      />
    </svg>
  );
}

export function WatchlistToggle({
  movieId,
  initialInList,
  disabled,
  className = "",
  size = "sm",
}: Props) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [liked, setLiked] = useState(initialInList);
  const [pop, setPop] = useState(false);
  const [ringToken, setRingToken] = useState(0);
  const initialRef = useRef(initialInList);

  useEffect(() => {
    initialRef.current = initialInList;
    // Reset local UI when server props update after router.refresh()
    // eslint-disable-next-line react-hooks/set-state-in-effect -- sync liked from refreshed watchlist
    setLiked(initialInList);
  }, [initialInList]);

  const dims =
    size === "md"
      ? "h-11 w-11 min-h-11 min-w-11"
      : size === "xs"
        ? "h-8 w-8 min-h-8 min-w-8"
        : "h-9 w-9 min-h-9 min-w-9";
  const iconSize =
    size === "md"
      ? "h-6 w-6"
      : size === "xs"
        ? "h-[18px] w-[18px]"
        : "h-[22px] w-[22px]";

  const triggerPop = useCallback(() => {
    setPop(true);
    window.setTimeout(() => setPop(false), 520);
  }, []);

  function onClick(e: React.MouseEvent) {
    e.preventDefault();
    e.stopPropagation();
    if (disabled || pending) return;

    const wasLiked = liked;
    const next = !liked;
    setLiked(next);
    if (!wasLiked && next) {
      setRingToken((t) => t + 1);
      triggerPop();
    } else if (wasLiked && !next) {
      triggerPop();
    }

    start(async () => {
      try {
        if (wasLiked) {
          await removeFromWatchlist(movieId);
        } else {
          await addToWatchlist(movieId);
        }
        router.refresh();
      } catch {
        setLiked(initialRef.current);
      }
    });
  }

  const label = liked ? "Remove from favourites" : "Add to favourites";

  return (
    <button
      type="button"
      title={label}
      aria-label={label}
      aria-pressed={liked}
      disabled={disabled || pending}
      onClick={onClick}
      className={`pointer-events-auto relative z-10 inline-flex ${dims} shrink-0 items-center justify-center rounded-full border border-white/15 bg-zinc-950/55 shadow-lg shadow-black/40 outline-none backdrop-blur-md transition-[transform,box-shadow] duration-150 hover:border-rose-400/35 hover:bg-zinc-950/70 hover:shadow-rose-500/10 focus-visible:ring-2 focus-visible:ring-rose-400/50 active:scale-90 disabled:pointer-events-none disabled:opacity-45 ${pop ? "round-media-pop" : ""} ${className}`.trim()}
    >
      {ringToken > 0 && liked && (
        <span
          key={ringToken}
          className="pointer-events-none absolute inset-0 flex items-center justify-center"
          aria-hidden
        >
          <span className="watchlist-heart-ring absolute h-full w-full rounded-full border-2 border-rose-400/80" />
        </span>
      )}
      <HeartGlyph filled={liked} className={`relative z-[1] ${iconSize}`} />
    </button>
  );
}
