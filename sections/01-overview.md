# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `04b709d91a3f`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

- `04b709d feat: declarative multi-host platform + OpenCode, Slate, Cursor, OpenClaw (v0.15.5.0) (#793)`
- `4478514 feat: interactive /plan-devex-review + plan mode skill fix (v0.15.5.0) (#796)`
- `3f080de feat: GStack Browser — double-click AI browser with anti-bot stealth (#695)`
- `cf73db5 feat: autoplan DX integration + README docs (v0.15.4.0) (#791)`

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

- `.gitignore`
- `CHANGELOG.md`
- `CLAUDE.md`
- `CONTRIBUTING.md`
- `README.md`
- `SKILL.md`
- `TODOS.md`
- `VERSION`
- `autoplan/SKILL.md`
- `autoplan/SKILL.md.tmpl`
- `benchmark/SKILL.md`
- `bin/gstack-platform-detect`
- `browse/SKILL.md`
- `browse/src/browser-manager.ts`
- `browse/src/cli.ts`
- `browse/src/cookie-picker-ui.ts`
- `browse/src/server.ts`
- `browse/src/sidebar-agent.ts`
- `browse/src/welcome.html`
- `browse/test/server-auth.test.ts`
