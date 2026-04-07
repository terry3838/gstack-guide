# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `47b3ee2ced50`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

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
- `CLAUDE.md`
- `CONTRIBUTING.md`
- `README.md`
- `SKILL.md`
- `VERSION`
- `autoplan/SKILL.md`
- `benchmark/SKILL.md`
- `bin/gstack-learnings-search`
- `bin/gstack-session-update`
- `bin/gstack-settings-hook`
- `bin/gstack-team-init`
- `bin/gstack-telemetry-sync`
- `bin/gstack-uninstall`
- `browse/PLAN-snapshot-dropdown-interactive.md`
- `browse/SKILL.md`
- `browse/src/activity.ts`
- `browse/src/browser-manager.ts`
- `browse/src/cdp-inspector.ts`
- `browse/src/cli.ts`
