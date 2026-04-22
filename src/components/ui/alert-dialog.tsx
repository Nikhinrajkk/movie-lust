"use client";

import * as AlertDialog from "@radix-ui/react-alert-dialog";
import { Button } from "@/components/ui/button";

export const AlertDialogRoot = AlertDialog.Root;
export const AlertDialogTrigger = AlertDialog.Trigger;
export const AlertDialogAction = AlertDialog.Action;
export const AlertDialogCancel = AlertDialog.Cancel;

export function AlertDialogPortal({
  title,
  description,
  cancelLabel = "Cancel",
  actionSlot,
}: {
  title: string;
  description: string;
  cancelLabel?: string;
  actionSlot: React.ReactNode;
}) {
  return (
    <AlertDialog.Portal>
      <AlertDialog.Overlay className="fixed inset-0 z-[200] bg-black/70" />
      <AlertDialog.Content className="fixed left-1/2 top-1/2 z-[201] w-[min(calc(100vw-2rem),24rem)] -translate-x-1/2 -translate-y-1/2 rounded-2xl border border-gray-200 bg-white p-6 shadow-2xl outline-none">
        <AlertDialog.Title className="text-lg font-semibold text-gray-900">
          {title}
        </AlertDialog.Title>
        <AlertDialog.Description className="mt-2 text-sm leading-relaxed text-gray-600">
          {description}
        </AlertDialog.Description>
        <div className="mt-6 flex flex-wrap justify-end gap-2">
          <AlertDialog.Cancel asChild>
            <Button type="button" variant="outline">
              {cancelLabel}
            </Button>
          </AlertDialog.Cancel>
          {actionSlot}
        </div>
      </AlertDialog.Content>
    </AlertDialog.Portal>
  );
}
