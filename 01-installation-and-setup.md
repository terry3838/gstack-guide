# 01. 설치와 초기 설정

`gstack`는 "어디에 설치하느냐"에 따라 사용하는 감각이 달라집니다. 먼저 글로벌로 한번 설치해 개인 도구처럼 쓸지, 특정 저장소 안에 vendored copy로 넣어 팀과 함께 쓸지, 아니면 Codex/Gemini/Cursor 같은 다른 호스트에 repo-local로 붙일지 결정해야 합니다.

## 요구 사항

원본 README 기준 최소 요구 사항은 다음입니다.

- `Git`
- `Bun` 1.0 이상
- `Claude Code`
- Windows 환경에서는 `Node.js`

Codex 계열 호스트를 쓰더라도 `Bun`과 `Git`은 사실상 필수입니다. build, generated docs, browse binary 생성이 모두 여기에 걸려 있습니다.

## 설치 모드 선택

| 모드 | 언제 쓰나 | 장점 | 주의점 |
|---|---|---|---|
| 사용자 전역 설치 | 혼자 먼저 써보고 싶을 때 | 한번 설치하면 여러 저장소에서 재사용 가능 | 팀원과 환경이 공유되지 않음 |
| repo-local 설치 | 특정 프로젝트에 `gstack`를 같이 배포하고 싶을 때 | 저장소에 함께 들어가서 clone만으로 재현 가능 | 프로젝트 안에 vendored 파일이 들어감 |
| Codex/Gemini/Cursor용 repo-local 설치 | Claude 외 호스트에서 팀 공용 스킬로 쓰고 싶을 때 | `.agents/skills/gstack` 기준으로 호스트 친화적 | 호스트별 동작 차이를 이해해야 함 |
| 개발 모드 | `gstack` 자체를 수정/기여할 때 | 수정 즉시 테스트 가능 | dev setup/teardown 흐름을 알아야 함 |

![Diagram 1](assets/diagrams/01-installation-and-setup__diagram_1.svg)

## 1. Claude Code 전역 설치

가장 빠른 시작점입니다. 원본 README가 제시하는 흐름은 다음과 같습니다.

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
cd ~/.claude/skills/gstack
./setup
```

설치 후에는 `CLAUDE.md`에 `gstack` 섹션을 추가해 `/browse`를 웹 탐색 기본값으로 쓰고, 제공 스킬 목록을 명시하는 방식이 권장됩니다. 핵심은 설치 자체보다 "Claude가 이 스킬 묶음을 신뢰하고 호출할 수 있게 문맥을 심는 것"입니다.

## 2. 저장소 내부 설치

프로젝트와 함께 배포하고 싶다면 전역 경로 대신 저장소 안에 복사합니다.

```bash
cp -Rf ~/.claude/skills/gstack .claude/skills/gstack
rm -rf .claude/skills/gstack/.git
cd .claude/skills/gstack
./setup
```

이 방식의 장점은 submodule 없이 실파일이 들어가므로 `git clone`만으로 팀원이 같은 스킬 집합을 받을 수 있다는 점입니다. 반대로 업데이트는 저장소 커밋을 통해 직접 관리해야 합니다.

## 3. Codex / Gemini / Cursor 설치

원본 README는 SKILL.md 호환 호스트라면 `.agents/skills/` 아래에 설치하는 경로를 제시합니다.

### 저장소 단위 설치

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git .agents/skills/gstack
cd .agents/skills/gstack
./setup --host codex
```

이 경로에서 `setup --host codex`를 실행하면 generated Codex skill은 같은 저장소의 `.agents/skills/` 옆에 만들어지고, `~/.codex/skills`에는 쓰지 않습니다. 팀 저장소 안에서 discovery를 끝내고 싶을 때 맞는 모드입니다.

### 사용자 전역 설치

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack
./setup --host codex
```

사용자 전역 설치일 때만 `setup --host codex`가 런타임 루트를 `~/.codex/skills/gstack` 기준으로 만들고, generated skill을 상위에 링크합니다. 목적은 source checkout과 runtime root를 분리해 중복 discovery를 피하고 런타임 위치를 안정적으로 고정하는 것입니다.

## 4. 개발 모드

`gstack` 자체를 수정하고 테스트하고 싶다면 `CONTRIBUTING.md`의 dev mode 흐름을 따르면 됩니다.

```bash
git clone <repo> && cd gstack
bun install
bin/dev-setup
```

이 모드는 working tree를 `.claude/skills/` 쪽에 symlink해서, `SKILL.md`나 템플릿을 고친 즉시 Claude가 새 내용을 읽게 만드는 방식입니다. 수정 후 돌아갈 때는:

```bash
bin/dev-teardown
```

## 초기 검증 체크리스트

설치 후에는 다음을 바로 확인하는 편이 좋습니다.

1. 스킬 목록이 실제로 로드되는지
2. `browse`가 빌드됐는지
3. `bun run build`가 성공하는지
4. `bun test`가 기본적으로 통과하는지
5. 브라우저/쿠키/확장 기능이 필요한 경우 관련 명령이 노출되는지

### 원본 저장소 기준 대표 명령

```bash
bun install
bun test
bun run build
bun run gen:skill-docs
bun run skill:check
```

## 설치 후 가장 먼저 써볼 명령

원본 README가 권하는 진입 순서는 다음과 같습니다.

1. `/office-hours`
2. `/plan-ceo-review`
3. `/review`
4. `/qa`

이 순서를 추천하는 이유는 `gstack`의 핵심이 브라우저 기능 하나가 아니라, 문제 재정의부터 검증까지 이어지는 루프 전체이기 때문입니다.

## 설치 문제 해결

- 스킬이 안 보이면: 설치 경로에서 `./setup`을 다시 실행합니다.
- `/browse`가 실패하면: `bun install && bun run build`를 먼저 확인합니다.
- Codex 계열 호스트에서 혼란스러우면: 전역 설치와 repo-local 설치 중 하나만 남기고 중복 discovery를 줄입니다.
- generated 문서가 이상하면: `bun run gen:skill-docs`와 `bun run gen:skill-docs --host codex`를 다시 돌립니다.

다음 문서에서는 설치한 뒤 실제로 어떤 순서로 스킬을 써야 하는지 설명합니다. [02-sprint-workflow.md](02-sprint-workflow.md)를 읽으세요.
