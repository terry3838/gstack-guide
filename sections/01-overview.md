# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `8ee16b867ba7`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

- `8ee16b8 feat: mode-posture energy fix for /plan-ceo-review and /office-hours (v1.1.2.0) (#1065)`
- `e3c961d fix(ship): detect + repair VERSION/package.json drift in Step 12 (v1.1.1.0) (#1063)`
- `c15b805 feat(browse): Puppeteer parity — load-html, screenshot --selector, viewport --scale, file:// (v1.1.0.0) (#1062)`
- `4d2c8d9 fix: remove hardcoded author emails from throughput script`
- `0a803f9 feat: gstack v1 — simpler prompts + real LOC receipts (v1.0.0.0) (#1039)`
- `9ec4ab7 codex + Apple Silicon hardening wave (v0.18.4.0) (#1056)`

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
- `BROWSER.md`
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
- `bin/gstack-builder-profile`
- `bin/gstack-codex-probe`
- `bin/gstack-config`
- `bin/gstack-developer-profile`
- `bin/gstack-question-log`
- `bin/gstack-question-preference`
- `browse/SKILL.md`
