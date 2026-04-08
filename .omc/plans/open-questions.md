## gstack-guide-sync-v0.15.15.1 - 2026-04-07
- [ ] `#868` PR 번호 검증 — SYNC-LOG.md에 기입하기 전 upstream 저장소에서 실제 PR 번호가 `#868`인지 확인 필요. 잘못된 PR 번호는 추적성을 훼손함
- [ ] Obsidian vault 콘텐츠 드리프트 누적 (3+ 사이클) — `build_obsidian_vaults.py` 부재로 Obsidian 파일은 버전 문자열만 갱신하고 콘텐츠는 미동기화. 스크립트 복원 또는 대체 방안 마련 시 완전 재생성 필요
- [ ] `build_obsidian_vaults.py` 스크립트 위치와 실행 가능 여부 확인 필요 — obsidian vault 자동 생성이 가능한지, 수동 반영이 필요한지 결정에 영향
