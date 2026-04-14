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

3. **Database**

   In the Supabase SQL editor, run migrations in order:
   - `supabase/migrations/0001_init.sql` — schema, RLS, and starter seed rows.
   - If you already had an older DB without `director`, run `0003_add_director_column.sql`.
   - `0004_seed_imdb_chart.sql` — optional bulk seed of IMDb-style chart titles (skips existing titles).
   - `0002_interstellar.sql` is only needed if you use an old `0001` without Interstellar in the seed.

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

For production hosting (e.g. Vercel), set the same `NEXT_PUBLIC_SUPABASE_*` variables in the host’s environment settings.

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
