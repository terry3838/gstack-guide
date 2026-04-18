# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `1211b6b40bec`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: 설치/설정, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: 설치/설정, 테스트/검증.

## 최근 upstream 커밋

- `1211b6b community wave: 6 PRs + hardening (v0.18.1.0) (#1028)`
- `b3eaffc feat: context rot defense for /ship — subagent isolation + clean step numbering (v0.18.1.0) (#1030)`

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
- `.gitignore`
- `CHANGELOG.md`
- `CLAUDE.md`
- `TODOS.md`
- `VERSION`
- `browse/src/cookie-import-browser.ts`
- `browse/src/cookie-picker-routes.ts`
- `browse/src/server.ts`
- `browse/src/write-commands.ts`
- `browse/test/cookie-picker-routes.test.ts`
- `browse/test/watchdog.test.ts`
- `design-consultation/SKILL.md`
- `design-consultation/SKILL.md.tmpl`
- `design-html/SKILL.md`
- `design-review/SKILL.md`
- `design-review/SKILL.md.tmpl`
- `design-shotgun/SKILL.md`
- `design-shotgun/SKILL.md.tmpl`
- `hosts/opencode.ts`
