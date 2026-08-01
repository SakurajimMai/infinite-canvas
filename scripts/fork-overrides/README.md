# Fork overrides

Used by `scripts/apply-fork-customizations.sh` after every upstream sync.

## Current customizations

1. **Delete** (always removed if upstream reintroduces them):
   - `web/src/components/layout/github-link.tsx`
   - `web/src/components/layout/version-release-modal.tsx`
   - `web/src/hooks/use-version-check.ts`
2. **Restore** `user-status-actions.tsx` from this directory (no version badge / GitHub icon).

## Editing the top bar

Change **both**:

- `web/src/components/layout/user-status-actions.tsx`
- `scripts/fork-overrides/user-status-actions.tsx`

Otherwise the next sync will overwrite the web file with the override copy.
