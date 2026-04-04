# 05. 빌드, 테스트, 공개 배포

이 문서는 `gstack-guide` 자체를 최신 업스트림에 맞춰 유지하고 공개 가능한 문서 저장소로 검증하는 절차를 정리합니다. 핵심은 **사실값 확인 → 다이어그램 렌더 → 변경 범위 점검 → 커밋 규약 준수 → 공개 검증** 순서를 지키는 것입니다.

## 먼저 확인할 업스트림 사실값

문서를 갱신하기 전에 최소한 아래는 다시 확인합니다.

- `VERSION`
- `README.md`
- `BROWSER.md`
- `ARCHITECTURE.md`
- `CONTRIBUTING.md`
- `CHANGELOG.md`

현재 갱신 기준 업스트림 버전은 `0.15.1.0`입니다.

## 업스트림 gstack에서 자주 확인할 명령

- `bun install`
- `bun test`
- `bun run build`
- `bun run gen:skill-docs`
- `bun run gen:skill-docs --host codex`
- `bun run skill:check`
- `bun run test:e2e`
- `bun run test:evals`

가이드 저장소는 Bun 프로젝트가 아니므로 이 명령들은 설명 대상이지 이 저장소 자체의 실행 대상은 아닙니다.

## 이 가이드 저장소에서 반드시 확인할 명령

- `npm install`
- `npm run render:diagrams`
- `git status --short --branch`
- `git diff --stat`
- `git log --oneline -1`
- `git log -1 --format=%B`

또한 `.omx/` 같은 런타임 상태 파일이 커밋 대상에서 제외되는지 확인해야 합니다.

## Mermaid 렌더 계약

이 저장소는 `render:diagrams` 스크립트와 `tools/render_diagrams.mjs`를 통해 Markdown 안 Mermaid 블록을 SVG로 변환합니다.

검증 게이트는 다음과 같습니다.

1. 렌더 전에 Mermaid fenced block이 실제로 존재하는지 확인
2. `npm run render:diagrams` 성공
3. 로그에서 `Skipped 0 unsupported diagrams.` 확인
4. `assets/diagrams/*.svg` 생성 확인
5. Markdown이 `![Diagram N](...)` 링크를 가리키는지 점검

즉 렌더는 문서 작성의 마지막 단계에 가깝습니다.

## 문서 갱신 런북

1. 업스트림 `VERSION`, `README`, `BROWSER`, `ARCHITECTURE`, `CONTRIBUTING`, `CHANGELOG`를 읽는다.
2. 가이드 문서에서 stale statement를 수정한다.
3. `npm install`
4. `npm run render:diagrams`
5. `git status --short --branch`
6. `git diff --stat`
7. `.omx/` 등 런타임 산출물이 커밋 대상에 섞이지 않았는지 확인
8. Lore 형식으로 커밋
9. 원격 저장소에 push
10. GitHub에서 공개 상태와 기본 브랜치를 확인

## Lore 커밋 확인 포인트

이 작업공간의 커밋 메시지는 Lore protocol을 따릅니다.

- 첫 줄은 **왜** 이 변경이 필요한지 적는다
- 본문 뒤 빈 줄 다음에 trailer를 추가한다
- 문서 릴리스라면 `Constraint`, `Confidence`, `Scope-risk`, `Tested`, `Not-tested`를 우선 고려한다
- 향후 드리프트 방지 포인트가 있으면 `Directive`를 남긴다

## 공개 검증 체크리스트

- `git status --short --branch`가 예상 범위만 보여주는가
- 최신 가이드가 업스트림 버전과 핵심 기능을 잘 반영하는가
- 다이어그램 링크가 깨지지 않았는가
- README와 개별 챕터가 서로 모순되지 않는가
- 공개 저장소의 기본 브랜치와 remote가 올바른가

## 남겨두면 좋은 증빙

- `cat "$UPSTREAM_GSTACK_ROOT/VERSION"`
- `git diff --stat`
- `npm run render:diagrams`
- `git status --short --branch`
- `git log --oneline -1`
- `git log -1 --format=%B`
- `git remote -v`
- `gh repo view <owner>/<repo> --web=false`

이 문서는 가이드 저장소 운영 절차를 다룹니다. 빠른 재탐색용 용어와 업스트림 참조 위치는 [06-glossary-and-reference.md](06-glossary-and-reference.md)에서 정리합니다.
