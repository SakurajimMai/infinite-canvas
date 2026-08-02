#!/usr/bin/env bash
# Re-apply SakurajimMai fork customizations after upstream merge.
# - Remove version-release UI + GitHub link components/hooks
# - Restore customized toolbar / env (no version, GitHub, or docs links)
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

restore_override() {
  local override="$1"
  local target="$2"
  if [[ -f "$override" ]]; then
    mkdir -p "$(dirname "$target")"
    cp "$override" "$target"
    echo "restored: $target from fork override"
  else
    echo "warning: missing override $override" >&2
  fi
}

restore_override "scripts/fork-overrides/user-status-actions.tsx" "web/src/components/layout/user-status-actions.tsx"
restore_override "scripts/fork-overrides/canvas-top-bar.tsx" "web/src/components/canvas/canvas-top-bar.tsx"
restore_override "scripts/fork-overrides/env.ts" "web/src/constant/env.ts"

echo "fork customizations applied"
