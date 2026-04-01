# 01. 설치와 초기 설정

최신 `gstack` 설치에서 먼저 결정할 것은 "어디에 둘까"와 "어느 호스트로 쓸까"입니다. 현재 릴리스는 Claude Code만이 아니라 Codex, Gemini CLI, Cursor, Factory Droid까지 염두에 둡니다. 따라서 설치 위치와 host mode가 곧 운영 방식이 됩니다.

## 요구 사항

업스트림 README와 CONTRIBUTING 기준 최소 요구 사항은 다음과 같습니다.

- `Git`
- `Bun` 1.x 이상
- Claude Code 또는 SKILL.md 호환 호스트
- Windows에서는 `Node.js`

브라우저 바이너리, generated docs, 테스트 실행이 모두 Bun 기반이므로 Claude가 아니어도 `Bun`은 사실상 필수입니다.

## 설치 모드 선택

| 모드 | 언제 쓰나 | 핵심 장점 | 주의점 |
|---|---|---|---|
| Claude 전역 설치 | 혼자 가장 빨리 시작하고 싶을 때 | `~/.claude/skills/gstack` 한 번 설치로 여러 프로젝트에서 사용 가능 | 팀과 자동 공유되지는 않음 |
| Claude repo-local 설치 | 프로젝트와 함께 gstack를 배포하고 싶을 때 | 저장소 clone만으로 동일 스킬 묶음을 공유 가능 | vendored copy를 직접 업데이트해야 함 |
| Codex/Gemini/Cursor repo-local 설치 | 비-Claude 호스트에서 프로젝트 공용으로 쓸 때 | `.agents/skills/gstack` 기준 discovery 완료 | 호스트별 출력 차이를 이해해야 함 |
| Codex 사용자 전역 설치 | Codex를 여러 저장소에서 개인 도구처럼 쓸 때 | `~/.codex/skills/gstack` 런타임 루트 고정 | source checkout과 runtime root가 분리됨 |
| Factory Droid 설치 | Factory 환경에서 skill bundles를 쓰고 싶을 때 | `.factory/skills/` 경로로 호스트 친화적 설치 | 민감 스킬은 auto-invocation 억제 정책을 따름 |
| 개발 모드 | gstack 자체를 수정/기여할 때 | working tree 수정이 바로 반영됨 | 빌드, 양쪽 호스트 출력, symlink 흐름을 알아야 함 |

![Diagram 1](assets/diagrams/01-installation-and-setup__diagram_1.svg)

## 1. Claude Code 전역 설치

가장 빠른 출발점입니다.

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
cd ~/.claude/skills/gstack
./setup
```

설치가 끝나면 `CLAUDE.md`에 `gstack` 섹션을 추가해 `/browse`를 웹 탐색 기본값으로 두고, 주요 스킬 목록을 명시하는 흐름이 현재 README 기준 권장됩니다. 핵심은 단순 설치보다 "호스트가 gstack 스킬을 기본 도구로 인식하게 만드는 것"입니다.

## 2. Claude 프로젝트 벤더링

프로젝트와 함께 배포하려면 전역 설치본을 저장소 안으로 복사합니다.

```bash
cp -Rf ~/.claude/skills/gstack .claude/skills/gstack
rm -rf .claude/skills/gstack/.git
cd .claude/skills/gstack
./setup
```

이 방식의 의미는 submodule이 아니라 **실파일을 프로젝트에 포함**한다는 점입니다. 팀원이 clone만 해도 같은 스킬 묶음을 받습니다. 대신 업그레이드는 저장소 변경으로 추적됩니다.

## 3. Codex / Gemini CLI / Cursor 설치

최신 README는 SKILL.md 호환 호스트를 `Codex-compatible hosts`로 묶어 설명합니다.

### repo-local 설치

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git .agents/skills/gstack
cd .agents/skills/gstack
./setup --host codex
```

