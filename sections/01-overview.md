# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `422f172fbbcb`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

- `422f172 feat: ship re-run executes all verification checks (v0.15.10.0) (#833)`
- `b3cd3fd feat: native OpenClaw skills + ClaHub publishing (v0.15.10.0) (#832)`
- `bd8d44d docs: rewrite README OpenClaw install — one paste, real instructions (#818)`
- `e2d005c feat: OpenClaw integration v2 — prompt is the bridge (v0.15.9.0) (#816)`
- `2b08cfe fix: close redundant PRs + friendly error on all design commands (v0.15.8.1) (#817)`
- `1652f22 fix(discover): parse Codex sessions with large session_meta (>4KB) (#798)`

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
- `README.md`
- `SKILL.md`
- `VERSION`
- `autoplan/SKILL.md`
- `benchmark/SKILL.md`
- `bin/gstack-global-discover`
- `bin/gstack-global-discover.ts`
- `bin/gstack-specialist-stats`
- `browse/SKILL.md`
- `browse/src/browser-manager.ts`
- `browse/src/config.ts`
- `browse/src/cookie-picker-routes.ts`
- `browse/src/server.ts`
- `browse/src/sidebar-agent.ts`
- `browse/src/url-validation.ts`
- `browse/src/write-commands.ts`
- `browse/test/server-auth.test.ts`
- `canary/SKILL.md`
