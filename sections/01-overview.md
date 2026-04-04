# gstack 개요

## 원본 저장소 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- latest synced commit: `be96ff5ce771`
- summary: > "I don't think I've typed like a line of code probably since December, basically, which is an extremely large change." — [Andrej Karpathy](https://fortune.com/2026/03/21/andrej-karpathy-openai-cofounder-ai-agents-coding-state-of-psychosis-openclaw/), No Priors podcast, March 2026

## 이번 싸이클 판단

- sync mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조
- 판단: origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조.

## 최근 upstream 커밋

- `be96ff5 feat: /plan-devex-review + /devex-review — DX review skills (v0.15.3.0) (#784)`
- `103a1b3 docs: Slate agent integration research + design doc (#782)`
- `c620de3 fix: setup runs pending migrations so git pull + ./setup works (#774)`
- `846269e feat: voice-friendly skill triggers for AquaVoice (v0.14.6.0) (#732)`
- `4fc64f7 fix: top-level skill dirs so Claude discovers unprefixed names (#761)`

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
- `CONTRIBUTING.md`

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
- `autoplan/SKILL.md.tmpl`
- `benchmark/SKILL.md`
- `benchmark/SKILL.md.tmpl`
- `bin/gstack-relink`
- `browse/SKILL.md`
- `canary/SKILL.md`
- `checkpoint/SKILL.md`
- `codex/SKILL.md`
- `codex/SKILL.md.tmpl`
- `connect-chrome/SKILL.md`
- `connect-chrome/SKILL.md.tmpl`
- `cso/SKILL.md`
- `cso/SKILL.md.tmpl`
