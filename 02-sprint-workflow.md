# 02. 스프린트 워크플로우

`gstack`를 잘 쓰는 핵심은 "무슨 스킬이 있느냐"보다 "언제 어느 스킬로 바꿔 타느냐"를 이해하는 데 있습니다. 원본 README가 제시하는 기본 루프는 다음 한 줄로 요약됩니다.

**Think → Plan → Build → Review → Test → Ship → Reflect**

## 전체 흐름

![Diagram 1](assets/diagrams/02-sprint-workflow__diagram_1.svg)

이 순서는 단순한 마케팅 문구가 아닙니다. 각 단계의 산출물이 다음 단계 입력으로 넘어가도록 설계돼 있습니다.

- `/office-hours`가 design doc를 만든다
- `/plan-ceo-review`와 `/plan-eng-review`가 scope와 technical spine을 정리한다
- `/review`가 implementation risk를 줄인다
- `/qa`가 실제 브라우저 검증과 회귀 테스트를 만든다
- `/ship`가 테스트, 커버리지, PR 생성까지 연결한다
- `/retro`가 다음 iteration에 피드백을 남긴다

## 1. Think: 문제 재정의

시작점은 대개 `/office-hours`입니다. 여기서는 사용자가 말한 기능 요청을 그대로 받지 않고, 진짜 제품 문제가 무엇인지 다시 묻습니다.

예를 들어 "calendar briefing app" 같은 요청이 들어와도, pain을 더 파고들어 "personal chief of staff AI"로 재정의하는 식입니다. 즉 이 단계의 목표는 기능 목록 생산이 아니라 **문제 프레이밍 교정**입니다.

### 언제 이 단계가 필요한가

- 기능은 떠올랐는데 제품 방향이 아직 흐릴 때
- 사용자의 고통을 언어로는 아는데 범위가 불안정할 때
- 팀이 "뭘 만들지"보다 "왜 지금 이걸 만드나"에서 흔들릴 때

## 2. Plan: 범위와 기술 뼈대 고정

계획 단계는 보통 둘로 나뉩니다.

- `/plan-ceo-review`: 제품적 범위, 야심, 사용자 가치
- `/plan-eng-review`: 아키텍처, 에러 흐름, 테스트, 경계 조건

필요하면 `/plan-design-review`까지 이어져 사용자 경험과 시각 설계를 미리 채웁니다.

![Diagram 2](assets/diagrams/02-sprint-workflow__diagram_2.svg)

### 이 단계의 산출물

- scope가 넓어질지 줄어들지에 대한 결정
- build 가능한 아키텍처와 테스트 방향
- design gaps, empty state, mobile/responsive 고려

## 3. Build: 구현

원본 README는 구현 자체보다, 구현이 앞 단계의 산출물을 읽는 방식에 더 방점을 둡니다. 즉 이 단계는 자유로운 코딩보다 **앞 단계에서 합의한 문서를 따라가는 생산 구간**에 가깝습니다.

실제로는 다음과 같이 흘러가는 편이 좋습니다.

1. plan 문서에서 범위 재확인
2. 필요한 구현 또는 문서 작업 수행
3. 중간중간 스스로 diff를 정리
4. 리뷰 가능 상태가 되면 `/review`로 넘김

## 4. Review: production 사고 미리 막기

`/review`는 스타일 칭찬보다 실패 가능성 탐색에 집중합니다.

주요 질문은 이런 식입니다.

- race condition이 숨어 있나
- retry logic이 잘못됐나
- enum 추가 시 빠진 handler가 있나
- trust boundary가 헐거운가
- 테스트는 통과하지만 실제 failure mode를 놓쳤나

즉 이 단계는 "예쁘게 짜였나"보다 **실제로 터질 지점이 남았나**를 보는 곳입니다.

## 5. Test: 브라우저에서 실제로 써보기

`/qa`는 `browse` 위에 올라가는 방법론입니다. diff-aware, quick, full, regression 같은 모드가 있고, 브라우저를 실제로 클릭하면서 테스트합니다.

### 어떤 점이 중요한가

- 바뀐 페이지를 우선 탐색한다
- 인증이 필요한 경우 `/setup-browser-cookies`를 먼저 쓴다
- 버그를 고치면 회귀 테스트를 같이 남긴다
- headless만으로 안 보이는 문제는 real Chrome mode를 쓴다

## 6. Ship: 릴리스 루틴

`/ship`은 구현과 검증이 끝난 branch를 PR/릴리스 단위로 묶는 단계입니다.

- main 동기화
- 테스트와 커버리지 확인
- 필요하면 테스트 프레임워크 bootstrap
- push
- PR 생성 또는 갱신

여기서는 더 좋은 아이디어를 내기보다, **릴리스 품질과 증빙**이 중요합니다.

## 7. Reflect: 다음 라운드를 위한 회고

`/retro`는 한 주기에서 무엇이 잘 됐고, 무엇이 병목이었는지 구조적으로 되짚는 역할을 합니다. 여러 프로젝트를 병렬로 굴린다면 `retro global` 같은 전역 관점도 의미가 있습니다.

## 병렬 스프린트에서 주의할 점

원본 README는 여러 sprint를 동시에 돌릴 수 있다는 점을 강하게 밀지만, 병렬성은 "아무나 많이 띄우기"와 다릅니다. 핵심은 각 세션이 어느 단계에 있는지 명확해야 한다는 점입니다.

- Think 세션은 문제 정의만 맡긴다
- Plan 세션은 scope와 설계 결정을 고정한다
- Build 세션은 구현에만 집중한다
- QA 세션은 실제 브라우저 검증에 묶는다

즉 parallelism의 전제는 role clarity입니다.

## 추천 초보 루프

처음엔 이 정도면 충분합니다.

1. `/office-hours`
2. `/plan-ceo-review`
3. `/plan-eng-review`
4. 구현
5. `/review`
6. `/qa`
7. `/ship`

여기에 익숙해지면 `/design-review`, `/browse`, `/codex`, `/benchmark`, `/land-and-deploy` 같은 보조/확장 레인을 붙이면 됩니다.
