/** Compare two query strings ignoring key order (and duplicate-key ordering). */
export function searchQueryStringsEqual(a: string, b: string): boolean {
  const pa = new URLSearchParams(a);
  const pb = new URLSearchParams(b);
  const keys = new Set([...pa.keys(), ...pb.keys()]);
  for (const k of keys) {
    const as = [...pa.getAll(k)].sort().join("\0");
    const bs = [...pb.getAll(k)].sort().join("\0");
    if (as !== bs) return false;
  }
  return true;
}
