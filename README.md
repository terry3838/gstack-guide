# gstack 한국어 가이드

`gstack`는 Claude Code를 중심으로 제품 사고, 계획, 구현, 리뷰, QA, 배포를 하나의 작업 리듬으로 묶는 AI 엔지니어링 워크플로우입니다. 단순한 "보조 코딩 도구"가 아니라, 역할이 분리된 스킬 묶음과 브라우저 자동화, 리뷰 루프, 배포 루틴까지 포함한 운영 체계에 가깝습니다.

이 저장소는 원본 `gstack` 저장소를 그대로 번역하는 대신, 실제로 써야 하는 순서와 판단 기준을 한국어로 재구성한 사용 가이드입니다. 빠른 온보딩은 여기서 시작하고, 설치 세부사항은 [01-installation-and-setup.md](01-installation-and-setup.md), 스프린트 흐름은 [02-sprint-workflow.md](02-sprint-workflow.md), 스킬 지도는 [03-skill-catalog.md](03-skill-catalog.md), 내부 구조는 [04-browser-and-architecture.md](04-browser-and-architecture.md), 운영/배포는 [05-build-test-and-publish.md](05-build-test-and-publish.md)에서 이어집니다.

## 한눈에 보기

- 대상 사용자: 기술 창업자, Staff/Lead 엔지니어, AI 에이전트를 팀처럼 쓰고 싶은 빌더
- 핵심 가치: 역할 분리, 브라우저 기반 실사용 검증, 문서/리뷰/배포의 연결, 반복 가능한 릴리스 루프
- 구성 요소: 역할별 스킬 묶음, long-lived browser daemon, generated SKILL.md 파이프라인, 테스트/배포 스크립트, 확장 기능

![Diagram 1](assets/diagrams/README__diagram_1.svg)

## 이 도구가 강한 이유

### 1. 스킬이 "역할"을 강제한다

원본 README는 `gstack`를 CEO, 엔지니어링 매니저, 디자이너, 리뷰어, QA, 릴리스 엔지니어 같은 역할 집합으로 설명합니다. 중요한 점은 각 스킬이 단순 명령어가 아니라 특정 사고 모드를 강제한다는 데 있습니다.

- `/office-hours`: 기능 요청을 문제 재정의로 바꾼다
- `/plan-ceo-review`: 범위와 제품 방향을 다시 묻는다
- `/plan-eng-review`: 아키텍처와 테스트 계획을 고정한다
- `/review`: production incident 관점에서 결함을 찾는다
- `/qa`: 실제 브라우저에서 버그를 재현하고 잡는다
- `/ship`: 테스트, 커버리지, PR 생성까지 릴리스 루틴으로 묶는다

### 2. 브라우저가 일회성 툴이 아니라 지속 세션이다

`gstack`의 `/browse`는 매번 새 브라우저를 띄우는 식이 아니라, 로컬 Chromium daemon을 오래 살아 있게 두고 그 위에서 명령을 주고받는 구조입니다. 그래서 로그인 상태, 탭, 쿠키, localStorage를 유지한 채 QA와 자동화를 이어갈 수 있습니다.

### 3. 계획과 실행이 끊어지지 않는다

원본 문서는 `/plan-eng-review`가 남긴 테스트 계획을 `/qa`가 읽고, `/review` 결과를 `/ship`가 이어받는 식으로 각 단계가 앞 단계의 산출물을 재사용한다고 설명합니다. 즉 "좋은 프롬프트 한번"이 아니라 스프린트 전체를 연결하는 파이프라인입니다.

## 추천 시작 순서

1. [01-installation-and-setup.md](01-installation-and-setup.md)를 따라 설치 모드를 결정한다.
2. [02-sprint-workflow.md](02-sprint-workflow.md)에서 전체 루프를 먼저 이해한다.
3. [03-skill-catalog.md](03-skill-catalog.md)에서 스킬을 역할군으로 묶어 기억한다.
4. `/browse`, `/qa`, `/review` 같은 실행 계열을 쓰기 전에 [04-browser-and-architecture.md](04-browser-and-architecture.md)를 읽어 내부 제약을 익힌다.
5. 실제 공개 저장소 운영이나 문서 릴리스는 [05-build-test-and-publish.md](05-build-test-and-publish.md)를 기준으로 검증한다.

## 저장소 읽는 법

![Diagram 2](assets/diagrams/README__diagram_2.svg)

### 문서 역할

- `README.md`: 도구의 성격, 출발점, 전체 지도를 설명한다.
- `01-installation-and-setup.md`: 어떤 설치 모드를 선택해야 하는지 결정하게 돕는다.
- `02-sprint-workflow.md`: 스킬을 "순서"로 이해하게 만든다.
- `03-skill-catalog.md`: 역할군과 사용 시점을 빠르게 찾는다.
- `04-browser-and-architecture.md`: 브라우저 daemon과 generated 문서 시스템의 내부 원리를 설명한다.
- `05-build-test-and-publish.md`: 이 가이드 저장소 자체를 검증하고 공개하는 절차를 담는다.
- `06-glossary-and-reference.md`: 용어와 원문 위치를 빠르게 찾는 인덱스 역할을 한다.

## 주의할 점

- 원본 `gstack`는 빠르게 진화하므로, 명령과 스크립트는 항상 원본 저장소 기준으로 다시 확인하는 습관이 필요합니다.
- `SKILL.md`는 대부분 generated artifact이므로 직접 수정 대상이 아닙니다.
- 브라우저 기능은 실제 세션과 로컬 보안 모델을 다루기 때문에, 구조를 모르고 쓰면 왜 빠른지보다 왜 실패하는지가 먼저 보일 수 있습니다.

## 다음 문서

설치 경로를 먼저 고르려면 [01-installation-and-setup.md](01-installation-and-setup.md)로 이동하세요.
