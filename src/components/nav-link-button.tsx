"use client";

import Link from "next/link";
import { Button, type ButtonProps } from "@/components/ui/button";

export type NavLinkButtonProps = Omit<ButtonProps, "asChild"> & {
  href: string;
};

export function NavLinkButton({
  href,
  variant = "primary",
  className = "",
  children,
  ...props
}: NavLinkButtonProps) {
  return (
    <Button asChild variant={variant} className={className} {...props}>
      <Link href={href}>{children}</Link>
    </Button>
  );
}
