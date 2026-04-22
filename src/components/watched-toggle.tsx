"use client";

import {
  useCallback,
  useEffect,
  useRef,
  useState,
  useTransition,
} from "react";
import { useRouter } from "next/navigation";
import { markMovieWatched, unmarkMovieWatched } from "@/app/actions/watched";

type Props = {
  movieId: string;
  initialWatched: boolean;
  disabled?: boolean;
  className?: string;
  size?: "xs" | "sm" | "md";
};

function WatchedGlyph({
  watched,
  className = "",
}: {
  watched: boolean;
  className?: string;
}) {
  if (watched) {
    return (
      <svg viewBox="0 0 24 24" className={className} fill="none" aria-hidden>
        <circle cx="12" cy="12" r="10" fill="currentColor" opacity="0.22" />
        <path
          d="M8.2 12.3 10.8 15 15.8 9.5"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </svg>
    );
  }
  return (
    <svg
      viewBox="0 0 24 24"
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.75}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7-10-7-10-7z" />
      <circle cx="12" cy="12" r="3.25" />
    </svg>
  );
}

export function WatchedToggle({
  movieId,
  initialWatched,
  disabled,
  className = "",
  size = "sm",
}: Props) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [watched, setWatched] = useState(initialWatched);
  const [pop, setPop] = useState(false);
  const [ringToken, setRingToken] = useState(0);
  const initialRef = useRef(initialWatched);

  useEffect(() => {
    initialRef.current = initialWatched;
    // eslint-disable-next-line react-hooks/set-state-in-effect -- sync after router.refresh()
    setWatched(initialWatched);
  }, [initialWatched]);

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

    const was = watched;
    const next = !watched;
    setWatched(next);
    if (!was && next) {
      setRingToken((t) => t + 1);
      triggerPop();
    } else if (was && !next) {
      triggerPop();
    }

    start(async () => {
      try {
        if (was) {
          await unmarkMovieWatched(movieId);
        } else {
          await markMovieWatched(movieId);
        }
        router.refresh();
      } catch {
        setWatched(initialRef.current);
      }
    });
  }

  const label = watched ? "Mark as not watched" : "Mark as watched";

  return (
    <button
      type="button"
      title={label}
      aria-label={label}
      aria-pressed={watched}
      disabled={disabled || pending}
      onClick={onClick}
      className={`pointer-events-auto relative z-10 inline-flex ${dims} shrink-0 items-center justify-center rounded-full border border-white/20 bg-black/50 shadow-lg shadow-black/35 outline-none backdrop-blur-md transition-[transform,box-shadow,color] duration-150 hover:border-[var(--bms-red)]/45 hover:bg-black/60 hover:shadow-[var(--bms-red)]/10 focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/45 active:scale-90 disabled:pointer-events-none disabled:opacity-45 ${watched ? "text-[var(--bms-red)]" : "text-white"} ${pop ? "round-media-pop" : ""} ${className}`.trim()}
    >
      {ringToken > 0 && watched && (
        <span
          key={ringToken}
          className="pointer-events-none absolute inset-0 flex items-center justify-center"
          aria-hidden
        >
          <span className="watchlist-watched-ring absolute h-full w-full rounded-full border-2 border-[var(--bms-red)]/85" />
        </span>
      )}
      <WatchedGlyph watched={watched} className={`relative z-[1] ${iconSize}`} />
    </button>
  );
}
