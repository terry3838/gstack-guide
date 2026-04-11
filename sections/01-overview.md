# gstack 개요

## repo 역할

- repo: `gstack`
- source: `https://github.com/garrytan/gstack.git`
- version basis: `0.16.2.0`
- latest synced commit: `dbd7aee5b6b5`

## 왜 frontdoor를 다시 썼나

기존 가이드는 멀티호스트와 browser/ship 쪽은 잘 잡았지만,
현재 upstream이 더 강하게 미는 세 가지를 frontdoor에서 충분히 전면화하지 못했어요.

1. `/office-hours` 중심 시작 루프
2. OpenClaw 연동과 Native OpenClaw Skills
3. team mode와 멀티호스트 설치

## 지금 기준의 핵심 메시지

- gstack는 workflow system이에요
- 시작점은 `/office-hours`예요
- OpenClaw와 붙는 방법론 층으로 읽는 게 맞아요
- `/document-release`까지 포함한 release/doc sync 루프가 중요해졌어요

## 학습자가 먼저 볼 것

- `README.md`
- `01-installation-and-setup.md`
- `02-sprint-workflow.md`
- `03-skill-catalog.md`

## 다음 행동

처음이면 `/office-hours`를 중심으로 학습 경로를 다시 잡으세요.
운영자면 team mode와 OpenClaw 경로를 먼저 확인하세요.
