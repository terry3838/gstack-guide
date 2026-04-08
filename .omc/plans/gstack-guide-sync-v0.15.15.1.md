# Plan: gstack-guide 지식베이스 최신화 (v0.15.15.1 동기화)

**Revision**: v2 (2026-04-07) — Architect/Critic 검토 반영

## Context

gstack 원본 저장소에 커밋 `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1)`이 추가되었으나 gstack-guide에 미반영 상태. 현재 가이드의 동기화 기준점은 `47b3ee2` (v0.15.1.0 기준 버전 표기)이며, 실제 origin은 `0.15.15.1`까지 진행됨.

### 변경 원본 요약

커밋 `6cc094c`는 3가지 버그 수정을 포함:
1. **pair-agent 터널 15초 후 끊김**: `BROWSE_PARENT_PID=0` 설정으로 pair-agent 세션에서 parent PID watchdog 비활성화
2. **`$B connect` "domains is not defined" 크래시**: connect 명령 JSON body에서 미정의 `domains` 변수 제거
3. **newtab 403 오류**: scoped token에서 newtab의 탭 소유권 체크 스킵

### ADR (Architectural Decision Record)

- **Decision**: Obsidian 파일은 완전 재생성하지 않고, 버전 문자열만 선택 갱신
- **Drivers**: build_obsidian_vaults.py 부재, 드리프트 누적 3+ 사이클, 변경 최소화 원칙
- **Alternatives considered**: (A) 완전 재생성 — 스크립트 없어 불가, (B) Obsidian 무시 — 버전 불일치 방치, (C) 수동 전체 동기화 — 범위 과다
- **Why chosen**: 버전 문자열만 갱신하면 정합성을 유지하면서 범위를 최소화할 수 있음
- **Consequences**: Obsidian 콘텐츠 드리프트는 해소되지 않음 (기술 부채로 기록)
- **Follow-ups**: build_obsidian_vaults.py 복원 또는 대체 스크립트 구축 시 완전 재생성 수행

## Work Objectives

pair-agent 터널 안정성 수정을 가이드에 반영하고, 동기화 메타데이터를 최신 상태로 갱신하며, 브라우저 아키텍처 문서에 pair-agent 관련 내용을 추가한다.

## Guardrails

### Must Have
- 모든 버전 참조가 `0.15.15.1`로 갱신 (root 문서 + obsidian 파일 포함)
- 동기화 메타데이터(SYNC-LOG, UPSTREAM-SNAPSHOT, README sync block, sections/01-overview)가 `6cc094c` 반영
- 한국어 문서 톤 유지, 기술 용어(pair-agent, BROWSE_PARENT_PID 등)는 원문 그대로
- `grep -r "0\.15\.1\.0" --include="*.md" | grep -v "6169273"` 결과가 0건 (obsidian 디렉터리 포함, `obsidian/.../01 Overview.md` line 33의 historical commit citation 제외)

### Must NOT Have
- 영어 전용 설명 추가 (가이드는 한국어)
- 원본 코드 복사/붙여넣기 (가이드는 개념과 사용법 설명)
- 불필요한 아키텍처 재설계 또는 문서 구조 변경
- Obsidian vault 완전 재생성 (스크립트 부재)

## Task Flow

### Step 1: 동기화 메타데이터 갱신 (4 files)

**대상 파일:**
- `SYNC-LOG.md`
- `UPSTREAM-SNAPSHOT.md`
- `sections/01-overview.md`
- `README.md` — **GUIDE_SYNC 블록만** (버전 줄은 Step 2에서 갱신)

**변경 내용:**
- `previous source sha` → `47b3ee2...`, `current source sha` → `6cc094c...`로 갱신
- 최근 upstream 커밋 목록에 `6cc094c fix: pair-agent tunnel drops after 15s (v0.15.15.1) (#868)` 추가
  - 주의: `#868` PR 번호는 SYNC-LOG 기입 전 upstream에서 검증할 것 (open-questions 참조)
- 변경 파일 샘플에 `browse/src/server.ts`, `browse/test/server-auth.test.ts` 추가
- impact labels에 `브라우저/pair-agent` 추가

**수락 기준:**
- 모든 4개 파일에서 latest synced commit이 `6cc094c`를 가리킴
- 커밋 목록이 최신순 정렬되어 있음
- README.md의 버전 줄(`업스트림 확인 버전`)은 이 단계에서 변경하지 않음

### Step 2: 버전 참조 갱신 — 0.15.1.0 → 0.15.15.1 (5 files)

