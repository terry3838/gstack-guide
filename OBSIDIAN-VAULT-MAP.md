# Obsidian Vault Map

이 문서는 `gstack-guide` 의 repo guide 문서를 Obsidian note pack과 어떻게 대응시키는지 정리한다.

## 출력 모드

- mode: `hybrid`
- repo guide: `gstack-guide/`
- repo-local note pack: `obsidian/gstack Guide/`
- live vault target: `unset`
- live sync status: `not applied`

## 안전 원칙

- repo-local pack이 정본이다.
- live vault sync는 **의도된 vault target이 명시적으로 확인된 뒤에만** 수행한다.
- default vault나 CLI 반환값은 참고 정보일 뿐, 목적지 확정 근거가 아니다.

## 매핑

| repo guide | note pack |
|---|---|
| `README.md` | `gstack Guide/gstack Guide - MOC.md` |
| `01-learning-paths.md` | `gstack Guide/02 Learning Paths.md` |
| `02-glossary.md` | `gstack Guide/03 Glossary.md` |
| `01-installation-and-setup.md` | `gstack Guide/Deep Dives/Installation and setup.md` |
| `02-sprint-workflow.md` | `gstack Guide/Deep Dives/Sprint workflow.md` |
| `03-skill-catalog.md` | `gstack Guide/Deep Dives/Skill catalog.md` |
| `04-browser-and-architecture.md` | `gstack Guide/Deep Dives/Browser and architecture.md` |
| `05-build-test-and-publish.md` | `gstack Guide/Deep Dives/Build test and publish.md` |
| `06-glossary-and-reference.md` | `gstack Guide/Deep Dives/Glossary and reference.md` |
| `sections/01-overview.md` | `gstack Guide/01 Overview.md` |

## note map 의도

- MOC가 frontdoor 역할을 한다.
- Learning Paths / Glossary가 기본 3축이 된다.
- deep dive는 source-backed reading surface로 붙인다.
- References와 Workflows는 길찾기/증거를 붙잡아 둔다.
