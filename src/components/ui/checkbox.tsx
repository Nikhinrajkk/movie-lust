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
    <div className="flex items-stretch rounded-lg border border-gray-200 bg-gray-50/80 outline-none hover:border-[var(--bms-red)]/35 has-[[data-state=checked]]:border-[var(--bms-red)]/50 has-[[data-state=checked]]:bg-[var(--bms-red)]/5">
      <label
        htmlFor={id}
        className="flex flex-1 cursor-pointer items-center gap-2 px-3 py-2 text-sm text-gray-700"
      >
        <Checkbox.Root
          id={id}
          defaultChecked={defaultChecked}
          className="flex size-4 shrink-0 items-center justify-center rounded border border-gray-400 bg-white text-[var(--bms-red)] outline-none focus-visible:ring-2 focus-visible:ring-[var(--bms-red)]/40 data-[state=checked]:border-[var(--bms-red)] data-[state=checked]:bg-[var(--bms-red)]/15"
          onCheckedChange={(v) => {
            if (nativeRef.current) nativeRef.current.checked = v === true;
          }}
        >
          <Checkbox.Indicator className="text-[var(--bms-red)]">
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
