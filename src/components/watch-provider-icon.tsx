import Image from "next/image";
import type { SimpleIcon } from "simple-icons";
import {
  siAppletv,
  siCrunchyroll,
  siMax,
  siMubi,
  siNetflix,
  siParamountplus,
  siPrimevideo,
  siTubi,
  siYoutube,
} from "simple-icons";

/** Wikimedia Commons SVGs where this simple-icons release has no brand module. */
const EXTERNAL_SVG: Record<string, string> = {
  disneyplus:
    "https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg",
  hulu: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Hulu_logo_%282018%29.svg",
};

const SIMPLE_ICONS: Record<string, SimpleIcon> = {
  netflix: siNetflix,
  primevideo: siPrimevideo,
  appletv: siAppletv,
  max: siMax,
  paramountplus: siParamountplus,
  youtube: siYoutube,
  crunchyroll: siCrunchyroll,
  tubi: siTubi,
  mubi: siMubi,
};

export function WatchProviderIcon({
  slug,
  className,
  title,
}: {
  slug: string;
  className?: string;
  /** Accessibility label (defaults to provider name from slug). */
  title?: string;
}) {
  const key = slug.trim().toLowerCase();
  const ext = EXTERNAL_SVG[key];
  if (ext) {
    return (
      <Image
        src={ext}
        alt=""
        width={96}
        height={24}
        className={className}
        title={title}
        loading="lazy"
      />
    );
  }

  const icon = SIMPLE_ICONS[key];
  if (!icon) return null;

  return (
    <svg
      role="img"
      viewBox="0 0 24 24"
      className={className}
      aria-hidden={title ? undefined : true}
      aria-label={title}
    >
      <path d={icon.path} fill={`#${icon.hex}`} />
    </svg>
  );
}
