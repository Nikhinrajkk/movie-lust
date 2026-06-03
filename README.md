# MovieLust

MovieLust is a **Next.js** app for browsing, searching, filtering, and reviewing films. The UI takes cues from marquee-style listings (think showtimes grids) and critic-style scores (think aggregated ratings).

**Stack:** Next.js (App Router) · TypeScript · Tailwind CSS · Zustand · Supabase (Postgres) · GitHub Actions (CI)

## Prerequisites

- Node.js 20+
- A [Supabase](https://supabase.com/) project

## Setup

1. **Install dependencies**

   ```bash
   npm ci
   ```

2. **Environment**

   Copy `.env.local.example` to `.env.local`.

   **What you need from Supabase (free account + project):**

   | Item | Where in Supabase | Used as |
   |------|-------------------|---------|
   | **Project URL** | Dashboard → **Project Settings** → **API** → *Project URL* | `NEXT_PUBLIC_SUPABASE_URL` |
   | **anon public key** | Same page → *Project API keys* → **anon** **public** | `NEXT_PUBLIC_SUPABASE_ANON_KEY` |

   - Sign up at [supabase.com](https://supabase.com), create a **new project** (pick a region/password; wait until the DB is ready).
   - You do **not** need the **service_role** secret for MovieLust as shipped; that key bypasses Row Level Security and must stay server-only if you ever use it.
   - Personal / CLI tokens (e.g. for the Supabase CLI or dashboard automation) are **not** the same as the anon key—put only the **anon** JWT in `NEXT_PUBLIC_SUPABASE_ANON_KEY`.
   - **Sign in:** `/login` supports **Google OAuth** and **email magic links**. Return URLs use the **current site origin** (so Vercel is not redirected to localhost if env is wrong). In [Google Cloud Console](https://console.cloud.google.com/apis/credentials) create an **OAuth 2.0 Client ID** of type **Web application**; copy its **Client ID** and **Client secret**. In Supabase → **Authentication** → **Providers** → **Google**: enable the provider, paste the secret into **Client Secret (for OAuth)**, and put **at least one** OAuth client ID into **Authorized Client IDs** (for a web-only app, paste the same **Web client** ID you use for OAuth—comma-separate multiple IDs if you also use iOS/Android/One Tap, with the web ID first per [Supabase docs](https://supabase.com/docs/guides/auth/social-login/auth-google)). Under **Authentication → URL configuration**, set **Site URL** to your primary app URL and add **Redirect URLs** for every origin you use (e.g. `http://localhost:4000/auth/callback`, `https://your-app.vercel.app/auth/callback`). In Google Cloud, add authorized redirect URI `https://<project-ref>.supabase.co/auth/v1/callback`.
   - **Google `redirect_uri_mismatch` (400):** Google compares the request to **Authorized redirect URIs** on the **Web client** whose secret you pasted into Supabase. You must list **Supabase’s** callback there as the **full path**: `https://<same-host-as-NEXT_PUBLIC_SUPABASE_URL>/auth/v1/callback` (no trailing slash). **`https://…supabase.co` alone is wrong**—Google sends `…/auth/v1/callback`, and the entry must match exactly. That is **not** the same as your app URL (`…/auth/callback` on localhost)—that app URL belongs under Supabase → **Authentication** → **URL configuration** only. If the project ref in Google does not match your Supabase project URL exactly, Google will show this error.

3. **Database**

   In the Supabase SQL editor, run in order:
   - `supabase/migrations/0001_schema.sql` — DDL only: extensions, `movies`, `profiles`, `watchlist`, functions, triggers, RLS.
   - `supabase/migrations/0003_watched_movies.sql` — `watched_movies` table + RLS (mark-as-watched feature).
   - `supabase/migrations/0002_data.sql` — DML only: demo rows, IMDb chart seed, poster URL fixes, IMDb list catalogue inserts (all idempotent / safe to re-run where noted).
   - `supabase/migrations/0004_movie_moderation_gate.sql` — moderation gate: `approved_by`, default `pending` for new rows, insert RLS + trigger so new movies (UI or SQL) must be approved before they appear in browse. **Run after `0002_data.sql`** so seed data can still insert as `approved` before this gate exists.

   If you already applied the older numbered migrations on a project, do **not** re-run `0001_schema.sql` blindly; use a fresh database or merge changes manually.

4. **Run locally**

   ```bash
   npm run dev
   ```

   Open [http://localhost:4000](http://localhost:4000).

## Scripts

| Command          | Description |
| ---------------- | ------------------------ |
| `npm run dev`    | Development server       |
| `npm run build`  | Production build         |
| `npm run start`  | Start production server  |
| `npm run lint`   | ESLint                   |
| `npm run typecheck` | TypeScript (`tsc --noEmit`) |

## GitHub & CI/CD

**Remote:** [github.com/Nikhinrajkk/movie-lust](https://github.com/Nikhinrajkk/movie-lust)

This repo includes [GitHub Actions](.github/workflows/ci.yml) that run **lint**, **typecheck**, and **build** on pushes and pull requests to `main` / `master`.

For CI builds that need Supabase (optional but closer to production), add **repository secrets** in GitHub: **Settings → Secrets and variables → Actions → New repository secret** — use the same names as in `.env.local`: `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`. Never commit real keys into `ci.yml`.

If you cloned without a remote, add it and push:

```bash
git remote add origin https://github.com/Nikhinrajkk/movie-lust.git
git branch -M main
git push -u origin main
```

For production hosting (e.g. **Vercel**), set `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` in the host’s environment. In **Supabase → Authentication → URL configuration**, add each live origin’s callback (e.g. `https://your-app.vercel.app/auth/callback`) under **Redirect URLs**. Google sign-in and magic links use the **browser’s current origin** for the return URL, so you are not required to set `NEXT_PUBLIC_SITE_URL` for auth; if you set it in Vercel, avoid using `http://localhost:…` for Production (that used to break redirects when the app preferred env over the real host).

## Deploy on AWS (Amplify Hosting — free tier)

The simplest **AWS** path for this Next.js app is **[AWS Amplify Hosting](https://aws.amazon.com/amplify/hosting/)** (SSR / compute). New accounts often get **[AWS Free Tier](https://aws.amazon.com/free/)** allowances; check current [Amplify pricing](https://aws.amazon.com/amplify/pricing/) for build minutes and hosting limits.

1. Push this repo to GitHub (see above).
2. Open **[AWS Amplify Console](https://console.aws.amazon.com/amplify/)** → **Host web app** → connect **GitHub** → choose **movie-lust** (or your fork).
3. Amplify should detect **`amplify.yml`** at the repo root (`npm ci` → `npm run build`, artifact `.next`).
4. Under **App settings → Environment variables**, add:
   - `NEXT_PUBLIC_SUPABASE_URL` — your Supabase project URL  
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` — Supabase **anon** / **publishable** key  
5. Save and deploy. After green build, open the **Amplify domain** (you can add a custom domain later).

**Note:** Amplify’s documented Next.js support often trails the newest major version. If the build fails on **Next.js 16**, check the build log; you may need a newer Amplify build image or a supported Node version (**20** is set in `amplify.yml` / `.nvmrc`).

## Notes

- Poster images allow common CDNs (TMDB, Supabase storage, placeholders). Adjust `next.config.ts` if you use another host.
- Demo RLS policies are permissive. Lock this down (auth + scoped policies) before real users or sensitive data.

## Disclaimer

MovieLust is a demo project and is **not** affiliated with IMDb, BookMyShow, or their parent companies.
