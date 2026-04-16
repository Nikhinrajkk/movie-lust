"use client";

import * as Label from "@radix-ui/react-label";
import { forwardRef } from "react";

export const FieldLabel = forwardRef<
  React.ElementRef<typeof Label.Root>,
  React.ComponentPropsWithoutRef<typeof Label.Root>
>(({ className = "", ...props }, ref) => (
  <Label.Root
    ref={ref}
    className={`text-xs font-medium text-zinc-400 ${className}`.trim()}
    {...props}
  />
));
FieldLabel.displayName = "FieldLabel";
