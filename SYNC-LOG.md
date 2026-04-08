# Sync Log — gstack

## latest cycle

- previous source sha: `47b3ee2ced507bb61ed61843d3c0b2520b019eec`
- current source sha: `1868636f49020a3092c44d3cbfed2c0eb8fcddc4`
- mode: `update`
- impact labels: CLI/명령어, 테스트/검증

## decision

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: CLI/명령어, 테스트/검증.

## upstream commits reviewed

- `1868636 refactor: extract TabSession for per-tab state isolation (v0.15.16.0) (#873)`
- `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)`

## evidence

- source remote: `https://github.com/garrytan/gstack.git`
- docs/interesting dirs: docs/
- changed file sample:
- `BROWSER.md`
- `CHANGELOG.md`
- `VERSION`
- `browse/src/browser-manager.ts`
- `browse/src/cli.ts`
- `browse/src/cookie-picker-routes.ts`
- `browse/src/meta-commands.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/snapshot.ts`
- `browse/src/tab-session.ts`
- `browse/src/write-commands.ts`
- `browse/test/batch.test.ts`
- `browse/test/commands.test.ts`
- `browse/test/compare-board.test.ts`
- `browse/test/handoff.test.ts`
- `browse/test/server-auth.test.ts`
- `browse/test/snapshot.test.ts`
- `test/skill-e2e-workflow.test.ts`
