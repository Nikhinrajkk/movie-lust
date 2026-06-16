import { NavLinkButton } from "@/components/nav-link-button";
import {
  addHrefForKind,
  type CatalogueKind,
} from "@/lib/catalogue-kind";

export function CatalogueAddButton({ kind }: { kind: CatalogueKind }) {
  return (
    <NavLinkButton
      href={addHrefForKind(kind)}
      variant="link"
      className="shrink-0 px-0 py-0 text-sm"
    >
      + Add
    </NavLinkButton>
  );
}
