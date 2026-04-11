# Upstream Snapshot — gstack

- source repo: `https://github.com/garrytan/gstack.git`
- previous synced commit: `dbd7aee5b6b5bb41b17ae7747568e2fda8a91d77`
- current synced commit: `dbd7aee5b6b5bb41b17ae7747568e2fda8a91d77`
- sync mode: `no-change`
- impact labels: 일반 변경
- guide repo: `gstack-guide`

## 원본 한줄 요약

> "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## recent upstream commits

- `dbd7aee feat: relationship closing — office-hours adapts to repeat users (v0.16.2.0) (#937)`
- `a7593d7 fix: cookie picker auth token leak (v0.15.17.0) (#904)`
- `b73f364 feat: browser data platform for AI agents (v0.16.0.0) (#907)`
- `9d34baa fix: gstack-slug produces deterministic slugs across sessions (#897)`
- `1868636 refactor: extract TabSession for per-tab state isolation (v0.15.16.0) (#873)`
- `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)`
- `47b3ee2 fix: auto-symlink into ~/.claude/skills/ when cloned elsewhere (#865)`
- `8ca950f feat: content security — 4-layer prompt injection defense for pair-agent (#815)`

## top-level structure

- `.env.example`
- `actionlint.yaml`
- `agents/`
- `AGENTS.md`
- `ARCHITECTURE.md`
- `autoplan/`
- `benchmark/`
- `bin/`
- `browse/`
- `BROWSER.md`
- `bun.lock`
- `canary/`
- `careful/`
- `CHANGELOG.md`
- `checkpoint/`
- `CLAUDE.md`
- `codex/`
- `conductor.json`
- `connect-chrome/`
- `contrib/`

## changed files

- 변경 파일 없음

## README excerpt

