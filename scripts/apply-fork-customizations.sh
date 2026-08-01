#!/usr/bin/env bash
# Re-apply SakurajimMai fork customizations after upstream merge.
# - Remove version-release UI + GitHub link components/hooks
# - Restore customized user-status-actions (no version / GitHub buttons)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

REMOVE_PATHS=(
  "web/src/components/layout/github-link.tsx"
  "web/src/components/layout/version-release-modal.tsx"
  "web/src/hooks/use-version-check.ts"
)

for path in "${REMOVE_PATHS[@]}"; do
  if [[ -e "$path" ]]; then
    rm -f "$path"
    echo "removed: $path"
  fi
done

OVERRIDE="scripts/fork-overrides/user-status-actions.tsx"
TARGET="web/src/components/layout/user-status-actions.tsx"
if [[ -f "$OVERRIDE" ]]; then
  mkdir -p "$(dirname "$TARGET")"
  cp "$OVERRIDE" "$TARGET"
  echo "restored: $TARGET from fork override"
else
  echo "warning: missing override $OVERRIDE" >&2
fi

echo "fork customizations applied"
