# AGENTS.md

This file provides guidance to AI coding agents working in this repository.

## Project Overview

Personal website built with Astro (static site generation) and deployed to GitHub Pages at https://www.rkeelan.com.

## Commands

- `bun run dev` / `bun start` — local dev server (localhost:4321)
- `bun run build` — production build to `./dist/`
- `bun run preview` — preview production build locally

No test or lint commands are configured.

## Architecture

This is a minimal Astro static site. The key pieces:

- **`src/layouts/Layout.astro`** — single shared layout with JSON-LD structured data (Person schema), favicon links, and nav. Accepts `title` and `canonicalPath` props.
- **`src/pages/`** — Markdown content pages using Astro's file-based routing. Stories live under `src/pages/stories/`.
- **`public/css/styles.css`** — all styling lives in a single static CSS file (not processed by Astro).
- **`astro.config.mjs`** — configured for static output, `trailingSlash: "never"`, `build.format: "file"` (generates `.html` files, not directories).

## Deployment

Pushes to `main` trigger a GitHub Actions workflow (`.github/workflows/deploy.yml`) that builds and deploys to GitHub Pages using `withastro/action@v6` on Bun 1.4.3 (Node.js 22 is also installed).