```md
# gstack

> "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

When I heard Karpathy say this, I wanted to find out how. How does one person ship like a team of twenty? Peter Steinberger built [OpenClaw](https://github.com/openclaw/openclaw) — 247K GitHub stars — essentially solo with AI agents. The revolution is here. A single builder with the right tooling can move faster than a traditional team.

I'm [Garry Tan](https://x.com/garrytan), President & CEO of [Y Combinator](https://www.ycombinator.com/). I've worked with thousands of startups — Coinbase, Instacart, Rippling — when they were one or two people in a garage. Before YC, I was one of the first eng/PM/designers at Palantir, cofounded Posterous (sold to Twitter), and built Bookface, YC's internal social network.

**gstack is my answer.** I've been building products for twenty years, and right now I'm shipping more code than I ever have. In the last 60 days: **600,000+ lines of production code** (35% tests), **10,000-20,000 lines per day**, part-time, while running YC full-time. Here's my last `/retro` across 3 projects: **140,751 lines added, 362 commits, ~115k net LOC** in one week.

**2026 — 1,237 contributions and counting:**

![GitHub contributions 2026 — 1,237 contributions, massive acceleration in Jan-Mar](docs/images/github-2026.png)

**2013 — when I built Bookface at YC (772 contributions):**

![GitHub contributions 2013 — 772 contributions building Bookface at YC](docs/images/github-2013.png)

Same person. Different era. The difference is the tooling.

**gstack is how I do it.** It turns Claude Code into a virtual engineering team — a CEO who rethinks the product, an eng manager who locks architecture, a designer who catches AI slop, a reviewer who finds production bugs, a QA lead who opens a real browser, a security officer who runs OWASP + STRIDE audits, and a release engineer who ships the PR. Twenty-three specialists and eight power tools, all slash commands, all Markdown, all free, MIT license.

This is my open source software factory. I use it every day. I'm sharing it because these tools should be available to everyone.

Fork it. Improve it. Make it yours. And if you want to hate on free open source software — you're welcome to, but I'd rather you just try it first.

**Who this is for:**
- **Founders and CEOs** — especially technical ones who still want to ship
- **First-time Claude Code users** — structured roles instead of a blank prompt
- **Tech leads and staff engineers** — rigorous review, QA, and release automation on every PR

## Quick start

1. Install gstack (30 seconds — see below)
2. Run `/office-hours` — describe what you're building
3. Run `/plan-ceo-review` on any feature idea
4. Run `/review` on any branch with changes
5. Run `/qa` on your staging URL
6. Stop there. You'll know if this is for you.

## Install — 30 seconds

**Requirements:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Git](https://git-scm.com/), [Bun](https://bun.sh/) v1.0+, [Node.js](https://nodejs.org/) (Windows only)

### Step 1: Install on your machine

Open Claude Code and paste this. Claude does the rest.

> Install gstack: run **`git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup`** then add a "gstack" section to CLAUDE.md that says to use the /browse skill from gstack for all web browsing, never use mcp\_\_claude-in-chrome\_\_\* tools, and lists the available skills: /office-hours, /plan-ceo-review, /plan-eng-review, /plan-design-review, /design-consultation, /design-shotgun, /design-html, /review, /ship, /land-and-deploy, /canary, /benchmark, /browse, /connect-chrome, /qa, /qa-only, /design-review, /setup-browser-cookies, /setup-deploy, /retro, /investigate, /document-release, /codex, /cso, /autoplan, /plan-devex-review, /devex-review, /careful, /freeze, /guard, /unfreeze, /gstack-upgrade, /learn. Then ask the user if they also want to add gstack to the current project so teammates get it.

### Step 2: Team mode — auto-update for shared repos (recommended)

Every developer installs globally, updates happen automatically:

```bash
cd ~/.claude/skills/gstack && ./setup --team
```

Then bootstrap your repo so teammates get it:

```bash
cd <your-repo>
~/.claude/skills/gstack/bin/gstack-team-init required  # or: optional
git add .claude/ CLAUDE.md && git commit -m "require gstack for AI-assisted work"
```

No vendored files in your repo, no version drift, no manual upgrades. Every Claude Code session starts with a fast auto-update check (throttled to once/hour, network-failure-safe, completely silent).

> **Contributing or need full history?** The commands above use `--depth 1` for a fast install. If you plan to contribute or need full git history, do a full clone instead:
> ```bash
> git clone https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
> ```

### OpenClaw

OpenClaw spawns Claude Code sessions via ACP, so every gstack skill just works
when Claude Code has gstack installed. Paste this to your OpenClaw agent:

> Install gstack: run `git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup` to install gstack for Claude Code. Then add a "Coding Tasks" section to AGENTS.md that says: when spawning Claude Code sessions for coding work, tell the session to use gstack skills. Include these examples — security audit: "Load gstack. Run /cso", code review: "Load gstack. Run /review", QA test a URL: "Load gstack. Run /qa https://...", build a feature end-to-end: "Load gstack. Run /autoplan, implement the plan, then run /ship", plan before building: "Load gstack. Run /office-hours then /autoplan. Save the plan, don't implement."

**After setup, just talk to your OpenClaw agent naturally:**

| You say | What happens |
|---------|-------------|
| "Fix the typo in README" | Simple — Claude Code session, no gstack needed |
| "Run a security audit on this repo" | Spawns Claude Code with `Run /cso` |
| "Build me a notifications feature" | Spawns Claude Code with /autoplan → implement → /ship |
| "Help me plan the v2 API redesign" | Spawns Claude Code with /office-hours → /autoplan, saves plan |

See [docs/OPENCLAW.md](docs/OPENCLAW.md) for advanced dispatch routing and
the gstack-lite/gstack-full prompt templates.

### Native OpenClaw Skills (via ClawHub)

Four methodology skills that work directly in your OpenClaw agent, no Claude Code
session needed. Install from ClawHub:

```
clawhub install gstack-openclaw-office-hours gstack-openclaw-ceo-review gstack-openclaw-investigate gstack-openclaw-retro
```

| Skill | What it does |
|-------|-------------|
| `gstack-openclaw-office-hours` | Product interrogation with 6 forcing questions |
| `gstack-openclaw-ceo-review` | Strategic challenge with 4 scope modes |
| `gstack-openclaw-investigate` | Root cause debugging methodology |
| `gstack-openclaw-retro` | Weekly engineering retrospective |

These are conversational skills. Your OpenClaw agent runs them directly via chat.

### Other AI Agents

gstack works on 8 AI coding agents, not just Claude. Setup auto-detects which
agents you have installed:

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack && ./setup
```
```
