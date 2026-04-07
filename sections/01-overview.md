# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `6cc094cd4190`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: 브라우저/pair-agent
- 판단: pair-agent 터널 안정성 버그 수정(v0.15.15.1)을 가이드에 반영했습니다. 핵심 영향 영역: 브라우저/pair-agent.

## 최근 upstream 커밋

- `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)`
- `47b3ee2 fix: auto-symlink into ~/.claude/skills/ when cloned elsewhere (#865)`
- `8ca950f feat: content security — 4-layer prompt injection defense for pair-agent (#815)`
- `03973c2 fix: community security wave — 8 PRs, 4 contributors (v0.15.13.0) (#847)`
- `b3d064a fix: gstack-team-init detects and removes vendored copies (#848)`
- `dae251e feat: team-friendly gstack install mode (v0.15.7.0) (#809)`
- `a94a64f fix: snapshot -i auto-detects dropdown/popover interactive elements (#845)`

## 확인한 원본 구조

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

## guide 업데이트 포인트

- README 관리 블록 갱신
- `UPSTREAM-SNAPSHOT.md` 갱신
- `SYNC-LOG.md` 갱신
- 개요 문서 재작성

## 변경 파일 샘플

- `CHANGELOG.md`
- `VERSION`
- `browse/src/cli.ts`
- `browse/src/server.ts`
- `browse/test/server-auth.test.ts`
