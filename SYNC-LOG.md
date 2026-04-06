# Sync Log — gstack

## latest cycle

- previous source sha: `04b709d91a3f10efa1c816c6ddb4c8cafa735da8`
- current source sha: `422f172fbbcb75774c86bbe5d7c097adaf561380`
- mode: `update`
- impact labels: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증

## decision

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: README/소개, 설치/설정, CLI/명령어, 문서 구조, 테스트/검증.

## upstream commits reviewed

- `422f172 feat: ship re-run executes all verification checks (v0.15.10.0) (#833)`
- `b3cd3fd feat: native OpenClaw skills + ClaHub publishing (v0.15.10.0) (#832)`
- `bd8d44d docs: rewrite README OpenClaw install — one paste, real instructions (#818)`
- `e2d005c feat: OpenClaw integration v2 — prompt is the bridge (v0.15.9.0) (#816)`
- `2b08cfe fix: close redundant PRs + friendly error on all design commands (v0.15.8.1) (#817)`
- `1652f22 fix(discover): parse Codex sessions with large session_meta (>4KB) (#798)`
- `f91ad61 fix: user-friendly error when OpenAI org is not verified (#776)`
- `9ca8f1d feat: adaptive gating + cross-review dedup for review army (v0.15.2.0) (#760)`

## evidence

- source remote: `https://github.com/garrytan/gstack.git`
- docs/interesting dirs: docs/
- changed file sample:
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
