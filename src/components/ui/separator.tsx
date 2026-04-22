"use client";

import * as Separator from "@radix-ui/react-separator";

export function UiSeparator({
  className = "",
  orientation = "horizontal",
  ...props
}: React.ComponentProps<typeof Separator.Root>) {
  return (
    <Separator.Root
      orientation={orientation}
      className={`shrink-0 bg-gray-200 data-[orientation=horizontal]:h-px data-[orientation=vertical]:h-full data-[orientation=horizontal]:w-full data-[orientation=vertical]:w-px ${className}`.trim()}
      {...props}
    />
  );
}
