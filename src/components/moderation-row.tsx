"use client";

import { useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { approveMovie, rejectMovie } from "@/app/actions/admin-movies";
import type { MovieRow } from "@/types/movie";

export function ModerationRow({ movie }: { movie: MovieRow }) {
  const router = useRouter();
  const [pending, start] = useTransition();

  return (
    <div className="flex flex-col gap-4 rounded-2xl border border-zinc-800 bg-zinc-900/50 p-4 sm:flex-row sm:items-center sm:justify-between">
      <div className="min-w-0 space-y-1">
        <p className="truncate text-base font-semibold text-zinc-100">
          {movie.title}
        </p>
        <p className="text-xs text-zinc-500">
          {movie.release_year != null ? `${movie.release_year}` : "Year TBD"}
          {movie.director?.trim() ? ` · ${movie.director}` : ""}
        </p>
        <Link
          href={`/movies/${movie.id}`}
          className="inline-block text-xs font-medium text-amber-200/90 underline-offset-4 hover:underline"
        >
          Open detail
        </Link>
      </div>
      <div className="flex shrink-0 flex-wrap gap-2">
        <button
          type="button"
          disabled={pending}
          onClick={() =>
            start(async () => {
              await approveMovie(movie.id);
              router.refresh();
            })
          }
          className="rounded-xl bg-emerald-600 px-4 py-2 text-xs font-bold text-white transition hover:bg-emerald-500 disabled:opacity-50"
        >
          Approve
        </button>
        <button
          type="button"
          disabled={pending}
          onClick={() =>
            start(async () => {
              await rejectMovie(movie.id);
              router.refresh();
            })
          }
          className="rounded-xl border border-red-500/40 bg-red-500/10 px-4 py-2 text-xs font-bold text-red-200 transition hover:bg-red-500/20 disabled:opacity-50"
        >
          Reject
        </button>
      </div>
    </div>
  );
}
