"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const tabs = [
  {
    href: "/",
    label: "Movies",
    isActive: (pathname: string) =>
      pathname === "/" || pathname.startsWith("/movies"),
  },
  {
    href: "/series",
    label: "Series",
    isActive: (pathname: string) => pathname.startsWith("/series"),
  },
] as const;

export function HeaderCatalogueTabs() {
  const pathname = usePathname();

  return (
    <nav className="header-catalogue-tabs" aria-label="Catalogue">
      {tabs.map((tab) => {
        const active = tab.isActive(pathname);
        return (
          <Link
            key={tab.href}
            href={tab.href}
            className={`header-catalogue-tab ${active ? "header-catalogue-tab--active" : ""}`}
            aria-current={active ? "page" : undefined}
          >
            {tab.label}
          </Link>
        );
      })}
    </nav>
  );
}
