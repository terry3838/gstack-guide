# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `7e96fe299b08`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: 설치/설정, CLI/명령어, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: 설치/설정, CLI/명령어, 테스트/검증.

## 최근 upstream 커밋

- `7e96fe2 fix: security wave 3 — 12 fixes, 7 contributors (v0.16.4.0) (#988)`

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

- `.github/docker/Dockerfile.ci`
- `CHANGELOG.md`
- `VERSION`
- `bin/gstack-learnings-log`
- `bin/gstack-learnings-search`
- `bin/gstack-settings-hook`
- `bin/gstack-team-init`
- `browse/src/audit.ts`
- `browse/src/browser-manager.ts`
- `browse/src/config.ts`
- `browse/src/cookie-import-browser.ts`
- `browse/src/path-security.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/url-validation.ts`
- `browse/src/write-commands.ts`
- `browse/test/commands.test.ts`
- `design/src/session.ts`
- `setup`
