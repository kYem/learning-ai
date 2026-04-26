# Learning-AI

Kes's AI engineering knowledge garden — career-transition notes, role learning paths, concept deep-dives, and weekly design-trend scans. Published as a static site with [Quartz](https://quartz.jzhao.xyz).

## Layout

This is a canonical Quartz 4 project. All knowledge lives under `content/`; everything else is the static-site generator.

```
.
├── content/                    The knowledge base (rendered to the site)
│   ├── index.md                Site homepage — weekend roadmap dashboard
│   ├── README.md               Hub overview (folder map, where to start)
│   ├── ROADMAP.md
│   ├── concepts/               Building-block notes
│   ├── projects/               Hands-on project writeups
│   ├── templates/              Note templates (ignored by Quartz)
│   ├── roles/                  Three target-role learning paths
│   ├── reference/              Cheatsheets, curated resources, design guide
│   └── design-trends/          Automated weekly scans
│
├── quartz/                     Quartz source (the SSG)
├── quartz.config.ts            Site config (title, ignorePatterns, theme, plugins)
├── quartz.layout.ts            Layout config
├── package.json                npm run serve / npm run build
└── public/                     Build output (gitignored)
```

## Build & preview

```sh
npm install            # first time
npm run serve          # local preview, hot-reload on save
npm run build          # static output to ./public
```

## Where to start reading

Open `content/index.md` for the current weekend roadmap, or jump directly into `content/roles/<role>/learning-path.md` for one of the three target roles. `content/reference/learning-ladder.md` lays out the full conceptual progression from Python basics to production AI platforms.
