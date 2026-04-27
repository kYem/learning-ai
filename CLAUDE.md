# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal AI-engineering knowledge garden (Kes's career-transition notes), published as a static site with **Quartz 4**. The repository is a fork of `jackyzha0/quartz` — the SSG source under `quartz/` is upstream code, while the actual knowledge content lives entirely under `content/`.

In day-to-day work the task is almost always **authoring or restructuring notes in `content/`**, not modifying Quartz itself. Treat `quartz/` as a vendored dependency unless explicitly asked to touch it.

## Common commands

```sh
npm install              # first-time setup
npm start                # build + serve on http://localhost:4444 with hot-reload
npm run build            # static build to ./public
npm run check            # tsc --noEmit && prettier --check
npm run format           # prettier --write
npm run test             # tsx --test (runs Node's built-in test runner)
```

Run a single test file: `npx tsx --test quartz/util/path.test.ts`.

Note: the GitHub Actions workflows under `.github/workflows/` are all gated with `if: github.repository == 'jackyzha0/quartz'`, so CI does **not** run on this fork. Verification is local-only — run `npm run check` and `npm start` before claiming work is complete.

## Content structure (the part you'll actually edit)

```
content/
├── index.md                     site homepage (weekend roadmap dashboard)
├── README.md                    hub overview
├── concepts/                    building-block notes (kv-cache, tokenization, …)
├── projects/                    hands-on project writeups
├── roles/<role>/learning-path.md   three target-role learning paths
├── reference/                   cheatsheets, curated resources, learning-ladder
├── templates/                   note templates (NOT rendered — see ignorePatterns)
└── design-trends/               automated weekly scans (gitignored, see below)
```

Authoring conventions:
- **Obsidian-flavored markdown is enabled.** Use wikilinks like `[[concepts/kv-cache]]` for internal links — the `CrawlLinks` plugin resolves them with `markdownLinkResolution: "shortest"`.
- New concept notes should follow `content/templates/concept-note.md`; new project writeups follow `content/templates/project-note.md`.
- Frontmatter dates are preferred; `CreatedModifiedDate` falls back to git, then filesystem (`priority: ["frontmatter", "git", "filesystem"]`).
- A note with `draft: true` in frontmatter is removed by the `RemoveDrafts` filter and won't render.

## What is NOT rendered

`quartz.config.ts` sets `ignorePatterns: ["private", "templates", ".obsidian", "**/.DS_Store"]`. So `content/templates/` and any `private/` content is excluded from the site. Don't link to those paths from rendered pages — the links will 404.

`.gitignore` excludes `public/` (build output), `.quartz-cache/`, `node_modules/`, and `design-trends/`. The `design-trends/` directory exists locally but is intentionally not committed (it's produced by an automated weekly scan).

## Quartz configuration touchpoints

If you do need to change the site itself, the two files that matter are:
- `quartz.config.ts` — site metadata, theme colors, ignore patterns, and the plugin pipeline (transformers → filters → emitters).
- `quartz.layout.ts` — which components render in the header / left sidebar / right sidebar / footer for content pages vs. list pages.

The plugin pipeline order in `quartz.config.ts` matters: transformers mutate the AST in sequence, filters drop pages, emitters produce output files. `Plugin.CustomOgImages()` is intentionally disabled (commented out) because it requires external font fetching.

## Code style (when editing TS/TSX in `quartz/`)

- Prettier: `printWidth: 100`, no semicolons, trailing commas, 2-space tabs (`.prettierrc`).
- TypeScript is strict with `noUnusedLocals` and `noUnusedParameters` — `npm run check` will fail on dead variables.
- JSX uses Preact (`"jsxImportSource": "preact"`), not React. Import from `preact` / `preact/hooks`, never `react`.
- ESM only (`"type": "module"`). Internal imports need explicit `.js` extensions even for `.ts` source files.
- Node ≥ 22 is required (`engines` field and `.node-version`).
