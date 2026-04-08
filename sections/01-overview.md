# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `1868636f4902`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: CLI/명령어, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: CLI/명령어, 테스트/검증.

## 최근 upstream 커밋

- `1868636 refactor: extract TabSession for per-tab state isolation (v0.15.16.0) (#873)`
- `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)`

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

- `BROWSER.md`
- `CHANGELOG.md`
- `VERSION`
- `browse/src/browser-manager.ts`
- `browse/src/cli.ts`
- `browse/src/cookie-picker-routes.ts`
- `browse/src/meta-commands.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/snapshot.ts`
- `browse/src/tab-session.ts`
- `browse/src/write-commands.ts`
- `browse/test/batch.test.ts`
- `browse/test/commands.test.ts`
- `browse/test/compare-board.test.ts`
- `browse/test/handoff.test.ts`
- `browse/test/server-auth.test.ts`
- `browse/test/snapshot.test.ts`
- `test/skill-e2e-workflow.test.ts`