**대상 파일:**
- `README.md` (line 9: `업스트림 확인 버전: 0.15.1.0`) — 버전 줄만
- `sections/05-build-test-and-publish.md` (line 16: `업스트림 버전은 0.15.1.0`)
- `sections/06-glossary-and-reference.md` (line 31: `업스트림 버전: 0.15.1.0`)
- `obsidian/gstack Guide/Deep Dives/Glossary and reference.md` (line 46: `업스트림 버전: \`0.15.1.0\``)
- `obsidian/gstack Guide/Deep Dives/Build test and publish.md` (line 31: `현재 갱신 기준 업스트림 버전은 \`0.15.1.0\`입니다.`)

**변경 내용:**
- 모든 `0.15.1.0` 버전 참조를 `0.15.15.1`로 갱신

**수락 기준:**
- `grep -rn "0\.15\.1\.0" --include="*.md" . | grep -v "6169273"` 결과가 0건 (historical commit citation 제외)
- `grep -rn "0\.15\.15\.1"` 으로 5곳 이상 확인
- README.md는 Step 1(GUIDE_SYNC 블록)과 Step 2(버전 줄)에서 각각 다른 섹션만 수정됨

### Step 3: 콘텐츠 추가 (2 files)

**대상 파일:**
- `sections/04-browser-and-architecture.md`
- `sections/06-glossary-and-reference.md`

**변경 내용:**

1. `04-browser-and-architecture.md` — "2. 상태 파일과 보안 모델" 섹션의 불릿 리스트에 단일 항목 추가:
   ```
   - pair-agent 세션에서는 parent PID 감시를 비활성화하여 터널이 CLI 종료 후에도 유지
   ```

2. `06-glossary-and-reference.md` — 용어 목록에 추가:
   ```
   BROWSE_PARENT_PID — daemon이 부모 프로세스 종료를 감지하여 자동 종료하는 환경 변수. pair-agent는 이를 `0`으로 설정하여 비활성화
   ```

**수락 기준:**
- `04-browser-and-architecture.md`에 pair-agent 관련 불릿이 1개 추가됨
- `06-glossary-and-reference.md`에 `BROWSE_PARENT_PID` 용어가 알파벳순 올바른 위치에 추가됨
- 기존 문서 흐름과 자연스럽게 어울림
- 가이드 수준의 설명 (코드 레벨 아님)

### Step 4: (건너뜀) Obsidian 완전 재생성

**사유**: `build_obsidian_vaults.py` 스크립트가 저장소에 존재하지 않음. 버전 문자열은 Step 2에서 이미 갱신됨.

**기술 부채 기록**: Obsidian 콘텐츠 드리프트가 3+ 동기화 사이클 누적됨. `.omc/plans/open-questions.md`에 기록.

### Step 5: 최종 검증 및 커밋

**검증 항목:**
1. `grep -rn "0\.15\.1\.0" . --include="*.md" | grep -v "6169273"` — 잔존 0건 확인 (obsidian 포함, historical commit citation 제외)
2. `git diff --stat` — 변경 범위가 예상(~7 files)과 일치하는지 확인
3. 다이어그램 렌더링 **불필요** — 이번 변경에 다이어그램 콘텐츠 변경 없음
4. 한국어 문서 품질 점검: 어색한 번역이나 톤 불일치 없음

**커밋 메시지 형식:**
```
docs: sync gstack-guide with gstack @ 6cc094c
```

**수락 기준:**
- `git status`에 예상 외 파일 없음
- `grep -rn "0\.15\.1\.0" . --include="*.md" | grep -v "6169273"` 결과 0건 (historical commit citation 제외)
- 커밋 메시지가 기존 커밋 스타일(`docs: sync gstack-guide with gstack @ {sha}`)과 일치

## Success Criteria

1. gstack-guide의 모든 동기화 메타데이터가 커밋 `6cc094c`를 가리킴
2. 버전 참조가 **root 문서 + obsidian 파일 포함** 모두 `0.15.15.1`로 갱신됨
3. pair-agent 관련 내용이 `04-browser-and-architecture.md`에 단일 불릿으로 추가됨
4. `BROWSE_PARENT_PID` 용어가 `06-glossary-and-reference.md`에 추가됨
5. `grep -rn "0\.15\.1\.0" . --include="*.md" | grep -v "6169273"` 결과 0건 (historical commit citation 제외)
6. 기존 커밋 컨벤션을 따르는 커밋 생성

## Estimated Scope

- **파일 수**: ~7 files (root 5 + obsidian 2)
- **복잡도**: LOW — 메타데이터 갱신 위주, 신규 콘텐츠는 Step 3의 불릿 1개 + 용어 1개
- **위험 요소**: `#868` PR 번호 검증 필요 (open-questions 참조)
