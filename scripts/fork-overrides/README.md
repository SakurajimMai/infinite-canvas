# Fork overrides

Used by `scripts/apply-fork-customizations.sh` after every upstream sync.

## Current customizations

1. **Delete** (always removed if upstream reintroduces them):
   - `web/src/components/layout/github-link.tsx`
   - `web/src/components/layout/version-release-modal.tsx`
   - `web/src/hooks/use-version-check.ts`
2. **Restore** from this directory:
   - `user-status-actions.tsx` — no version badge / GitHub / docs icon
   - `canvas-top-bar.tsx` — no docs menu item
   - `env.ts` — no `DOCS_URL` / `docs.canvas.best`

## Editing these files

Change **both** the live path under `web/` and the copy here:

| Live path | Override |
| --- | --- |
| `web/src/components/layout/user-status-actions.tsx` | `user-status-actions.tsx` |
| `web/src/components/canvas/canvas-top-bar.tsx` | `canvas-top-bar.tsx` |
| `web/src/constant/env.ts` | `env.ts` |

Otherwise the next sync will overwrite the web file with the override copy.
