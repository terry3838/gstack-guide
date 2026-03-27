# gstack-guide

한국어 중심 `gstack` 가이드 저장소입니다. 이 저장소는 원본 `gstack` 저장소를 그대로 번역하는 대신, 빠른 온보딩과 깊은 기술 문서를 분리한 하이브리드 안내서로 재구성하는 것을 목표로 합니다.

## 이 가이드가 다루는 범위

- `gstack`가 누구를 위한 도구인지와 왜 존재하는지
- `Think → Plan → Build → Review → Test → Ship → Reflect` 스프린트 흐름
- 28개 스킬을 워크플로우 관점에서 묶어 읽는 방법
- long-lived Chromium daemon, CLI, generated SKILL.md 파이프라인 같은 기술 내부 구조
- 빌드/테스트/문서 생성/공개 배포 검증 절차

## 현재 준비 상태

- `main` 브랜치 기준 로컬 저장소 초기화 완료
- Mermaid SVG 렌더 파이프라인 준비 완료
- 문서 파일 트리 스캐폴드 생성 완료
- 후속 온보딩/기술 레인 통합을 위한 기본 정보 구조 확정

## 문서 맵

- `01-installation-and-setup.md` — 설치 방식, host 차이, 초기 설정
- `02-sprint-workflow.md` — 스프린트 단계와 스킬 간 handoff
- `03-skill-catalog.md` — 스킬 분류와 사용 맥락
- `04-browser-and-architecture.md` — 브라우저/CLI/daemon 구조
- `05-build-test-and-publish.md` — 빌드, 테스트, 공개 배포 절차
- `06-glossary-and-reference.md` — 용어집, 치트시트, 참고 링크

## 원본 소스 맵

현재 통합된 source inventory에 따르면 원본 `gstack`는 다음 다섯 레인으로 읽는 것이 가장 이해하기 쉽습니다.

1. **제품/온보딩 레인** — `README.md`의 포지셔닝, 대상 사용자, quick start, install 모드
2. **스프린트/역할 레인** — `README.md`의 sprint 표와 `docs/skills.md`의 skill deep dives
3. **브라우저/런타임 레인** — `ARCHITECTURE.md`, `BROWSER.md`, parallel sprint 설명
4. **생성 파이프라인 레인** — `AGENTS.md`, `package.json`, `CONTRIBUTING.md`, generated SKILL.md 계약
5. **지원 시스템 레인** — telemetry/privacy, docs table, scripts/test/supabase/extension 구조

이 구분 덕분에 가이드를 단일 README 재서술이 아니라, 온보딩 문서와 기술 레퍼런스로 나눠 유지할 수 있습니다.

## 통합 흐름

![Diagram 1](assets/diagrams/README__diagram_1.svg)

## 지금까지 반영된 실행 가이드

- 소스 인벤토리 레인 구조를 기준으로 문서 역할을 배치했습니다.
- 검증 레인에서 정리한 zero-skip Mermaid 게이트, Lore 커밋 확인, GitHub publication runbook을 후속 문서에 반영합니다.
- 온보딩/기술 초안이 도착하면 이 저장소에서 병합하고, 최종 렌더/커밋/공개 배포를 수행합니다.
