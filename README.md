# gstack-guide

한국어 중심 `gstack` 가이드 저장소입니다. 현재 단계에서는 통합/부트스트랩 레인을 먼저 고정해 두고, 다른 작성 레인에서 전달하는 내용이 이 골격 위로 합쳐지도록 준비합니다.

## 현재 준비 상태

- `main` 브랜치 기준 로컬 저장소 초기화
- Mermaid SVG 렌더 파이프라인 준비
- 문서 파일 트리 스캐폴드 생성
- 후속 레인 통합용 기본 목차 배치

## 계획된 문서 맵

- `01-installation-and-setup.md` — 설치 방식과 환경 준비
- `02-sprint-workflow.md` — Think → Plan → Build → Review → Test → Ship → Reflect
- `03-skill-catalog.md` — 스킬 분류와 사용 맥락
- `04-browser-and-architecture.md` — 브라우저/CLI/daemon 구조
- `05-build-test-and-publish.md` — 빌드, 테스트, 공개 배포 절차
- `06-glossary-and-reference.md` — 용어집, 명령 치트시트, 참고 링크

## 통합 흐름

![Diagram 1](assets/diagrams/README__diagram_1.svg)

이 저장소는 다른 워커가 넘겨 주는 온보딩/기술/검증 결과를 통합하는 기준 골격으로 사용합니다.
