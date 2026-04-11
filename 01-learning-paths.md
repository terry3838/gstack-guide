# gstack 학습 경로

gstack는 지금 **`/office-hours`를 시작점으로 보는 편이 가장 정확해요.**
그 다음에 계획, 구현, 리뷰, QA, ship, document-release 순으로 붙여야 전체 그림이 보여요.

## 트랙 1. 처음 쓰는 사용자

목표:
- gstack를 skill 모음이 아니라 workflow로 이해해요
- `/office-hours`를 frontdoor로 받아들여요

읽는 순서:
1. `README.md`
2. `02-sprint-workflow.md`
3. `03-skill-catalog.md`
4. `02-glossary.md`

첫 루프:
- `/office-hours`
- `/plan-ceo-review`
- `/review`

성공 기준:
- 왜 `/office-hours`가 시작점인지 설명할 수 있어요
- `/ship` 전에 review/qa가 어떤 자리를 차지하는지 설명할 수 있어요

## 트랙 2. OpenClaw 사용자

목표:
- OpenClaw와 gstack의 역할 분리를 이해해요
- Native OpenClaw Skills와 Claude Code session spawn 경로를 구분해요

읽는 순서:
1. `README.md`
2. `01-installation-and-setup.md`
3. `04-browser-and-architecture.md`
4. upstream `docs/OPENCLAW.md`

성공 기준:
- Native OpenClaw Skills가 무엇인지 설명할 수 있어요
- OpenClaw는 session orchestration, gstack는 methodology/workflow라는 점을 설명할 수 있어요

## 트랙 3. 팀 운영자

목표:
- `./setup --team`과 `gstack-team-init`의 의미를 이해해요
- 공유 레포에서 버전 drift를 줄여요

읽는 순서:
1. `01-installation-and-setup.md`
2. `05-build-test-and-publish.md`
3. upstream `CHANGELOG.md`

성공 기준:
- team mode가 왜 vendoring보다 나은지 설명할 수 있어요
- `/document-release`가 ship 루프에 왜 붙는지 설명할 수 있어요
