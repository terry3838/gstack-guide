# Sync Log — gstack

## latest cycle

- previous source sha: `47b3ee2ced507bb61ed61843d3c0b2520b019eec`
- current source sha: `6cc094cd4190e3fac65b69fb29e0c3cae7e0f214`
- mode: `update`
- impact labels: 브라우저/pair-agent

## decision

pair-agent 터널 안정성 버그 수정(v0.15.15.1)을 가이드에 반영했습니다. 핵심 영향 영역: 브라우저/pair-agent.

## upstream commits reviewed

- `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)`
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
- `VERSION`
- `browse/src/cli.ts`
- `browse/src/server.ts`
- `browse/test/server-auth.test.ts`
