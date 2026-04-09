# Sync Log — gstack

## latest cycle

- previous source sha: `1868636f49020a3092c44d3cbfed2c0eb8fcddc4`
- current source sha: `a7593d70ef1b6500d1f6457c58cf7c9896cf6062`
- mode: `update`
- impact labels: CLI/명령어, 테스트/검증

## decision

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: CLI/명령어, 테스트/검증.

## upstream commits reviewed

- `a7593d7 fix: cookie picker auth token leak (v0.15.17.0) (#904)`
- `b73f364 feat: browser data platform for AI agents (v0.16.0.0) (#907)`
- `9d34baa fix: gstack-slug produces deterministic slugs across sessions (#897)`

## evidence

- source remote: `https://github.com/garrytan/gstack.git`
- docs/interesting dirs: docs/
- changed file sample:
- `CHANGELOG.md`
- `SKILL.md`
- `VERSION`
- `bin/gstack-slug`
- `browse/SKILL.md`
- `browse/src/cli.ts`
- `browse/src/commands.ts`
- `browse/src/cookie-picker-routes.ts`
- `browse/src/cookie-picker-ui.ts`
- `browse/src/media-extract.ts`
- `browse/src/meta-commands.ts`
- `browse/src/network-capture.ts`
- `browse/src/path-security.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/token-registry.ts`
- `browse/src/write-commands.ts`
- `browse/test/cookie-picker-routes.test.ts`
- `browse/test/data-platform.test.ts`
- `browse/test/fixtures/media-page.html`
