"use client";

import { useState } from "react";
import { useSearchParams } from "next/navigation";
import { getSupabaseBrowser } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";
import { FieldLabel } from "@/components/ui/label";

export function LoginForm() {
  const searchParams = useSearchParams();
  const next = searchParams.get("next") ?? "/";

  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">(
    "idle",
  );
  const [message, setMessage] = useState<string | null>(null);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setStatus("sending");
    setMessage(null);

    const site =
      process.env.NEXT_PUBLIC_SITE_URL ?? window.location.origin;

    try {
      const supabase = getSupabaseBrowser();
      const { error } = await supabase.auth.signInWithOtp({
        email: email.trim(),
        options: {
          emailRedirectTo: `${site}/auth/callback?next=${encodeURIComponent(next)}`,
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
          className="w-full rounded-xl border border-zinc-700 bg-zinc-900 px-4 py-3 text-zinc-100 outline-none ring-cyan-500/0 transition focus:border-cyan-500/50 focus:ring-2 focus:ring-cyan-500/30"
          placeholder="you@example.com"
        />
      </div>

      {message && (
        <p
          className={
            status === "error"
              ? "text-sm text-red-300"
              : "text-sm text-emerald-300"
          }
        >
          {message}
        </p>
      )}

      <Button
        type="submit"
        variant="primaryLg"
        className="w-full"
        disabled={status === "sending" || status === "sent"}
      >
        {status === "sending"
          ? "Sending link…"
          : status === "sent"
            ? "Link sent"
            : "Email me a magic link"}
      </Button>
    </form>
  );
}
