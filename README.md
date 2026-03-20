<p align="center">
  <img src="assets/hero-skills.svg" alt="SEO Skills Pack cover" width="100%" />
</p>

# SEO Skills Pack

Portable SEO operating system for Codex, Claude Code, and Agent Skills-compatible tools.

This is not a pile of prompts.

It is the instruction layer behind my local SEO squad: router memory, specialist skills, practitioner canon, DEJAN reverse-engineering workflows, and Claude-ready subagents that turn retrieved context into useful action.

If `seo-vector-snapshot` is the memory engine, this repo is the operating system wrapped around it.

## Why This Repo Feels Different

Most “AI SEO packs” are static.

This one is operational:

- it routes work to the right lens instead of relying on one generic prompt
- it carries practitioner-shaped memory, not just abstract tips
- it installs into real agent runtimes instead of living as copy-paste docs
- it pairs with a portable vector snapshot so the system can remember and act

## What You Get

- the full SEO router and memory library
- the DEJAN AI-search reverse-engineering pack
- Ahrefs and programmatic SEO helper skills
- durable dated memory notes and source-canon notes
- installers for Codex, Claude Code, and generic Agent Skills directories

## Platform Support

| Platform | Status | Install Path |
| --- | --- | --- |
| Codex | Ready | `~/.codex/skills` and `~/.codex/memories` |
| Claude Code / Claude CLI | Ready | `~/.claude/skills`, `~/.claude/agents`, `~/.claude/CLAUDE.md` |
| Agent Skills-compatible tools | Ready | any target skills directory |
| OpenClaw | Usable through mirrored files and indexing | import or sync workflow |

## Snapshot At A Glance

| Metric | Value |
| --- | ---: |
| Captured | `2026-03-20` |
| Skill directories | `5` |
| Markdown notes inside `skills/seo` | `140` |
| Markdown files inside `skills/dejan-ai-reverse-engineering` | `6` |
| Durable memory notes | `7` |

<p align="center">
  <img src="assets/pack-map.svg" alt="SEO skills pack architecture" width="100%" />
</p>

## Included In The Pack

| Path | Purpose |
| --- | --- |
| `skills/seo` | primary SEO router, memory layer, and operating docs |
| `skills/seo-coral` | specialist SEO role pack |
| `skills/dejan-ai-reverse-engineering` | AI-search, grounding, AI Mode, and citation analysis |
| `skills/ahrefs` | backlink and export-driven workflows |
| `skills/programmatic-seo` | scalable page-system and feasibility workflows |
| `memories/*.md` | durable dated notes from the live research system |

## Why This Repo Matters

Without a skill layer, a vector DB is just stored text.

This repo adds the missing parts:

- routing
- specialist instructions
- curated memory organization
- portable SEO context on a fresh machine

That means a second laptop does not just have files. It has working SEO judgment scaffolding.

## What Makes It Valuable

- turns raw retrieval into operator judgment
- gives Claude, Codex, and other agent runtimes a shared SEO instruction layer
- preserves expert lenses from DEJAN, Glenn Gabe, Marie Haynes, Patrick Stox, Cindy Krum, Lily Ray, Mike King, and others
- makes a fresh machine feel like it already knows your research environment

## Install Into Codex

```bash
git clone https://github.com/vijaychauhanseo/seo-skills-pack.git
cd seo-skills-pack
./scripts/install_to_codex.sh
```

Default install target:

- `~/.codex`

Override the target:

```bash
CODEX_HOME=/path/to/codex-home ./scripts/install_to_codex.sh
```

## Install Into Claude Code Or Claude CLI

```bash
git clone https://github.com/vijaychauhanseo/seo-skills-pack.git
cd seo-skills-pack
./scripts/install_to_claude.sh
```

This installs:

- user-level skills into `~/.claude/skills`
- SEO subagents into `~/.claude/agents`
- a user memory import into `~/.claude/CLAUDE.md`

After install, Claude can use:

- `/seo`
- `/seo-coral`
- `/ahrefs`
- `/programmatic-seo`
- `/dejan-ai-reverse-engineering`

And the installed subagents:

- `seo-researcher`
- `dejan-reverse-engineer`

## Install Into Any Agent Skills Directory

If another tool supports the Agent Skills open standard, copy the skills into its own skills directory:

```bash
./scripts/install_to_agent_skills_dir.sh /path/to/agent/skills
```

## Best Paired Setup

For full portability:

1. Install this repo into `~/.codex`
2. Clone [`seo-vector-snapshot`](https://github.com/vijaychauhanseo/seo-vector-snapshot)
3. Use the DB with the installed skills for query + routing

For Claude Code:

1. Install this repo with `./scripts/install_to_claude.sh`
2. Install [`seo-vector-snapshot`](https://github.com/vijaychauhanseo/seo-vector-snapshot) with its Claude installer or MCP installer
3. Use the vector query skills, the MCP server, or let Claude route work to the installed SEO subagents

Example:

```bash
SQUAD_MEMORY_SKILLS_ROOT=~/.codex/skills \
python3 ../seo-vector-snapshot/tools/squad_memory.py decide \
  "Need a practitioner for AI Mode, grounding, and GSC reporting" \
  --db ../seo-vector-snapshot/db/squad_memory.db
```

## Best Use Cases

- AI search reverse engineering
- AI Overviews and grounding diagnostics
- practitioner-informed SEO analysis
- programmatic SEO planning
- export-driven Ahrefs workflows
- multi-source SEO memory on a second machine

## Why It Is Public

I wanted these repos to show a more useful model for AI-assisted SEO work:

- memory that compounds
- skills that route
- expert context that survives the session
- a stack that moves across tools instead of being trapped in one interface

## Not Just Generic SEO Notes

This pack includes:

- practitioner canon from DEJAN, Glenn Gabe, Marie Haynes, Patrick Stox, Cindy Krum, Lily Ray, Brodie Clark, Mike King, and others
- durable notes built from live ingestion and manual curation
- role-pack structure so the system knows which lens to apply
- skill files that already match the Agent Skills open standard used by Claude Code

## Companion Repository

The retrieval snapshot that pairs with this pack lives here:

- [`seo-vector-snapshot`](https://github.com/vijaychauhanseo/seo-vector-snapshot)

Use this repo for skill execution and memory routing.
Use the vector snapshot for portable retrieval, MCP tool calling, and query resolution.

## Social Preview Asset

If you want a custom GitHub social preview card for this repo, use:

- `assets/social-preview.png`

## Claude Adapter Files

Claude-specific files live under:

- `adapters/claude-code/user-memory/`
- `adapters/claude-code/agents/`

## License

MIT. See [`LICENSE`](LICENSE).
