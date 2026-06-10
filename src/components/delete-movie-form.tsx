"use client";

import { deleteMovieFormAction } from "@/app/actions/movies";
import {
  AlertDialogAction,
  AlertDialogRoot,
  AlertDialogTrigger,
  AlertDialogPortal,
} from "@/components/ui/alert-dialog";
import { Button } from "@/components/ui/button";

function IconTrash({ className }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
      <title>Remove</title>
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
    </svg>
  );
}

export function DeleteMovieForm({ id }: { id: string }) {
  const formId = `delete-movie-${id}`;

  return (
    <>
      <form id={formId} action={deleteMovieFormAction} className="hidden">
        <input type="hidden" name="id" value={id} />
      </form>
      <AlertDialogRoot>
        <AlertDialogTrigger asChild>
          <button
            type="button"
            className="flex w-full items-center justify-between gap-2.5 rounded-xl border border-[var(--md-danger-border)] bg-[var(--md-danger-bg)] px-3 py-3 text-left text-sm font-medium text-[var(--md-danger)] transition hover:border-[var(--md-danger)] sm:gap-3 sm:px-4"
          >
            <span className="flex items-center gap-2.5">
              <IconTrash className="size-4 shrink-0" />
              Remove movie
            </span>
          </button>
        </AlertDialogTrigger>
        <AlertDialogPortal
          title="Remove this movie?"
          description="This removes the listing from the library. You can add it again later if needed."
          actionSlot={
            <AlertDialogAction asChild>
              <Button type="submit" variant="destructive" form={formId}>
                Remove
              </Button>
            </AlertDialogAction>
          }
        />
      </AlertDialogRoot>
    </>
  );
}
