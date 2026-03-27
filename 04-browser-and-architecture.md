# 04. 브라우저와 아키텍처

`gstack`가 일반적인 "CLI 하나 더 있는 저장소"와 다른 가장 큰 이유는 브라우저를 다루는 방식입니다. 원본 `ARCHITECTURE.md`와 `BROWSER.md`를 함께 보면, 핵심은 두 가지입니다.

1. 브라우저를 매 호출마다 새로 띄우지 않는다.
2. 스킬 문서를 hand-written artifact로 두지 않고 generated contract로 관리한다.

## 1. 브라우저 daemon 구조

원본 문서는 `browse`를 컴파일된 CLI와 오래 살아 있는 Chromium daemon의 조합으로 설명합니다. CLI는 얇은 클라이언트이고, 실제 일은 Bun HTTP 서버와 Playwright가 수행합니다.

![Diagram 1](assets/diagrams/04-browser-and-architecture__diagram_1.svg)

### 왜 이렇게 만들었나

- browser cold start를 매번 감당하면 QA가 너무 느려진다
- 로그인 세션, 탭, 쿠키, localStorage를 유지해야 실제 사용 흐름을 검증할 수 있다
- headless QA, real Chrome connect mode, side panel 같은 기능이 모두 동일 세션 위에서 돌아야 한다

원본 설명 기준 첫 호출은 약 3초가 걸리지만, 그 다음부터는 100~200ms 수준의 round trip으로 명령을 처리합니다.

## 2. 상태 파일과 인증

daemon은 프로젝트 루트 쪽 `.gstack/browse.json`에 상태를 기록하고, CLI는 이 파일을 읽어 현재 포트와 bearer token을 찾습니다. 인증도 로컬이라고 생략하지 않고, 세션마다 UUID 토큰을 발급해 `Authorization: Bearer <token>`으로 검증합니다.

핵심 포인트:

- localhost 바인딩만 허용
- 상태 파일 권한은 owner-only
- health check 기반으로 liveness 확인
- idle timeout 이후 자동 종료

## 3. snapshot과 `@ref` 시스템

`gstack`의 브라우저 UX를 이해하려면 `snapshot`과 `@e1`, `@c1` 같은 ref 시스템을 알아야 합니다.

### 동작 개요

1. 접근성 트리를 읽는다
2. 요소마다 `@e1`, `@e2` 같은 ref를 붙인다
3. ref와 Playwright Locator를 매핑한다
4. 이후 `click @e3` 같은 명령이 이 매핑을 사용한다

장점은 DOM에 attribute를 주입하지 않고도 안정적으로 요소를 다시 찾을 수 있다는 점입니다. CSP, hydration, shadow DOM 같은 환경에서 이 설계가 특히 중요합니다.

### 추가 기능

- `snapshot -D`: 이전 스냅샷과 diff
- `snapshot -a`: ref overlay가 붙은 annotated screenshot
- `snapshot -C`: ARIA tree 밖의 상호작용 요소 탐색

## 4. real browser mode와 handoff

headless만으로 부족할 때는 real Chrome을 직접 띄우는 `connect` 계열이 있습니다.

- `connect`: 실제 Chrome 제어
- `disconnect`: 다시 headless로 복귀
- `focus`: 브라우저를 앞으로 가져오기
- `status`: 현재 모드와 연결 포트를 확인
- `handoff` / `resume`: 사용자가 직접 개입해야 하는 구간에서 제어권 넘기기

이 모드는 QA, 디자인 리뷰, 인증 흐름, CAPTCHA나 MFA 같은 실제 사용 흐름에서 특히 유용합니다.

## 4.1 workspace별 `.gstack` 격리

원본 `BROWSER.md`는 browse state가 프로젝트 루트 기준 `.gstack/` 아래에 저장되고, workspace마다 별도 Chromium 프로세스와 포트를 쓴다고 설명합니다. 즉 `project-a/.gstack/browse.json`과 `project-b/.gstack/browse.json`은 서로 독립입니다.

이 점이 중요한 이유는 다음과 같습니다.

- 포트 충돌을 피한다
- 쿠키와 탭이 프로젝트 사이에 섞이지 않는다
- `status`나 state file을 볼 때 어느 workspace의 브라우저인지 바로 식별할 수 있다

## 5. Chrome extension과 sidebar agent

원본 `BROWSER.md`는 Side Panel extension과 sidebar agent를 별도 섹션으로 설명합니다.

### extension이 주는 것

- live activity feed
- 현재 `@ref` 목록 표시
- 페이지 위 연결 pill
- 브라우저 상태 시각화

### sidebar agent가 주는 것

- 자연어 지시로 브라우저 작업 위임
- 다단계 폼, 추출, 네비게이션 자동화
- 메인 세션과 분리된 작업 컨텍스트

즉 `/browse`가 저수준 조작 레이어라면, side panel agent는 브라우저 쪽의 별도 조수에 가깝습니다.

## 6. generated SKILL.md 파이프라인

브라우저 다음으로 중요한 아키텍처 요소가 generated skill 문서입니다.

원본 `ARCHITECTURE.md`와 `CONTRIBUTING.md`는 일관되게 같은 규칙을 말합니다.

- `SKILL.md`를 직접 고치지 말 것
- `.tmpl` 템플릿을 수정할 것
- `gen-skill-docs`가 실제 소스 메타데이터를 읽어 문서를 만든다

![Diagram 2](assets/diagrams/04-browser-and-architecture__diagram_2.svg)

이 방식의 목적은 "문서와 코드가 어긋나지 않게 만드는 것"입니다. 명령과 플래그 정의가 코드에 있다면, 문서도 거기서 파생돼야 drift가 줄어듭니다.

## 7. 빌드와 테스트 구조

원본 `package.json`과 `CONTRIBUTING.md`를 함께 보면 `gstack`의 운영 계약은 아래처럼 읽을 수 있습니다.

- `bun run build`: generated docs + browse binary + 보조 바이너리 생성
- `bun test`: 빠른 정적 검증
- `bun run test:e2e`: 실제 `claude -p` 기반 E2E
- `bun run test:evals`: E2E + LLM-as-judge
- `bun run skill:check`: skill health dashboard

즉 테스트도 단일 계층이 아니라:

1. 무료/빠른 정적 검증
2. 실제 스킬 실행 E2E
3. LLM 평가

로 나눠 운영됩니다.

## 8. telemetry와 privacy

원본 README는 telemetry를 opt-in으로 설명합니다.

- 기본값 off
- 첫 실행 시 동의 여부 확인
- 전송되는 건 skill name, duration, success/fail, version, OS 중심
- 코드, 프롬프트, 경로, repo 이름 같은 사용자 생성 정보는 전송 대상이 아님
- 로컬 analytics는 원격 telemetry 없이도 사용 가능

이 항목은 브라우저/extension을 다루는 도구인 만큼, 사용자에게 먼저 안심시켜야 하는 지점이기도 합니다.

## 9. 이 구조를 알아야 하는 이유

`gstack`를 그냥 "명령 모음"으로 보면 자주 막히는 이유는 다음과 같습니다.

- 왜 `/browse`가 빠른지 이해 못한 채 cold-start를 기대한다
- 왜 `snapshot`을 다시 해야 하는지 모른다
- 왜 `SKILL.md`를 직접 고치면 안 되는지 모른다
- 왜 Bun build/test가 반복해서 등장하는지 감이 없다

그래서 실제 사용자는 내부 구현을 전부 알 필요는 없지만, 적어도 daemon, ref, generated docs, build/test tiers 네 축은 이해하고 써야 합니다.
