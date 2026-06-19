"use client";

import { useRouter } from "next/navigation";
import { useTransition } from "react";
import { deleteSeriesFormAction } from "@/app/actions/series";
import {
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

export function DeleteSeriesForm({ id }: { id: string }) {
  const router = useRouter();
  const [pending, start] = useTransition();

  const onRemove = () => {
    start(async () => {
      const formData = new FormData();
      formData.set("id", id);
      await deleteSeriesFormAction(formData);
      router.refresh();
    });
  };

  return (
    <AlertDialogRoot>
      <AlertDialogTrigger asChild>
        <button
          type="button"
          disabled={pending}
          className="mdc-admin-action mdc-admin-action--row mdc-admin-action--danger py-3 sm:gap-3 sm:px-4"
        >
          <span className="flex items-center gap-2.5">
            <IconTrash className="size-4 shrink-0" />
            Remove series
          </span>
        </button>
      </AlertDialogTrigger>
      <AlertDialogPortal
        title="Remove this series?"
        description="This hides the listing from the library. The record is kept in the database."
        actionSlot={
          <Button type="button" variant="destructive" disabled={pending} onClick={onRemove}>
            {pending ? "Removing…" : "Remove"}
          </Button>
        }
      />
    </AlertDialogRoot>
  );
}
