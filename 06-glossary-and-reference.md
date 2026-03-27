# 06. 용어집과 레퍼런스

이 문서는 `gstack`를 읽을 때 반복적으로 등장하는 용어와, 어떤 원본 문서를 먼저 봐야 하는지 빠르게 찾도록 돕는 참조 문서입니다.

## 핵심 용어집

- **Sprint lifecycle** — `Think → Plan → Build → Review → Test → Ship → Reflect`로 이어지는 `gstack`의 기본 작업 흐름
- **Skill** — 특정 역할을 수행하도록 설계된 `SKILL.md` 기반 실행 표면
- **Generated SKILL.md** — 직접 수정 대상이 아니라 템플릿과 생성 스크립트에서 만들어지는 결과물
- **Browse / Browser daemon** — long-lived Chromium 세션과 localhost HTTP 기반 명령 실행 구조
- **Repo-local install** — 현재 저장소 내부 `.agents/skills/gstack` 경로에 설치하는 방식
- **User-global install** — 사용자 홈 기준 공용 skill/runtime 루트에 설치하는 방식
- **Lore commit** — 의도와 제약, 검증 결과를 trailer로 남기는 이 작업공간의 커밋 규약
- **Zero-skip render gate** — Mermaid 렌더 결과에서 `Skipped 0`을 만족해야만 배포로 넘어가는 검증 규칙

## 원본 문서별 추천 용도

- `origin/gstack/README.md` — 제품 소개, 대상 사용자, quick start, sprint 흐름
- `origin/gstack/docs/skills.md` — 각 스킬의 철학, 예시, 상세 동작
- `origin/gstack/ARCHITECTURE.md` — daemon 구조, ref 시스템, generated docs/test tier 설계
- `origin/gstack/BROWSER.md` — browse 명령, connect mode, handoff, side panel 레퍼런스
- `origin/gstack/AGENTS.md` — generated skill 계약과 빌드 명령 요약
- `origin/gstack/package.json` — 실제 build/test/eval script 계약

## 자주 쓰는 확인 명령

### 가이드 저장소 검증
- `npm install`
- `npm run render:diagrams`
- `git status --short --branch`
- `git log --oneline -1`
- `git log -1 --format=%B`

### 원본 `gstack` 구조 확인
- `find /home/terry/guide/origin/gstack -maxdepth 2 | sort`
- `sed -n '1,220p' /home/terry/guide/origin/gstack/README.md`
- `sed -n '1,220p' /home/terry/guide/origin/gstack/ARCHITECTURE.md`
- `sed -n '1,220p' /home/terry/guide/origin/gstack/docs/skills.md`

### 공개 배포 확인
- `gh auth status`
- `gh repo view terry3838/gstack-guide --web=false`
- `git remote -v`

## 텔레메트리 / 개인정보 참고

원본 README 기준으로 `gstack` 텔레메트리는 opt-in입니다.

- 기본값은 off
- 첫 실행 시 익명 사용 데이터 공유 여부를 묻는다
- 코드, 프롬프트, 경로, repo 이름 같은 사용자 생성 내용은 전송 대상이 아니다
- 원격 telemetry 없이도 로컬 analytics 흐름이 존재한다

가이드 본문에서는 이 항목을 간단히 요약하되, 자세한 근거는 원본 README와 관련 migration/function 자료를 함께 가리키는 방식이 적절합니다.

## 문서 통합 메모

현재 통합 기준은 다음과 같습니다.

- 온보딩 정보는 `README.md`와 `01/02` 계열 문서에 우선 배치
- 기술 내부 구조는 `04-browser-and-architecture.md`에 집중
- build/test/publication 게이트는 `05-build-test-and-publish.md`에 집중
- 빠른 재탐색용 요약과 링크는 이 문서(`06`)에 집중
