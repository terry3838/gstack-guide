# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `c6e6a21d1a9a`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

- `c6e6a21 refactor: AI slop reduction with cross-model quality review (v0.16.3.0) (#941)`

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
- `VERSION`
- `bin/gstack-global-discover.ts`
- `browse/src/browser-manager.ts`
- `browse/src/cdp-inspector.ts`
- `browse/src/cli.ts`
- `browse/src/content-security.ts`
- `browse/src/error-handling.ts`
- `browse/src/meta-commands.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/sidebar-agent.ts`
- `browse/src/snapshot.ts`
- `browse/src/write-commands.ts`
- `browse/test/error-handling.test.ts`
- `docs/designs/SLOP_SCAN_FOR_REVIEW_SHIP.md`
- `extension/content.js`
- `extension/inspector.js`
- `package.json`
