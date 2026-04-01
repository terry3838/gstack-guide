# gstack 한국어 가이드

`gstack`는 Claude Code에서 출발했지만 이제는 Codex, Gemini CLI, Cursor, Factory Droid까지 포괄하는 AI 엔지니어링 워크플로우입니다. 핵심은 "프롬프트 모음"이 아니라, 문제 재정의부터 계획, 구현, 리뷰, QA, 배포, 회고까지를 역할별 스킬로 연결한 운영 체계라는 점입니다.

이 저장소는 원본 `gstack`를 그대로 번역하지 않습니다. 최신 릴리스 기준 핵심 개념과 실사용 순서를 한국어로 다시 묶은 안내서입니다. 설치는 [01-installation-and-setup.md](01-installation-and-setup.md), 스프린트 흐름은 [02-sprint-workflow.md](02-sprint-workflow.md), 스킬 지도는 [03-skill-catalog.md](03-skill-catalog.md), 브라우저/아키텍처는 [04-browser-and-architecture.md](04-browser-and-architecture.md), 운영 검증은 [05-build-test-and-publish.md](05-build-test-and-publish.md), 빠른 참조는 [06-glossary-and-reference.md](06-glossary-and-reference.md)에서 이어집니다.

## 현재 릴리스 기준

- 업스트림 확인 버전: `0.15.1.0`
- 지원 호스트: Claude Code, Codex, Gemini CLI, Cursor, Factory Droid
- 현재 포지셔닝: "가상 엔지니어링 팀"과 "실제 브라우저를 가진 QA/디자인/릴리스 파이프라인"
- 최근에 중요해진 축: `/connect-chrome`, Side Panel 기반 브라우저 협업, `/document-release`, `/gstack-upgrade`, `/learn`, Codex second opinion, opt-in telemetry

![Diagram 1](assets/diagrams/README__diagram_1.svg)

## 왜 지금의 gstack을 다시 봐야 하나

### 1. Claude 전용 스킬 묶음이 아니다

원본 README 최신판은 `gstack`를 Claude Code에 한정하지 않습니다. 동일한 스킬 철학을 Codex/Gemini/Cursor에도 맞추고, Codex 호스트에서는 `.agents/skills/gstack` 또는 `~/.codex/skills/gstack` 설치 경로를 공식적으로 안내합니다. 즉 "Claude 보조도구"라기보다 **SKILL.md 표준 위에서 동작하는 멀티호스트 워크플로우**로 보는 편이 맞습니다.

### 2. 브라우저가 훨씬 적극적인 협업 표면이 됐다

이제 `/browse`는 headless daemon만 의미하지 않습니다. `$B connect`로 실제 Chrome을 띄우고, Chrome extension Side Panel에서 activity feed와 `@ref` 목록을 보며, sidebar agent에게 자연어로 브라우저 작업을 넘길 수 있습니다. QA 도구를 넘어 **공동 조종석**에 가까워졌습니다.

### 3. 릴리스 이후 문서와 운영까지 파이프라인에 들어왔다

`/document-release`는 diff를 읽고 README/ARCHITECTURE/CONTRIBUTING/CLAUDE/TODOS를 동기화합니다. `/ship`는 최신 릴리스 기준 이 문서 동기화 레인을 사실상 기본 루틴에 포함합니다. `/land-and-deploy`, `/canary`, `/benchmark`까지 보면 build 이후 운영 확인도 하나의 연속된 흐름입니다.

## 추천 시작 순서

1. [01-installation-and-setup.md](01-installation-and-setup.md)에서 설치 모드와 호스트를 결정합니다.
2. [02-sprint-workflow.md](02-sprint-workflow.md)로 `Think → Plan → Build → Review → Test → Ship → Reflect` 루프를 먼저 이해합니다.
3. [03-skill-catalog.md](03-skill-catalog.md)에서 스킬을 역할군으로 묶어 기억합니다.
4. 실제 브라우저 QA, Chrome connect, cookie import를 쓰기 전에 [04-browser-and-architecture.md](04-browser-and-architecture.md)를 읽습니다.
5. 문서 저장소나 공개 가이드까지 운영하려면 [05-build-test-and-publish.md](05-build-test-and-publish.md)를 따라 검증합니다.

## 지금 기억해야 할 핵심 스킬

- `/office-hours`: 기능 요청을 제품 문제로 다시 정의
- `/plan-ceo-review`: 제품 범위와 야심 재검토
- `/plan-eng-review`: 아키텍처, 테스트, failure mode 고정
- `/review`: production risk 중심 코드 리뷰
- `/qa`: 실제 브라우저 기반 QA + 회귀 테스트 루프
- `/ship`: 테스트, PR, 문서/릴리스 루틴 묶기
- `/connect-chrome`: 실시간 Chrome 협업 모드
- `/document-release`: 릴리스 후 문서 드리프트 정리
- `/gstack-upgrade`: 글로벌/벤더드 설치 갱신
- `/learn`: 세션 간 운영 학습 관리

![Diagram 2](assets/diagrams/README__diagram_2.svg)

## 이 가이드를 읽을 때 주의할 점

- 원본 `gstack`는 빠르게 변합니다. 명령 세부사항은 항상 업스트림 README, BROWSER, ARCHITECTURE, CONTRIBUTING, CHANGELOG로 재확인하는 습관이 필요합니다.
- 많은 `SKILL.md`는 generated artifact입니다. 템플릿과 생성기 로직이 source of truth입니다.
- 브라우저 기능은 실제 세션, 쿠키, 확장, 로컬 보안 모델을 다룹니다. 속도만 기대하고 구조를 모르면 왜 빠른지보다 왜 막히는지가 먼저 보일 수 있습니다.
- telemetry는 최신 릴리스 기준 opt-in입니다. 기본값은 off이고, 코드나 프롬프트 같은 사용자 생성 내용은 전송 대상이 아닙니다.

## 다음 문서

설치 경로와 호스트별 차이를 먼저 보려면 [01-installation-and-setup.md](01-installation-and-setup.md)로 이동하세요.

<!-- GUIDE_SYNC:START -->
## 자동 동기화 상태

- origin repo: `gstack`
- latest source commit: `6169273d16b7`
- sync mode: `no-change`
- 영향 분류: 일반 변경

### 이번 반영 포인트

이번 싸이클에서는 origin 변경이 없어 guide 본문은 유지했고, 동기화 기준점만 재확인했습니다.

### 변경 파일 샘플

- 이번 싸이클에서는 신규 변경 파일이 없습니다.

> 이 블록은 guide sync가 자동 갱신합니다.
<!-- GUIDE_SYNC:END -->
