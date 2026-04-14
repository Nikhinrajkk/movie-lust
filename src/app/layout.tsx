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
      <body className="flex min-h-screen flex-col bg-zinc-950 font-sans text-zinc-100">
        <Header />
        <main className="flex-1">{children}</main>
        <footer className="border-t border-zinc-900 py-8 text-center text-xs text-zinc-600">
          MovieLust — a Next.js + Supabase demo. Not affiliated with IMDb or
          BookMyShow.
        </footer>
      </body>
    </html>
  );
}
