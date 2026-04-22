import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { Header } from "@/components/header";
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
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
    >
      <body className="flex min-h-screen flex-col bg-[var(--page-bg)] font-sans text-zinc-900 antialiased">
        <Header />
        <main className="flex-1">{children}</main>
        <footer className="border-t border-gray-200 bg-white py-8 text-center text-xs text-gray-500">
          MovieLust — a Next.js + Supabase demo. Explore UI inspired by
          listings sites; not affiliated with BookMyShow or IMDb.
        </footer>
      </body>
    </html>
  );
}
