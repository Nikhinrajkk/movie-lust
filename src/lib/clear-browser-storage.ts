/**
 * Best-effort wipe of client-side storage used by the app / auth helpers.
 * Call from the browser before server sign-out so nothing stale survives the redirect.
 */
export function clearLocalAndSessionStorage(): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.clear();
  } catch {
    /* quota / private mode */
  }
  try {
    window.sessionStorage.clear();
  } catch {
    /* ignore */
  }
}

export async function clearIndexedDbBestEffort(): Promise<void> {
  if (typeof indexedDB === "undefined") return;
  if (typeof indexedDB.databases !== "function") return;

  try {
    const list = await indexedDB.databases();
    await Promise.all(
      (list ?? []).map(
        (meta) =>
          new Promise<void>((resolve) => {
            if (!meta.name) {
              resolve();
              return;
            }
            const req = indexedDB.deleteDatabase(meta.name);
            req.onsuccess = () => resolve();
            req.onerror = () => resolve();
            req.onblocked = () => resolve();
          }),
      ),
    );
  } catch {
    /* ignore */
  }
}

export async function clearAllBrowserStorage(): Promise<void> {
  clearLocalAndSessionStorage();
  await clearIndexedDbBestEffort();
}