이 경로에서 `setup --host codex`를 실행하면 generated Codex skills가 같은 저장소 안 `.agents/skills/` 쪽에 설치되고, `~/.codex/skills`에는 쓰지 않습니다. 팀 저장소에서 discovery를 끝내고 싶을 때 맞는 모드입니다.

### 사용자 전역 설치

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack
./setup --host codex
```

이 경우 런타임 루트는 `~/.codex/skills/gstack` 기준으로 잡히고, generated skills가 상위 레벨에 링크됩니다. 목적은 source checkout과 runtime root를 분리해 중복 discovery를 막는 것입니다.

### 자동 감지 설치

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack
./setup --host auto
```

여러 호스트가 섞여 있거나 현재 환경을 자동 판단시키고 싶을 때 쓰는 모드입니다.

### 현재 릴리스 기준 유의점

- Codex 출력은 `.agents/skills/gstack-*` 구조를 사용합니다.
- Codex 계열에서는 hook 기반 safety enforcement 대신 inline advisory prose가 쓰입니다.
- 최신 README 기준 모든 31개 스킬이 지원 호스트 전반에서 동작하도록 관리됩니다.

## 4. Factory Droid

최신 릴리스는 Factory Droid도 공식 설치 대상으로 다룹니다.

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/gstack
cd ~/gstack
./setup --host factory
```

설치 위치는 `~/.factory/skills/gstack-*` 계열입니다. `ship`, `land-and-deploy`, `guard` 같은 민감 스킬은 `disable-model-invocation: true` 정책으로 자동 호출을 막습니다.

## 5. 개발 모드

`gstack` 자체를 수정하려면 CONTRIBUTING의 dev mode가 기준입니다.

```bash
git clone <repo> && cd gstack
bun install
bin/dev-setup
```

개발 모드의 핵심은 symlink입니다. Claude 쪽은 `.claude/skills/`, Codex 쪽은 `.agents/skills/`에 현재 working tree를 연결해 수정이 바로 반영되게 합니다. 작업이 끝나면:

```bash
bin/dev-teardown
```

## 설치 직후 확인할 것

1. 호스트가 스킬을 실제로 discovery 하는지
2. `browse` 바이너리가 빌드되었는지
3. `bun run build`가 성공하는지
4. `bun test`가 통과하는지
5. Codex 호스트라면 `bun run gen:skill-docs --host codex`가 정상 동작하는지
6. 브라우저/쿠키/Chrome 확장 기능이 필요한 경우 `/connect-chrome` 또는 관련 명령이 노출되는지

### 업스트림 저장소 기준 대표 명령

```bash
bun install
bun test
bun run build
bun run gen:skill-docs
bun run gen:skill-docs --host codex
bun run skill:check
```

## 설치 후 가장 먼저 써볼 흐름

최신 README가 여전히 권하는 최소 진입 순서는 다음입니다.

1. `/office-hours`
2. `/plan-ceo-review`
3. `/review`
4. `/qa`

이 순서가 중요한 이유는 `gstack`의 가치가 개별 명령보다 **스프린트 전체 연결성**에 있기 때문입니다.

## 설치 문제 해결

- 스킬이 안 보이면: 설치 경로에서 `./setup`을 다시 실행합니다.
- Codex 계열에서 중복으로 보이면: repo-local 설치와 사용자 전역 설치가 동시에 살아 있는지 확인합니다.
- `/browse`나 `/connect-chrome`가 실패하면: `bun install && bun run build`부터 다시 확인합니다.
- generated docs가 이상하면: `bun run gen:skill-docs`와 `bun run gen:skill-docs --host codex`를 함께 다시 돌립니다.
- 벤더드 copy가 오래됐으면: 최신 릴리스 기준 `/gstack-upgrade`가 글로벌/벤더드 양쪽 상태를 함께 점검하는 기본 수단입니다.

다음 문서에서는 설치 후 실제로 어떤 순서로 스킬을 갈아타야 하는지 설명합니다. [02-sprint-workflow.md](02-sprint-workflow.md)를 읽으세요.
