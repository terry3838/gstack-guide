# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `822e843a60c6`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## 최근 upstream 커밋

- `822e843 fix: headed browser auto-shutdown + disconnect cleanup (v0.18.1.0) (#1025)`
- `cc42f14 docs: gstack compact design doc (tabled pending Anthropic API) (#1027)`
- `0cc830b fix: avoid tilde-in-assignment to silence Claude Code permission prompts (#993)`
- `6a785c5 fix: ngrok Windows build + close CI error-swallowing gap (v0.18.0.1) (#1024)`
- `b805aa0 feat: Confusion Protocol, Hermes + GBrain hosts, brain-first resolver (v0.18.0.0) (#1005)`

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
- `ARCHITECTURE.md`
- `CHANGELOG.md`
- `CLAUDE.md`
- `README.md`
- `SKILL.md`
- `SKILL.md.tmpl`
- `TODOS.md`
- `VERSION`
- `autoplan/SKILL.md`
- `autoplan/SKILL.md.tmpl`
- `benchmark/SKILL.md`
- `benchmark/SKILL.md.tmpl`
- `bin/gstack-settings-hook`
- `browse/SKILL.md`
- `browse/SKILL.md.tmpl`
- `browse/scripts/build-node-server.sh`
- `browse/src/browser-manager.ts`
- `browse/src/cli.ts`
- `browse/src/server.ts`
