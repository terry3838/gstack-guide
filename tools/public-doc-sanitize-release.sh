#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SANITIZER="/home/terry/.codex/skills/public-doc-sanitizer/scripts/sanitize_public_repo.py"

message="chore: sanitize public docs and prepare public publish"
remote="origin"
branch=""
dry_run=0
no_push=0
allow_empty=0
skip_commit=0
include_hidden=1
omc_note=0

exts=(
  ".md"
  ".txt"
  ".yml"
  ".yaml"
  ".toml"
  ".json"
  ".html"
  ".js"
  ".ts"
  ".tsx"
)

usage() {
  cat <<'EOF'
Usage: tools/public-doc-sanitize-release.sh [options]

  --message "msg"     Commit message (default: chore: sanitize public docs and prepare public publish)
  --remote <name>      Git remote name (default: origin)
  --branch <name>      Push branch (default: current branch)
  --dry-run            Run sanitizer in dry-run mode only
  --no-push            Skip git push
  --allow-empty        Allow empty commit when no file changes
  --skip-commit        Skip commit step
  --no-hidden          Do not scan hidden files
  --omc-note           Print recommended OMC interop command
  -h, --help           Show this help

Behavior:
  1) run public-doc-sanitizer on common text/docs extensions
  2) ensure .gitignore contains .omx/
  3) remove .omx/
  4) optional commit + push
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --message)
      message="$2"; shift 2;;
    --remote)
      remote="$2"; shift 2;;
    --branch)
      branch="$2"; shift 2;;
    --dry-run)
      dry_run=1; shift;;
    --no-push)
      no_push=1; shift;;
    --allow-empty)
      allow_empty=1; shift;;
    --skip-commit)
      skip_commit=1; shift;;
    --no-hidden)
      include_hidden=0; shift;;
    --omc-note)
      omc_note=1; shift;;
    -h|--help)
      usage; exit 0;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1;;
  esac
done

if [[ ! -f "$SANITIZER" ]]; then
  echo "Sanitizer script not found: $SANITIZER" >&2
  exit 1
fi

cmd=(python3 "$SANITIZER" "$ROOT_DIR")
for ext in "${exts[@]}"; do
  cmd+=(--ext "$ext")
done
cmd+=(--update-gitignore --remove-omx --redact-pii)

if [[ "$dry_run" -eq 1 ]]; then
  cmd+=(--dry-run)
fi

if [[ "$include_hidden" -eq 1 ]]; then
  cmd+=(--include-hidden)
fi

"${cmd[@]}"

if [[ "$dry_run" -eq 1 ]]; then
  echo "Dry-run completed. Remove --dry-run to apply and proceed to commit/push."
  exit 0
fi

if [[ "$skip_commit" -eq 0 ]]; then
  if [[ -n "$(git -C "$ROOT_DIR" status --short --untracked-files=no)" ]]; then
    git -C "$ROOT_DIR" add -A
    git -C "$ROOT_DIR" commit -m "$message"
  elif [[ "$allow_empty" -eq 1 ]]; then
    git -C "$ROOT_DIR" commit --allow-empty -m "$message"
  else
    echo "No tracked changes to commit. Use --allow-empty if you want a marker commit."
  fi

  if [[ "$no_push" -eq 0 ]]; then
    if [[ -z "$branch" ]]; then
      branch="$(git -C "$ROOT_DIR" rev-parse --abbrev-ref HEAD)"
    fi
    git -C "$ROOT_DIR" push "$remote" "$branch"
  fi
fi

if [[ "$omc_note" -eq 1 ]]; then
  if command -v omc >/dev/null 2>&1; then
    echo "OMC helper: omc interop"
  else
    echo "OMC not installed in PATH"
  fi
fi
