# gstack 한국어 가이드

> `/office-hours`에서 문제를 다시 정의하고, `/ship`에서 문서까지 닫는 AI engineering workflow system

지금의 `gstack`는 더 이상 Claude Code 전용 스킬 묶음으로만 보면 안 돼요. 최근 upstream README와 CHANGELOG를 보면 frontdoor 자체가 넓어졌어요.

- **진입점은 `/office-hours` 중심의 제품 사고 루프**예요
- **OpenClaw 연동이 공식 frontdoor로 올라왔어요**
- **Native OpenClaw Skills가 별도 설치 루트로 분리됐어요**
- **멀티호스트 설치와 팀 모드가 훨씬 중요해졌어요**

이 가이드는 그 변화를 기준으로 frontdoor를 다시 세워요.

## 버전 기준

- upstream 기준 커밋: `dbd7aee`
- current version: `0.16.2.0`
- 근거: `README.md`, `CHANGELOG.md`, `VERSION`, top-level 구조

## gstack를 한 문장으로 보면

**문제 재정의, 계획, 구현, 리뷰, QA, 릴리즈, 문서 갱신까지를 역할별 skill로 엮은 AI engineering workflow system**이에요.

핵심은 “도구 모음”보다 **스프린트 전체를 한 흐름으로 연결한다**는 데 있어요.

## 왜 지금 다시 읽어야 하나

### 1. `/office-hours`가 더 강한 frontdoor가 됐어요

지금 README의 quick start도 `/office-hours`를 먼저 밀어요.
최근 `0.16.2.0`도 office-hours의 closing/journey를 계속 강화하고 있어요.
즉 gstack의 시작점은 “바로 구현”이 아니라 **문제를 다시 정의하는 제품 사고 루프**예요.

### 2. OpenClaw 연동이 부가 기능이 아니에요

README와 CHANGELOG는 gstack를 OpenClaw와 함께 쓰는 경로를 정식으로 설명해요.

- OpenClaw가 Claude Code 세션을 spawn해요
- gstack는 그 세션에 planning discipline과 workflow를 공급해요
- Native OpenClaw Skills는 Claude Code 세션 없이도 methodology를 바로 써요

즉 지금의 gstack은 **Claude Code 안쪽만 보는 도구가 아니라 OpenClaw와 붙는 방법론 공급층**으로도 읽어야 해요.

### 3. Native OpenClaw Skills를 따로 알아야 해요

`gstack-openclaw-office-hours`, `gstack-openclaw-ceo-review`, `gstack-openclaw-investigate`, `gstack-openclaw-retro`는
별도 설치 경로를 가진 conversational skill이에요.

이건 “전체 gstack를 설치해야만 gstack 철학을 쓸 수 있다”가 아니라,
**방법론 일부는 OpenClaw에서 직접 쓸 수 있다**는 뜻이에요.

### 4. 멀티호스트와 팀 모드가 frontdoor로 올라왔어요

README는 Claude Code뿐 아니라 Codex, OpenCode, Cursor, Factory Droid, Slate, Kiro까지 이야기해요.
또 `./setup --team`과 `gstack-team-init`을 통해 **공유 레포에서 버전 drift 없이 팀으로 쓰는 경로**도 분명하게 설명해요.

## 추천 읽기 순서

1. `sections/01-overview.md`
2. `01-installation-and-setup.md`
3. `02-sprint-workflow.md`
4. `03-skill-catalog.md`
5. `02-glossary.md`

## 가장 현실적인 첫 성공 루프

Claude Code 사용자라면:
1. gstack 설치
2. `/office-hours`
3. `/plan-ceo-review`
4. `/review`
5. `/ship`

OpenClaw 사용자라면:
1. Claude Code 쪽 gstack 설치 또는 Native OpenClaw Skills 설치
2. planning/review/retro methodology를 OpenClaw에서 직접 사용
3. 코딩이 필요하면 Claude Code 세션 spawn과 함께 gstack workflow 적용

## 누가 이 가이드를 읽으면 좋나

- 문제 정의부터 QA/ship까지 연결된 workflow가 필요한 사람
- OpenClaw와 Claude Code를 함께 운영하는 사람
- 팀 레포에서 gstack를 공통 규율로 쓰고 싶은 사람
- `/document-release`까지 포함한 문서-동기화 운영 루프가 필요한 사람

## 자주 생기는 오해

- **오해 1: gstack는 Claude 전용이다**
  - 아니에요. 지금 frontdoor는 멀티호스트예요.

- **오해 2: 바로 `/review`나 `/ship`부터 보면 된다**
  - 아니에요. 현재 frontdoor는 `/office-hours`와 계획 루프를 더 강조해요.

- **오해 3: OpenClaw 연동은 부가 설명이다**
  - 아니에요. 지금 README/CHANGELOG에서는 핵심 확장 축이에요.

## 다음 행동

- 처음 읽으면 `01-learning-paths.md`부터 보고, `/office-hours`를 시작점으로 생각을 맞추세요.
- 운영자면 `01-installation-and-setup.md`와 `05-build-test-and-publish.md`를 먼저 보세요.

<!-- GUIDE_SYNC:START -->
## 자동 동기화 상태

- origin repo: `gstack`
- latest source commit: `7e96fe299b08`
- sync mode: `update`
- 영향 분류: 설치/설정, CLI/명령어, 테스트/검증

### 이번 반영 포인트

origin 변경 파일을 기준으로 guide 문서의 관련 섹션을 다시 읽고 반영했습니다. 핵심 영향 영역: 설치/설정, CLI/명령어, 테스트/검증.

### 최근 upstream 커밋

- `7e96fe2 fix: security wave 3 — 12 fixes, 7 contributors (v0.16.4.0) (#988)`

### 변경 파일 샘플

- `.github/docker/Dockerfile.ci`
- `CHANGELOG.md`
- `VERSION`
- `bin/gstack-learnings-log`
- `bin/gstack-learnings-search`
- `bin/gstack-settings-hook`
- `bin/gstack-team-init`
- `browse/src/audit.ts`
- `browse/src/browser-manager.ts`
- `browse/src/config.ts`
- `browse/src/cookie-import-browser.ts`
- `browse/src/path-security.ts`
- `browse/src/read-commands.ts`
- `browse/src/server.ts`
- `browse/src/url-validation.ts`
- `browse/src/write-commands.ts`
- `browse/test/commands.test.ts`
- `design/src/session.ts`
- `setup`

> 이 블록은 guide sync가 자동 갱신합니다.
<!-- GUIDE_SYNC:END -->
