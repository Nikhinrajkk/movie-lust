"use client";

import * as Slot from "@radix-ui/react-slot";
import { forwardRef } from "react";

const variants = {
  primary:
    "rounded-xl bg-[var(--bms-red)] px-4 py-2.5 text-sm font-bold text-white shadow-md shadow-[var(--bms-red)]/25 outline-none transition hover:bg-[var(--bms-red-hover)] focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/50 disabled:pointer-events-none disabled:opacity-50",
  primaryLg:
    "rounded-xl bg-[var(--bms-red)] px-4 py-3 text-sm font-bold text-white shadow-md shadow-[var(--bms-red)]/25 outline-none transition hover:bg-[var(--bms-red-hover)] focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/50 disabled:pointer-events-none disabled:opacity-60",
  secondary:
    "rounded-xl border border-gray-300 bg-white px-4 py-2 text-sm font-semibold text-gray-800 outline-none transition hover:border-gray-400 hover:bg-gray-50 focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/30 disabled:pointer-events-none disabled:opacity-40",
  outline:
    "rounded-xl border border-gray-300 bg-white px-3 py-2.5 text-sm font-medium text-gray-800 outline-none transition hover:border-gray-400 hover:bg-gray-50 focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/30 disabled:pointer-events-none disabled:opacity-50",
  destructive:
    "rounded-xl border border-red-200 bg-red-50 px-4 py-2 text-sm font-semibold text-red-700 outline-none transition hover:bg-red-100 focus-visible:ring-2 focus-visible:ring-red-400/40 disabled:pointer-events-none disabled:opacity-50",
  success:
    "rounded-xl bg-emerald-600 px-4 py-2 text-xs font-bold text-white outline-none transition hover:bg-emerald-500 focus-visible:ring-2 focus-visible:ring-emerald-400/50 disabled:pointer-events-none disabled:opacity-50",
  ghost:
    "rounded-lg px-3 py-2 text-sm font-medium text-gray-700 outline-none transition hover:bg-gray-100 focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/25 disabled:pointer-events-none disabled:opacity-50",
  link: "text-sm font-semibold text-[var(--bms-red)] underline-offset-4 outline-none hover:text-[var(--bms-red-hover)] hover:underline focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/40",
  watchlist:
    "pointer-events-auto z-10 inline-flex h-9 min-w-9 items-center justify-center rounded-lg border border-[var(--bms-red)]/45 bg-black/55 text-xs font-bold text-white shadow-lg outline-none backdrop-blur-sm transition hover:bg-black/65 focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/45 disabled:pointer-events-none disabled:opacity-50",
  watchlistOn:
    "pointer-events-auto z-10 inline-flex h-9 min-w-9 items-center justify-center rounded-lg border border-emerald-500/55 bg-emerald-600/25 text-xs font-bold text-white shadow-lg outline-none backdrop-blur-sm transition hover:bg-emerald-600/35 focus-visible:ring-2 focus-visible:ring-emerald-500/45 disabled:pointer-events-none disabled:opacity-50",
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
