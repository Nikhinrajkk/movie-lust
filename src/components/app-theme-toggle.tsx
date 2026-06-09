"use client";

import { useCallback, useSyncExternalStore } from "react";
import {
	APP_THEME_STORAGE_KEY,
	type AppTheme,
} from "@/lib/app-theme";

function subscribe(onStoreChange: () => void) {
	window.addEventListener("app-theme-change", onStoreChange);
	return () => window.removeEventListener("app-theme-change", onStoreChange);
}

function getSnapshot(): AppTheme {
	if (typeof document === "undefined") return "dark";
	const t = document.documentElement.getAttribute("data-app-theme");
	return t === "light" || t === "dark" ? t : "dark";
}

function getServerSnapshot(): AppTheme {
	return "dark";
}

function readStoredTheme(): AppTheme | null {
	try {
		const v = window.localStorage.getItem(APP_THEME_STORAGE_KEY);
		if (v === "light" || v === "dark") return v;
	} catch {
		/* ignore */
	}
	return null;
}

export function applyAppTheme(theme: AppTheme) {
	document.documentElement.setAttribute("data-app-theme", theme);
	try {
		window.localStorage.setItem(APP_THEME_STORAGE_KEY, theme);
	} catch {
		/* ignore */
	}
	window.dispatchEvent(new Event("app-theme-change"));
}

export function AppThemeToggle() {
	const theme = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot);

	const toggle = useCallback(() => {
		const next: AppTheme = theme === "dark" ? "light" : "dark";
		applyAppTheme(next);
	}, [theme]);

	const label =
		theme === "dark" ? "Switch to light theme" : "Switch to dark theme";

	return (
		<button
			type="button"
			onClick={toggle}
			title={label}
			aria-label={label}
			className="app-theme-toggle inline-flex items-center gap-1.5 rounded-full border px-2.5 py-1 text-xs font-semibold transition sm:gap-2 sm:px-3 sm:py-1.5"
		>
			{theme === "dark" ? (
				<>
					<svg
						className="size-3.5 sm:size-4"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						aria-hidden
					>
						<title>Sun</title>
						<path
							strokeLinecap="round"
							strokeLinejoin="round"
							strokeWidth={2}
							d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
						/>
					</svg>
					<span className="hidden min-[400px]:inline">Light</span>
				</>
			) : (
				<>
					<svg
						className="size-3.5 sm:size-4"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						aria-hidden
					>
						<title>Moon</title>
						<path
							strokeLinecap="round"
							strokeLinejoin="round"
							strokeWidth={2}
							d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
						/>
					</svg>
					<span className="hidden min-[400px]:inline">Dark</span>
				</>
			)}
		</button>
	);
}

/** Call once on the client after hydration if the inline script did not run. */
export function syncAppThemeFromStorage() {
	const stored = readStoredTheme();
	if (stored) applyAppTheme(stored);
}
