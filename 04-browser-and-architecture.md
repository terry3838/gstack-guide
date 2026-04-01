# 04. 브라우저와 아키텍처

최신 `gstack`를 이해하려면 두 축을 함께 봐야 합니다.

1. 브라우저를 매 호출마다 새로 띄우지 않는 daemon 구조
2. 스킬 문서를 hand-written artifact가 아니라 generated contract로 다루는 구조

## 1. 브라우저 daemon 모델

업스트림 `ARCHITECTURE.md`와 `BROWSER.md`는 `browse`를 컴파일된 CLI + 오래 살아 있는 Chromium daemon으로 설명합니다. CLI는 얇은 클라이언트이고, 실제 일은 Bun HTTP 서버와 Playwright가 수행합니다.

![Diagram 1](assets/diagrams/04-browser-and-architecture__diagram_1.svg)

### 왜 이렇게 만들었나

- cold start를 매번 감당하면 QA 루프가 너무 느려진다
- 로그인 세션, 탭, 쿠키, localStorage를 유지해야 실사용 흐름이 검증된다
- headless, real Chrome, extension, sidebar agent가 같은 세션 위에서 돌아야 한다

현재 문서 기준 첫 호출은 수 초, 이후 명령은 대체로 100~200ms 수준으로 왕복합니다.

## 2. 상태 파일과 보안 모델

daemon은 프로젝트 루트 `.gstack/browse.json`에 상태를 기록하고, CLI는 이 파일을 읽어 포트와 bearer token을 찾습니다.

핵심 포인트:

- localhost 바인딩만 허용
- 세션별 bearer token 발급
- 상태 파일 권한 제한
- idle timeout 후 자동 종료
- 서버가 죽으면 다음 호출에서 새로 띄우는 crash recovery

즉 로컬 도구이지만 인증을 생략하지 않습니다.

## 3. ref 기반 조작과 snapshot

`gstack` 브라우저 UX의 핵심은 `snapshot`과 `@ref` 시스템입니다.

### 기본 흐름

1. 접근성 트리를 읽는다
2. 요소에 `@e1`, `@e2` 같은 ref를 붙인다
3. ref와 Playwright Locator를 매핑한다
4. 이후 `click @e3` 같은 명령이 이 매핑을 사용한다

이 방식의 장점은 DOM mutation 없이도 안정적으로 요소를 다시 찾는다는 점입니다. CSP, hydration, SPA 전환, shadow DOM 같은 환경에서 특히 중요합니다.

### 최신 문서에서 봐야 할 확장점

- `snapshot -D`: 이전 스냅샷 대비 diff
- `snapshot -a`: ref overlay가 붙은 annotated screenshot
- `snapshot -C`: ARIA tree 밖 interactive element를 `@c` ref로 캡처
- stale ref 감지: 오래된 ref는 action timeout 전에 빠르게 실패시켜 재-snapshot을 유도

## 4. headless를 넘는 real browser mode

최신 `gstack`에서 가장 크게 달라진 체감 포인트입니다.

- `connect`: 실제 Chrome을 띄우고 Playwright가 제어
- `disconnect`: 다시 headless로 복귀
- `focus`: Chrome을 앞으로 가져오기
- `handoff` / `resume`: CAPTCHA, MFA, 수동 개입이 필요한 구간 넘기기

이제 브라우저는 숨겨진 QA 엔진이 아니라 **같이 보는 작업 공간**이 됩니다.

## 5. Chrome extension과 Side Panel

최신 `BROWSER.md`는 Side Panel extension을 중요한 1급 표면으로 다룹니다.

### extension이 주는 것

- live activity feed
- 현재 `@ref` 목록
- 페이지 위 connection pill
- 브라우저 상태 시각화

### sidebar agent가 주는 것

- 자연어 지시로 브라우저 작업 위임
- 다단계 폼/추출/네비게이션 자동화
- 메인 세션과 분리된 브라우저 조수

즉 `/browse`가 저수준 명령 계층이라면, Side Panel은 브라우저 안의 별도 오퍼레이터입니다.

## 6. workspace 격리와 세션 재사용

업스트림 문서는 프로젝트마다 `.gstack/` 상태를 별도로 두고, workspace마다 서로 다른 Chromium 프로세스와 포트를 사용한다고 설명합니다.

이 점이 중요한 이유:

- 프로젝트 간 쿠키/탭 오염 방지
- 포트 충돌 회피
- 어떤 workspace의 브라우저인지 즉시 식별 가능

## 7. generated SKILL.md 파이프라인

브라우저 다음으로 중요한 구조가 generated skill docs입니다.

![Diagram 2](assets/diagrams/04-browser-and-architecture__diagram_2.svg)

업스트림 `ARCHITECTURE.md`와 `CONTRIBUTING.md`가 반복하는 원칙:

- `SKILL.md`를 직접 고치지 말 것
- `.tmpl`과 생성기를 수정할 것
- Claude 출력과 Codex 출력이 함께 관리될 것
- build/CI가 freshness를 검증할 것

이 설계의 목적은 문서-코드 drift를 줄이는 것입니다.

## 8. 빌드와 테스트 계층

최신 `gstack` 운영 계약은 단일 테스트가 아니라 계층형입니다.

1. `bun test`: 무료/빠른 정적 검증
2. `bun run test:e2e`: `claude -p` 기반 실제 E2E
3. `bun run test:evals`: E2E + LLM-as-judge
4. `bun run skill:check`: host별 skill health 점검

즉 "동작한다"의 의미를 정적 체크, 실제 세션, 품질 평가로 나눠 운영합니다.

## 9. telemetry와 privacy

최신 README와 CHANGELOG 기준 telemetry는 opt-in입니다.

- 기본값 off
- 첫 실행 시 동의 여부 확인
- 전송 대상: skill name, duration, success/fail, version, OS 등 운영 메타데이터 중심
- 제외 대상: 코드, 프롬프트, 파일 경로, repo 이름 같은 사용자 생성 정보

브라우저와 확장을 다루는 도구인 만큼, 이 점을 먼저 알고 쓰는 것이 좋습니다.

## 10. 이 구조를 알아야 하는 이유

`gstack`를 그냥 명령 모음으로 보면 자주 막히는 이유는 대체로 네 가지입니다.

- 왜 `/browse`가 빠른지 모른다
- 왜 snapshot을 다시 해야 하는지 모른다
- 왜 `SKILL.md`를 직접 고치면 안 되는지 모른다
- 왜 build/test가 계속 등장하는지 감이 없다

실사용자는 구현 세부를 다 알 필요는 없지만, 최소한 daemon, ref, generated docs, test tiers, real Chrome/extension 구조는 알고 쓰는 편이 훨씬 덜 막힙니다.
