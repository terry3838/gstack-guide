# Sync Log — gstack

## latest cycle

- previous source sha: `422f172fbbcb75774c86bbe5d7c097adaf561380`
- current source sha: `47b3ee2ced507bb61ed61843d3c0b2520b019eec`
- mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증

## decision

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## upstream commits reviewed

- `47b3ee2 fix: auto-symlink into ~/.claude/skills/ when cloned elsewhere (#865)`
- `8ca950f feat: content security — 4-layer prompt injection defense for pair-agent (#815)`
- `03973c2 fix: community security wave — 8 PRs, 4 contributors (v0.15.13.0) (#847)`
- `b3d064a fix: gstack-team-init detects and removes vendored copies (#848)`
- `dae251e feat: team-friendly gstack install mode (v0.15.7.0) (#809)`
- `a94a64f fix: snapshot -i auto-detects dropdown/popover interactive elements (#845)`
- `237ae2a Revert "fix: snapshot -i auto-detects dropdown/popover interactive elements (#844)"`
- `542e783 fix: snapshot -i auto-detects dropdown/popover interactive elements (#844)`

## evidence

- source remote: `https://github.com/garrytan/gstack.git`
- docs/interesting dirs: docs/
- changed file sample:
- `CHANGELOG.md`
- `CLAUDE.md`
- `CONTRIBUTING.md`
- `README.md`
- `SKILL.md`
- `VERSION`
- `autoplan/SKILL.md`
- `benchmark/SKILL.md`
- `bin/gstack-learnings-search`
- `bin/gstack-session-update`
- `bin/gstack-settings-hook`
- `bin/gstack-team-init`
- `bin/gstack-telemetry-sync`
- `bin/gstack-uninstall`
- `browse/PLAN-snapshot-dropdown-interactive.md`
- `browse/SKILL.md`
- `browse/src/activity.ts`
- `browse/src/browser-manager.ts`
- `browse/src/cdp-inspector.ts`
- `browse/src/cli.ts`
