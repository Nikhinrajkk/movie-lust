"use client";

import { deleteMovieFormAction } from "@/app/actions/movies";
import {
  AlertDialogAction,
  AlertDialogRoot,
  AlertDialogTrigger,
  AlertDialogPortal,
} from "@/components/ui/alert-dialog";
import { Button } from "@/components/ui/button";

export function DeleteMovieForm({ id }: { id: string }) {
  const formId = `delete-movie-${id}`;

  return (
    <>
      <form id={formId} action={deleteMovieFormAction} className="hidden">
        <input type="hidden" name="id" value={id} />
      </form>
      <AlertDialogRoot>
        <AlertDialogTrigger asChild>
          <Button type="button" variant="destructive">
            Remove
          </Button>
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
