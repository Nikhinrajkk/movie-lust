"use client";

import { useTransition } from "react";
import { useRouter } from "next/navigation";
import { approveMovie, rejectMovie } from "@/app/actions/admin-movies";
import type { MovieRow } from "@/types/movie";
import { Button } from "@/components/ui/button";
import { NavLinkButton } from "@/components/nav-link-button";

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
        <NavLinkButton
          href={`/movies/${movie.id}`}
          variant="link"
          className="inline-flex px-0 py-0 text-xs"
        >
          Open detail
        </NavLinkButton>
      </div>
      <div className="flex shrink-0 flex-wrap gap-2">
        <Button
          type="button"
          variant="success"
          disabled={pending}
          onClick={() =>
            start(async () => {
              await approveMovie(movie.id);
              router.refresh();
            })
          }
        >
          Approve
        </Button>
        <Button
          type="button"
          variant="destructive"
          disabled={pending}
          onClick={() =>
            start(async () => {
              await rejectMovie(movie.id);
              router.refresh();
            })
          }
        >
          Reject
        </Button>
      </div>
    </div>
  );
}
