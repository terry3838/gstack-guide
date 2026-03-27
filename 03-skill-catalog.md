# 03. 스킬 카탈로그

`gstack`의 스킬은 많아 보이지만, 실제로는 몇 개의 역할군으로 기억하면 훨씬 관리하기 쉽습니다. 이 문서는 원본 README와 `docs/skills.md`의 설명을 바탕으로 스킬을 **언제 쓰는지** 중심으로 다시 묶어 보여줍니다.

## 전체 지도

![Diagram 1](assets/diagrams/03-skill-catalog__diagram_1.svg)

## 1. 핵심 워크플로우 스킬

| 스킬 | 언제 쓰나 | 핵심 역할 |
|---|---|---|
| `/office-hours` | 아이디어가 아직 제품 언어로 정리되지 않았을 때 | 문제를 재정의하고 design doc의 출발점을 만든다 |
| `/plan-ceo-review` | scope와 제품 방향을 다시 묻고 싶을 때 | 더 큰 제품 기회를 찾거나 범위를 줄인다 |
| `/plan-eng-review` | build 가능한 설계와 테스트 계획이 필요할 때 | 아키텍처, 경계 조건, failure mode, test matrix를 고정한다 |
| `/plan-design-review` | 구현 전에 디자인 결정을 비워두고 싶지 않을 때 | information architecture, state coverage, AI slop risk를 계획 단계에서 채운다 |
| `/autoplan` | 계획 리뷰를 한 번에 자동 파이프라인으로 돌리고 싶을 때 | CEO → design → eng review를 묶어 reviewed plan을 빠르게 만든다 |
| `/review` | 코드가 돌아가지만 production risk가 찜찜할 때 | race, trust boundary, N+1, 누락된 handler 같은 구조적 문제를 찾는다 |
| `/qa` | 실제 브라우저에서 기능을 검증하고 싶을 때 | diff-aware QA, bug reproduction, 회귀 테스트 생성 |
| `/ship` | branch를 PR/릴리스 단위로 정리할 때 | 테스트, 커버리지, PR 생성을 묶는다 |
| `/retro` | 주기 종료 후 개선 포인트를 정리할 때 | 팀/프로젝트 수준 회고 |

## 2. 설계와 디자인 확장 스킬

| 스킬 | 역할 |
|---|---|
| `/plan-design-review` | 구현 전 디자인 QA |
| `/design-consultation` | 디자인 시스템을 처음부터 같이 만드는 모드 |
| `/design-review` | 구현 후 실제 화면을 감사하고 바로 수정하는 모드 |

이 세 개는 모두 디자인을 다루지만, 타이밍이 다릅니다.

- `plan-design-review`: 구현 전
- `design-consultation`: 설계 전, 디자인 시스템이 아예 없을 때
- `design-review`: 구현 후, 실제 사이트 감사

## 3. 브라우저 / QA 계열 스킬

| 스킬 | 역할 |
|---|---|
| `/browse` | 저수준 브라우저 조작 계층 |
| `/setup-browser-cookies` | 실사용 브라우저 세션을 headless/real browser에 옮길 때 |
| `/qa` | 브라우저를 이용한 체계적 QA |
| `/qa-only` | 수정 없이 버그 리포트만 만들고 싶을 때 |

`/browse`는 "명령 집합"이고, `/qa`는 "방법론"입니다. 직접 페이지를 누르고 읽고 싶으면 `/browse`, 테스트 계획과 버그 수집까지 묶고 싶으면 `/qa`라고 이해하면 쉽습니다.

## 4. 조사 / 보안 / 성능 / 릴리스 보조 스킬

| 스킬 | 역할 |
|---|---|
| `/investigate` | 근본 원인 분석, 추측 금지 디버깅 |
| `/cso` | OWASP + STRIDE 중심 보안 리뷰 |
| `/benchmark` | page load, Core Web Vitals, 리소스 비교 |
| `/document-release` | 릴리스 후 문서 드리프트 정리 |
| `/land-and-deploy` | PR merge 이후 배포 및 운영 확인 |
| `/canary` | 배포 후 모니터링 루프 |
| `/codex` | 다른 모델 관점의 독립 리뷰 |

## 5. 안전 장치와 유틸리티

| 스킬 | 언제 쓰나 |
|---|---|
| `/careful` | 파괴적 명령 전 경고가 필요할 때 |
| `/freeze` | 특정 디렉터리 밖 수정 금지가 필요할 때 |
| `/guard` | 경고와 수정 경계를 동시에 걸고 싶을 때 |
| `/unfreeze` | 잠금을 해제할 때 |
| `/setup-deploy` | `/land-and-deploy` 전에 배포 환경을 정리할 때 |
| `/gstack-upgrade` | 글로벌/벤더드 설치를 최신으로 맞출 때 |

## 6. 어떤 스킬부터 기억하면 되나

처음에는 아래 6개만 제대로 기억해도 충분합니다.

1. `/office-hours`
2. `/plan-ceo-review`
3. `/plan-eng-review`
4. `/review`
5. `/qa`
6. `/ship`

계획 리뷰를 한 번에 돌리고 싶다면 여기 위에 `/autoplan`을 얹으면 됩니다. 문제가 생겼을 때는 `/investigate`, 직접 브라우저를 만질 때는 `/browse`, 화면 품질을 볼 때는 `/design-review`, 안전 경계가 필요할 때는 `/guard`를 붙이면 됩니다.

## 7. generated SKILL.md를 이해해야 하는 이유

원본 `AGENTS.md`와 `CONTRIBUTING.md`가 반복해서 강조하는 것처럼, 많은 `SKILL.md`는 템플릿과 생성 스크립트에서 만들어집니다. 즉:

- 직접 편집 대상이 아니다
- `.tmpl`이나 생성기 로직이 source of truth다
- command/flag 문서가 실제 코드와 드리프트하지 않게 설계돼 있다

이 사실을 모르면 "문서만 고치면 되겠지"라고 생각하기 쉽습니다. 하지만 `gstack`는 문서 자체도 runtime contract의 일부라서, generated 구조를 이해하는 것이 중요합니다.

## 8. 역할별 추천 조합

### 창업자 / PM
- `/office-hours`
- `/plan-ceo-review`
- `/plan-eng-review`

### 구현자 / 리드 엔지니어
- `/review`
- `/investigate`
- `/ship`

### QA / 디자이너
- `/browse`
- `/qa`
- `/design-review`

### 운영 / 릴리스
- `/benchmark`
- `/land-and-deploy`
- `/canary`
- `/document-release`

다음 문서에서는 이 스킬들이 왜 이런 방식으로 동작하는지, 특히 브라우저 daemon과 generated 문서 시스템의 내부 구조를 설명합니다. [04-browser-and-architecture.md](04-browser-and-architecture.md)를 읽으세요.
