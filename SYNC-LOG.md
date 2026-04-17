# Sync Log — gstack

## latest cycle

- previous source sha: `23000672673224f04a5d0cb8d692356069c95f6a`
- current source sha: `822e843a60c6c13508f70dd1ffcc163e8fc79be5`
- mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증

## decision

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## upstream commits reviewed

- `822e843 fix: headed browser auto-shutdown + disconnect cleanup (v0.18.1.0) (#1025)`
- `cc42f14 docs: gstack compact design doc (tabled pending Anthropic API) (#1027)`
- `0cc830b fix: avoid tilde-in-assignment to silence Claude Code permission prompts (#993)`
- `6a785c5 fix: ngrok Windows build + close CI error-swallowing gap (v0.18.0.1) (#1024)`
- `b805aa0 feat: Confusion Protocol, Hermes + GBrain hosts, brain-first resolver (v0.18.0.0) (#1005)`

## evidence

- source remote: `https://github.com/garrytan/gstack.git`
- docs/interesting dirs: docs/
- changed file sample:
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
