"use client";

import * as Select from "@radix-ui/react-select";

const triggerBase =
  "inline-flex h-10 w-full min-w-0 shrink-0 items-center justify-between gap-2 rounded-xl border border-zinc-700 bg-zinc-950 px-3 py-2 text-sm font-medium text-zinc-100 outline-none transition hover:border-zinc-600 focus:border-amber-500/50 focus:ring-2 focus:ring-amber-500/20 disabled:cursor-not-allowed disabled:opacity-50 data-[placeholder]:text-zinc-500";

const contentBase =
  "z-[100] max-h-[min(24rem,var(--radix-select-content-available-height))] overflow-hidden rounded-xl border border-zinc-700 bg-zinc-900 shadow-xl";

const viewportClass = "space-y-0.5 p-1";

const itemClass =
  "relative flex cursor-pointer select-none items-center rounded-lg px-2 py-2 text-sm text-zinc-200 outline-none data-[disabled]:pointer-events-none data-[disabled]:opacity-40 data-[highlighted]:bg-zinc-800 data-[highlighted]:text-zinc-50";

function ChevronDown() {
  return (
    <Select.Icon className="text-zinc-500">
      <svg className="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeWidth={2}
          d="M19 9l-7 7-7-7"
        />
      </svg>
    </Select.Icon>
  );
}

export function UiSelect({
  value,
  onValueChange,
  disabled,
  placeholder,
  children,
  id,
  triggerClassName = "",
  contentClassName = "",
  "aria-label": ariaLabel,
}: {
  value: string;
  onValueChange: (v: string) => void;
  disabled?: boolean;
  placeholder?: string;
  children: React.ReactNode;
  id?: string;
  triggerClassName?: string;
  contentClassName?: string;
  "aria-label"?: string;
}) {
  return (
    <Select.Root value={value} onValueChange={onValueChange} disabled={disabled}>
      <Select.Trigger
        id={id}
        className={`${triggerBase} ${triggerClassName}`.trim()}
        aria-label={ariaLabel}
      >
        <Select.Value placeholder={placeholder} />
        <ChevronDown />
      </Select.Trigger>
      <Select.Portal>
        <Select.Content
          position="popper"
          sideOffset={6}
          className={`${contentBase} ${contentClassName}`.trim()}
        >
          <Select.Viewport className={viewportClass}>{children}</Select.Viewport>
        </Select.Content>
      </Select.Portal>
    </Select.Root>
  );
}

export function UiSelectItem({
  value,
  children,
  className = "",
}: {
  value: string;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <Select.Item value={value} className={`${itemClass} ${className}`.trim()}>
      <Select.ItemText>{children}</Select.ItemText>
    </Select.Item>
  );
}

export function UiSelectGroupLabel({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <Select.Label
      className={`px-2 py-1.5 text-[10px] font-bold uppercase tracking-wider text-zinc-500 ${className}`.trim()}
    >
      {children}
    </Select.Label>
  );
}

export function UiSelectGroup({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return <Select.Group className={className}>{children}</Select.Group>;
}
