"use client";

import * as Slot from "@radix-ui/react-slot";
import { forwardRef } from "react";

const variants = {
  primary:
    "rounded-xl bg-cyan-500 px-4 py-2.5 text-sm font-bold text-zinc-950 shadow-lg shadow-cyan-500/20 outline-none transition hover:bg-cyan-400 focus-visible:ring-2 focus-visible:ring-cyan-400/50 disabled:pointer-events-none disabled:opacity-50",
  primaryLg:
    "rounded-xl bg-cyan-500 px-4 py-3 text-sm font-bold text-zinc-950 shadow-lg shadow-cyan-500/20 outline-none transition hover:bg-cyan-400 focus-visible:ring-2 focus-visible:ring-cyan-400/50 disabled:pointer-events-none disabled:opacity-60",
  secondary:
    "rounded-xl border border-zinc-700 bg-zinc-900 px-4 py-2 text-sm font-medium text-zinc-200 outline-none transition hover:border-cyan-500/40 hover:text-cyan-100 focus-visible:ring-2 focus-visible:ring-cyan-500/30 disabled:pointer-events-none disabled:opacity-40",
  outline:
    "rounded-xl border border-zinc-600 px-3 py-2.5 text-sm font-medium text-zinc-300 outline-none transition hover:border-zinc-500 hover:text-white focus-visible:ring-2 focus-visible:ring-cyan-500/30 disabled:pointer-events-none disabled:opacity-50",
  destructive:
    "rounded-xl border border-red-500/40 bg-red-500/10 px-4 py-2 text-sm font-semibold text-red-200 outline-none transition hover:bg-red-500/20 focus-visible:ring-2 focus-visible:ring-red-500/30 disabled:pointer-events-none disabled:opacity-50",
  success:
    "rounded-xl bg-emerald-600 px-4 py-2 text-xs font-bold text-white outline-none transition hover:bg-emerald-500 focus-visible:ring-2 focus-visible:ring-emerald-400/50 disabled:pointer-events-none disabled:opacity-50",
  ghost:
    "rounded-lg px-3 py-2 text-sm font-medium text-zinc-300 outline-none transition hover:bg-zinc-800 hover:text-white focus-visible:ring-2 focus-visible:ring-cyan-500/30 disabled:pointer-events-none disabled:opacity-50",
  link: "text-sm font-medium text-cyan-300/90 underline-offset-4 outline-none hover:text-cyan-200 hover:underline focus-visible:ring-2 focus-visible:ring-cyan-400/40",
  watchlist:
    "pointer-events-auto z-10 inline-flex h-9 min-w-9 items-center justify-center rounded-lg border border-cyan-500/40 bg-zinc-950/85 text-xs font-bold text-cyan-300 shadow-lg outline-none transition hover:bg-cyan-500/15 focus-visible:ring-2 focus-visible:ring-cyan-400/40 disabled:pointer-events-none disabled:opacity-50",
  watchlistOn:
    "pointer-events-auto z-10 inline-flex h-9 min-w-9 items-center justify-center rounded-lg border border-emerald-500/50 bg-emerald-500/20 text-xs font-bold text-emerald-200 shadow-lg outline-none transition hover:bg-emerald-500/30 focus-visible:ring-2 focus-visible:ring-emerald-500/40 disabled:pointer-events-none disabled:opacity-50",
} as const;

export type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  asChild?: boolean;
  variant?: keyof typeof variants;
};

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      asChild,
      variant = "primary",
      className = "",
      type = "button",
      ...props
    },
    ref,
  ) => {
    const Comp = asChild ? Slot.Root : "button";
    return (
      <Comp
        ref={ref}
        type={asChild ? undefined : type}
        className={`${variants[variant]} ${className}`.trim()}
        {...props}
      />
    );
  },
);
Button.displayName = "Button";
