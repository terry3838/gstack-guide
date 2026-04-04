# Upstream Snapshot — gstack

- source repo: `https://github.com/garrytan/gstack.git`
- previous synced commit: `6169273d16b7ab8690943241fa802e5a1ca85305`
- current synced commit: `be96ff5ce771f67d4502ea4b2fbbcba53654cdcf`
- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조
- guide repo: `gstack-guide`

## 원본 한줄 요약

> "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## recent upstream commits

- `be96ff5 feat: /plan-devex-review + /devex-review — DX review skills (v0.15.3.0) (#784)`
- `103a1b3 docs: Slate agent integration research + design doc (#782)`
- `c620de3 fix: setup runs pending migrations so git pull + ./setup works (#774)`
- `846269e feat: voice-friendly skill triggers for AquaVoice (v0.14.6.0) (#732)`
- `4fc64f7 fix: top-level skill dirs so Claude discovers unprefixed names (#761)`

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
- `CONTRIBUTING.md`

## changed files

- `CHANGELOG.md`
- `CLAUDE.md`
- `CONTRIBUTING.md`
- `README.md`
- `SKILL.md`
- `VERSION`
- `autoplan/SKILL.md`
- `autoplan/SKILL.md.tmpl`
- `benchmark/SKILL.md`
- `benchmark/SKILL.md.tmpl`
- `bin/gstack-relink`
- `browse/SKILL.md`
- `canary/SKILL.md`
- `checkpoint/SKILL.md`
- `codex/SKILL.md`
- `codex/SKILL.md.tmpl`
- `connect-chrome/SKILL.md`
- `connect-chrome/SKILL.md.tmpl`
- `cso/SKILL.md`
- `cso/SKILL.md.tmpl`

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

> Install gstack: run **`git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup`** then add a "gstack" section to CLAUDE.md that says to use the /browse skill from gstack for all web browsing, never use mcp\_\_claude-in-chrome\_\_\* tools, and lists the available skills: /office-hours, /plan-ceo-review, /plan-eng-review, /plan-design-review, /design-consultation, /design-shotgun, /design-html, /review, /ship, /land-and-deploy, /canary, /benchmark, /browse, /connect-chrome, /qa, /qa-only, /design-review, /setup-browser-cookies, /setup-deploy, /retro, /investigate, /document-release, /codex, /cso, /autoplan, /careful, /freeze, /guard, /unfreeze, /gstack-upgrade, /learn. Then ask the user if they also want to add gstack to the current project so teammates get it.

### Step 2: Add to your repo so teammates get it (optional)

> Add gstack to this project: run **`cp -Rf ~/.claude/skills/gstack .claude/skills/gstack && rm -rf .claude/skills/gstack/.git && cd .claude/skills/gstack && ./setup`** then add a "gstack" section to this project's CLAUDE.md that says to use the /browse skill from gstack for all web browsing, never use mcp\_\_claude-in-chrome\_\_\* tools, lists the available skills: /office-hours, /plan-ceo-review, /plan-eng-review, /plan-design-review, /design-consultation, /design-shotgun, /design-html, /review, /ship, /land-and-deploy, /canary, /benchmark, /browse, /connect-chrome, /qa, /qa-only, /design-review, /setup-browser-cookies, /setup-deploy, /retro, /investigate, /document-release, /codex, /cso, /autoplan, /careful, /freeze, /guard, /unfreeze, /gstack-upgrade, /learn, and tells Claude that if gstack skills aren't working, run `cd .claude/skills/gstack && ./setup` to build the binary and register skills.

Real files get committed to your repo (not a submodule), so `git clone` just works. Everything lives inside `.claude/`. Nothing touches your PATH or runs in the background.

> **Contributing or need full history?** The commands above use `--depth 1` for a fast install. If you plan to contribute or need full git history, do a full clone instead:
> ```bash
> git clone https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
> ```

### Codex, Gemini CLI, or Cursor

gstack works on any agent that supports the [SKILL.md standard](https://github.com/anthropics/claude-code). Skills live in `.agents/skills/` and are discovered automatically.

Install to one repo:

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git .agents/skills/gstack
cd .agents/skills/gstack && ./setup --host codex
```

When setup runs from `.agents/skills/gstack`, it installs the generated Codex skills next to it in the same repo and does not write to `~/.codex/skills`.

Install once for your user account:

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack && ./setup --host codex
```

`setup --host codex` creates the runtime root at `~/.codex/skills/gstack` and
links the generated Codex skills at the top level. This avoids duplicate skill
discovery from the source repo checkout.

Or let setup auto-detect which agents you have installed:

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack && ./setup --host auto
```

For Codex-compatible hosts, setup now supports both repo-local installs from `.agents/skills/gstack` and user-global installs from `~/.codex/skills/gstack`. All 31 skills work across all supported agents. Hook-based safety skills (careful, freeze, guard) use inline safety advisory prose on non-Claude hosts.

### Factory Droid

gstack works with [Factory Droid](https://factory.ai). Skills install to `.factory/skills/` and are discovered automatically. Sensitive skills (ship, land-and-deploy, guard) use `disable-model-invocation: true` so Droids don't auto-invoke them.

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack && ./setup --host factory
```

Skills install to `~/.factory/skills/gstack-*/`. Restart `droid` to rescan skills, then type `/qa` to get started.

### Voice input (AquaVoice, Whisper, etc.)

gstack skills have voice-friendly trigger phrases. Say what you want naturally —
"run a security check", "test the website", "do an engineering review" — and the
right skill activates. You don't need to remember slash command names or acronyms.

## See it work

```
You:    I want to build a daily briefing app for my calendar.
You:    /office-hours
Claude: [asks about the pain — specific examples, not hypotheticals]

You:    Multiple Google calendars, events with stale info, wrong locations.
        Prep takes forever and the results aren't good enough...
```
