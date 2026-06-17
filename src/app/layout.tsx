import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { Header } from "@/components/header";
import { APP_THEME_INIT_SCRIPT } from "@/lib/app-theme-init-script";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: {
    default: "MovieLust",
    template: "%s · MovieLust",
  },
  description:
    "Discover movies, write reviews, and curate your library — inspired by marquee listings and critic scores.",
  icons: {
    icon: "/movie.png",
    apple: "/movie.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      data-app-theme="dark"
      suppressHydrationWarning
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
    >
      <head>
        <script
          suppressHydrationWarning
          dangerouslySetInnerHTML={{ __html: APP_THEME_INIT_SCRIPT }}
        />
      </head>
      <body className="flex min-h-screen flex-col bg-[var(--page-bg)] font-sans text-[var(--foreground)] antialiased">
        <Header />
        <main className="min-w-0 flex-1 overflow-x-clip">{children}</main>
      </body>
    </html>
  );
}
