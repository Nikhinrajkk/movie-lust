"use client";

import type { ReactNode } from "react";

const HOLE_KEYS = ["h0", "h1", "h2", "h3", "h4"] as const;

/** Minimal flat reel: solid disk + light circles (matches classic projector-reel icon). */
function FlatFilmReelSvg() {
  const R = 44;
  const outerHoleR = 10;
  const centerHoleR = 5.2;
  const ringR = 22;

  const outerHoles = HOLE_KEYS.map((key, i) => {
    const a = (i * 2 * Math.PI) / HOLE_KEYS.length - Math.PI / 2;
    const cx = Math.cos(a) * ringR;
    const cy = Math.sin(a) * ringR;
    return (
      <circle key={key} cx={cx} cy={cy} r={outerHoleR} fill="#fafafa" />
    );
  });

  return (
    <svg
      width={96}
      height={96}
      viewBox="-48 -48 96 96"
      className="drop-shadow-[0_10px_28px_rgba(0,0,0,0.45)]"
      aria-hidden
    >
      <title>Film reel</title>
      <g className="cinema-reel-rotate">
        <circle r={R} fill="#1a1a1a" stroke="#404040" strokeWidth={1} />
        {outerHoles}
        <circle r={centerHoleR} fill="#fafafa" />
      </g>
    </svg>
  );
}

function CinemaLoaderIndicator() {
  return (
    <div role="status" aria-live="polite" className="inline-flex">
      <span className="sr-only">Loading movie results</span>
      <FlatFilmReelSvg />
    </div>
  );
}

/** Full-area overlay on top of `children` when `active` (base layer stays visible underneath). */
export function CinemaLoadingLayer({
  active,
  children,
}: {
  active: boolean;
  children: ReactNode;
}) {
  return (
    <div className="relative">
      {children}
      {active && (
        <>
          <div
            className="pointer-events-auto absolute inset-0 z-10 bg-white/55 backdrop-blur-[2px]"
            aria-hidden
          />
          <div className="pointer-events-none fixed left-1/2 top-[50vh] z-20 -translate-x-1/2 -translate-y-1/2">
            <CinemaLoaderIndicator />
          </div>
        </>
      )}
    </div>
  );
}
