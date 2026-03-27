# 05. 빌드, 테스트, 공개 배포

이 문서는 `gstack-guide` 자체를 검증 가능한 문서 저장소로 유지하기 위한 운영 절차를 정리합니다. 핵심 원칙은 **설치 성공 → Mermaid zero-skip 렌더 → git clean 상태 → Lore 커밋 → GitHub 공개 확인** 순서를 지키는 것입니다.

`gstack-guide`도 실행 중 `.omx/` 같은 런타임 상태 파일을 만들 수 있으므로, 이런 산출물은 커밋 대상에서 제외해야 합니다.

## 로컬 빌드/검증 명령

### 원본 `gstack`에서 확인해야 할 대표 명령

- `bun install` — 의존성 설치
- `bun test` — 기본 테스트 스위트
- `bun run build` — skill docs 재생성 + browse binary 빌드
- `bun run gen:skill-docs` — generated SKILL.md 재생성
- `bun run skill:check` — 스킬 상태 점검

### 이 가이드 저장소에서 반드시 확인할 명령

- `npm install`
- `npm run render:diagrams`
- `git status --short --branch`
- `git log --oneline -1`
- `git log -1 --format=%B`

## Mermaid 렌더 계약

이 저장소는 `package.json`의 `render:diagrams` 스크립트와 `tools/render_diagrams.mjs`를 통해 Markdown 내부의 Mermaid 블록을 SVG로 변환합니다.

검증 레인에서 정리한 핵심 게이트는 다음과 같습니다.

1. 렌더 전에 Mermaid fenced block이 실제로 존재하는지 확인한다.
2. `npm run render:diagrams`가 성공해야 한다.
3. 출력 로그의 `Skipped 0 unsupported diagrams.`를 확인한다.
4. `assets/diagrams/*.svg`가 생성되었는지 확인한다.
5. Markdown이 `![Diagram N](...)` 링크로 바뀌었는지 확인한다.

> 주의: 이 렌더러는 성공한 Mermaid 블록을 이미지 링크로 대체합니다. 즉, 렌더는 사실상 작성 단계의 마지막 게이트로 취급해야 합니다.

## 공개 배포 런북

1. `cd /home/terry/guide/gstack-guide`
2. 문서와 렌더링 도구를 준비한다.
3. `npm install`
4. `npm run render:diagrams`
5. `Skipped 0 unsupported diagrams.`를 확인한다.
6. `git status --short --branch`로 변경 범위를 확인한다.
7. `.omx/` 같은 런타임 상태 파일이 커밋 대상에 섞이지 않았는지 확인한다.
8. `git add .`
9. Lore 형식으로 커밋한다.
10. `gh repo create terry3838/gstack-guide --public --source . --remote origin`
11. `git push -u origin main`
12. `gh repo view terry3838/gstack-guide --web=false`
13. 마지막으로 `git status --short --branch`가 clean인지 재확인한다.

## Lore 커밋 확인 포인트

최초 공개 커밋과 이후 문서 릴리스 커밋 모두 다음을 충족해야 합니다.

- 첫 줄은 **왜** 이 변경이 필요한지 설명한다.
- 본문 뒤에 빈 줄을 두고 trailer를 추가한다.
- 최소한 `Constraint`, `Confidence`, `Scope-risk`, `Tested`/`Not-tested` 중 필요한 항목을 남긴다.
- diagram이나 publication 관련 작업이면 `Directive`나 `Rejected`로 향후 주의사항을 남긴다.

## 최종 증빙 번들

배포 전/후 보고에는 가능하면 아래를 함께 남깁니다.

- `find /home/terry/guide/gstack-guide -maxdepth 3 | sort`
- `npm install` 요약 출력
- `npm run render:diagrams` 출력
- `git status --short --branch`
- `git log --oneline -1`
- `git log -1 --format=%B`
- `git remote -v`
- `gh repo view terry3838/gstack-guide --web=false`
