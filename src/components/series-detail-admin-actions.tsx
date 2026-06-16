"use client";

import { useRouter } from "next/navigation";
import { useTransition } from "react";
import {
	approveSeries,
	disapproveSeries,
	rejectSeries,
	returnRejectedSeriesToPending,
} from "@/app/actions/admin-movies";

function IconCheck({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Approve</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M5 13l4 4L19 7" />
		</svg>
	);
}

function IconX({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Reject</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M6 18L18 6M6 6l12 12" />
		</svg>
	);
}

function IconUndo({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Return to pending</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.25} d="M9 15 3 9m0 0 6-6M3 9h12a6 6 0 010 12h-3" />
		</svg>
	);
}

function IconEyeOff({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Dis-approve</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.25} d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
		</svg>
	);
}

function IconShield({ className }: { className?: string }) {
	return (
		<svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden>
			<title>Admin actions</title>
			<path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
		</svg>
	);
}

export function SeriesDetailAdminActions({
	seriesId,
	status,
}: {
	seriesId: string;
	status: "pending" | "approved" | "rejected";
}) {
	const router = useRouter();
	const [pending, start] = useTransition();

	const act = (fn: () => Promise<unknown>) => {
		start(async () => {
			await fn();
			router.refresh();
		});
	};

	return (
		<div className="flex flex-col gap-2 rounded-2xl border border-[var(--md-border)] bg-[var(--app-surface-muted)] p-3">
			<p className="flex items-center gap-1.5 pb-1 text-xs font-semibold uppercase tracking-widest text-[var(--md-gold)]">
				<IconShield className="size-3.5 shrink-0" />
				Admin actions
			</p>

			{status === "pending" && (
				<>
					<button
						type="button"
						disabled={pending}
						onClick={() => act(() => approveSeries(seriesId))}
						className="mdc-admin-action mdc-admin-action--row mdc-admin-action--success"
					>
						<IconCheck className="size-4 shrink-0" />
						Approve
					</button>
					<button
						type="button"
						disabled={pending}
						onClick={() => act(() => rejectSeries(seriesId))}
						className="mdc-admin-action mdc-admin-action--row mdc-admin-action--danger"
					>
						<IconX className="size-4 shrink-0" />
						Reject
					</button>
				</>
			)}

			{status === "approved" && (
				<button
					type="button"
					disabled={pending}
					onClick={() => act(() => disapproveSeries(seriesId))}
					className="mdc-admin-action mdc-admin-action--row mdc-admin-action--warning"
				>
					<IconEyeOff className="size-4 shrink-0" />
					Dis-approve (back to pending)
				</button>
			)}

			{status === "rejected" && (
				<button
					type="button"
					disabled={pending}
					onClick={() => act(() => returnRejectedSeriesToPending(seriesId))}
					className="mdc-admin-action mdc-admin-action--row mdc-admin-action--neutral"
				>
					<IconUndo className="size-4 shrink-0" />
					Return to pending
				</button>
			)}

			{pending && (
				<p className="text-center text-xs text-[var(--md-text-muted)]">Saving…</p>
			)}
		</div>
	);
}
