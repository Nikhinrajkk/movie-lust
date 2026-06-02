"use client";

import { useState } from "react";
import { useSearchParams } from "next/navigation";
import { getSupabaseBrowser } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";
import { FieldLabel } from "@/components/ui/label";

function humanizeGoogleOAuthError(raw: string): string | null {
  let text = raw;
  if (raw.trim().startsWith("{")) {
    try {
      const o = JSON.parse(raw) as { msg?: string; message?: string };
      text = o.msg ?? o.message ?? raw;
    } catch {
      /* use raw */
    }
  }
  const lower = text.toLowerCase();
  if (lower.includes("redirect_uri_mismatch")) {
    return (
      "Google rejected the redirect URL. In Google Cloud Console → Credentials → your Web OAuth client → Authorized redirect URIs, add exactly: " +
      "https://<your-supabase-project-ref>.supabase.co/auth/v1/callback " +
      "(use the same host as NEXT_PUBLIC_SUPABASE_URL, no trailing slash). " +
      "Do not put only your app’s localhost URL there—that goes in Supabase → Authentication → URL configuration."
    );
  }
  if (
    lower.includes("provider is not enabled") ||
    lower.includes("unsupported provider") ||
    (lower.includes("validation_failed") && lower.includes("provider"))
  ) {
    return (
      "Google sign-in is not enabled for this Supabase project. " +
      "In Supabase: Authentication → Providers → Google → enable, then add your Google OAuth Client ID and Client Secret. " +
      "In Google Cloud Console, add Authorized redirect URI: https://<your-project-ref>.supabase.co/auth/v1/callback " +
      "(use your real project ref from Project Settings → API). You can still use the email magic link below."
    );
  }
  return null;
}

/** OAuth + magic-link return base URL — always the tab you’re on (avoids Production using a baked-in localhost NEXT_PUBLIC_SITE_URL on Vercel). */
function authReturnOrigin(): string {
  return window.location.origin;
}

function GoogleIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 48 48"
      width={20}
      height={20}
      aria-hidden="true"
    >
      <path
        fill="#FFC107"
        d="M43.611 20.083H42V20H24v8h11.303c-1.649 4.657-6.08 8-11.303 8-6.627 0-12-5.373-12-12s5.373-12 12-12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4 12.955 4 4 12.955 4 24s8.955 20 20 20 20-8.955 20-20c0-1.341-.138-2.65-.389-3.917z"
      />
      <path
        fill="#FF3D00"
        d="m6.306 14.691 6.571 4.819C14.655 15.108 18.961 12 24 12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4 16.318 4 9.656 8.337 6.306 14.691z"
      />
      <path
        fill="#4CAF50"
        d="M24 44c5.166 0 9.86-1.977 13.409-5.192l-6.19-5.238A11.86 11.86 0 0 1 24 34c-5.2 0-9.619-3.317-11.283-7.946l-6.522 5.025C9.505 39.556 16.227 44 24 44z"
      />
      <path
        fill="#1976D2"
        d="M43.611 20.083H42V20H24v8h11.303a12.04 12.04 0 0 1-4.087 5.571l.003-.002 6.19 5.238C36.971 39.205 44 34 44 24c0-1.341-.138-2.65-.389-3.917z"
      />
    </svg>
  );
}

export function LoginForm() {
  const searchParams = useSearchParams();
  const next = searchParams.get("next") ?? "/";

  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">(
    "idle",
  );
  const [googleSending, setGoogleSending] = useState(false);
  const [message, setMessage] = useState<string | null>(null);

  async function signInWithGoogle() {
    setGoogleSending(true);
    setMessage(null);
    const redirectTo = `${authReturnOrigin()}/auth/callback?next=${encodeURIComponent(next)}`;

    try {
      const supabase = getSupabaseBrowser();
      const { data, error } = await supabase.auth.signInWithOAuth({
        provider: "google",
        options: { redirectTo },
      });
      if (error) {
        setGoogleSending(false);
        setStatus("error");
        setMessage(humanizeGoogleOAuthError(error.message) ?? error.message);
        return;
      }
      if (data.url) {
        window.location.assign(data.url);
        return;
      }
      setGoogleSending(false);
      setStatus("error");
      setMessage("Could not start Google sign-in.");
    } catch (err: unknown) {
      setGoogleSending(false);
      setStatus("error");
      const raw = err instanceof Error ? err.message : String(err);
      setMessage(humanizeGoogleOAuthError(raw) ?? raw);
    }
  }

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setStatus("sending");
    setMessage(null);

    try {
      const supabase = getSupabaseBrowser();
      const { error } = await supabase.auth.signInWithOtp({
        email: email.trim(),
        options: {
          emailRedirectTo: `${authReturnOrigin()}/auth/callback?next=${encodeURIComponent(next)}`,
        },
      });
      if (error) {
        setStatus("error");
        setMessage(error.message);
        return;
      }
      setStatus("sent");
      setMessage("Check your inbox for the sign-in link.");
    } catch (err: unknown) {
      setStatus("error");
      setMessage(err instanceof Error ? err.message : "Something went wrong");
    }
  }

  return (
    <div className="space-y-6">
      <div className="space-y-3">
        <Button
          type="button"
          variant="outline"
          className="flex w-full items-center justify-center gap-2.5 border-gray-300 py-3 text-sm font-semibold text-gray-800 shadow-sm"
          onClick={() => void signInWithGoogle()}
          disabled={googleSending || status === "sending"}
        >
          <GoogleIcon className="shrink-0" />
          {googleSending ? "Redirecting…" : "Continue with Google"}
        </Button>
      </div>

      <div className="relative">
        <div
          className="absolute inset-0 flex items-center"
          aria-hidden
        >
          <span className="w-full border-t border-gray-200" />
        </div>
        <div className="relative flex justify-center text-xs font-medium uppercase tracking-wide text-gray-500">
          <span className="bg-white px-2">Or use email</span>
        </div>
      </div>

      <form onSubmit={onSubmit} className="space-y-4">
      <div className="space-y-2">
        <FieldLabel htmlFor="email">Email</FieldLabel>
        <input
          id="email"
          name="email"
          type="email"
          autoComplete="email"
          required
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="w-full rounded-xl border border-gray-300 bg-white px-4 py-3 text-gray-900 outline-none transition focus:border-[var(--bms-red)] focus:ring-2 focus:ring-[var(--bms-red)]/20"
          placeholder="you@example.com"
        />
      </div>

      {message && (
        <p
          className={
            status === "error"
              ? "text-sm text-red-700"
              : "text-sm text-emerald-700"
          }
        >
          {message}
        </p>
      )}

      <Button
        type="submit"
        variant="primaryLg"
        className="w-full"
        disabled={status === "sending" || status === "sent" || googleSending}
      >
        {status === "sending"
          ? "Sending link…"
          : status === "sent"
            ? "Link sent"
            : "Email me a magic link"}
      </Button>
    </form>
    </div>
  );
}
