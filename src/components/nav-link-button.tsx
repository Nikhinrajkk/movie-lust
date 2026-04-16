"use client";

import Link from "next/link";
import { Button, type ButtonProps } from "@/components/ui/button";

export type NavLinkButtonProps = Omit<ButtonProps, "asChild"> & {
  href: string;
  target?: React.ComponentProps<typeof Link>["target"];
  rel?: string;
};

export function NavLinkButton({
  href,
  target,
  rel,
  variant = "primary",
  className = "",
  children,
  ...props
}: NavLinkButtonProps) {
  return (
    <Button asChild variant={variant} className={className} {...props}>
      <Link href={href} target={target} rel={rel}>
        {children}
      </Link>
    </Button>
  );
}
