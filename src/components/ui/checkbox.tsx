"use client";

import * as Checkbox from "@radix-ui/react-checkbox";
import { useRef } from "react";

/**
 * Radix Checkbox for visuals; syncs a native checkbox for server-action FormData.
 */
export function FormCheckbox({
  id,
  name,
  defaultChecked,
  labelText,
}: {
  id: string;
  name: string;
  defaultChecked?: boolean;
  labelText: React.ReactNode;
}) {
  const nativeRef = useRef<HTMLInputElement>(null);

  return (
    <div className="flex items-stretch rounded-lg border border-zinc-800 bg-zinc-950/60 outline-none hover:border-cyan-500/30 has-[[data-state=checked]]:border-cyan-500/40 has-[[data-state=checked]]:bg-cyan-500/5">
      <label
        htmlFor={id}
        className="flex flex-1 cursor-pointer items-center gap-2 px-3 py-2 text-sm text-zinc-300"
      >
        <Checkbox.Root
          id={id}
          defaultChecked={defaultChecked}
          className="flex size-4 shrink-0 items-center justify-center rounded border border-zinc-600 bg-zinc-950 text-cyan-500 outline-none ring-cyan-500/0 focus-visible:ring-2 focus-visible:ring-cyan-400/40 data-[state=checked]:border-cyan-500 data-[state=checked]:bg-cyan-500/20"
          onCheckedChange={(v) => {
            if (nativeRef.current) nativeRef.current.checked = v === true;
          }}
        >
          <Checkbox.Indicator className="text-cyan-400">
            <svg
              className="size-3.5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={3}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M5 13l4 4L19 7"
              />
            </svg>
          </Checkbox.Indicator>
        </Checkbox.Root>
        <span className="select-none capitalize">{labelText}</span>
      </label>
      <input
        ref={nativeRef}
        type="checkbox"
        name={name}
        defaultChecked={defaultChecked}
        className="sr-only"
        tabIndex={-1}
        aria-hidden
      />
    </div>
  );
}
