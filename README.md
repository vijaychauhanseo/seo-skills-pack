# SEO Skills Pack

Portable Codex SEO skill and memory pack.

## Contents

- `skills/seo`
- `skills/seo-coral`
- `skills/ahrefs`
- `skills/programmatic-seo`
- `skills/dejan-ai-reverse-engineering`
- `memories/*.md`
- `snapshot.json`
- `scripts/install_to_codex.sh`

## Snapshot

- Captured: `2026-03-20`
- Skill directories: `5`
- Markdown notes inside `skills/seo`: `140`
- Markdown files inside `skills/dejan-ai-reverse-engineering`: `6`
- Durable memory notes: `7`

## Install Into Codex

```bash
./scripts/install_to_codex.sh
```

Default install target:

- `~/.codex`

Override the target:

```bash
CODEX_HOME=/path/to/codex-home ./scripts/install_to_codex.sh
```

## What This Gives You

- The full SEO router and memory library.
- The DEJAN reverse-engineering pack.
- Ahrefs and programmatic SEO helper skills.
- Durable dated SEO memory notes.

## Pairing With The Vector Repo

For retrieval on another laptop:

1. Install this repo into `~/.codex`.
2. Clone `seo-vector-snapshot`.
3. Query the DB in place or install it locally with `seo-vector-snapshot/scripts/install_snapshot.sh`.
