# Migration Guide

## Goal
Migrate non-versioned local artifacts to the standalone `engineering-playbook-core` model.

## Steps
1. Keep this repo as source of truth for process artifacts.
2. Install artifacts into each project via `bootstrap/install.ps1`.
3. Keep project-specific overrides minimal and documented.
4. Track process changes in `CHANGELOG.md` and bump `playbook.json` version.
5. Run `docs/pilot-adoption-checklist.md` in the first project before scaling rollout.

## Compatibility Rule
If an adapter changes required behavior, update corresponding `adapters/*/SESSION_STARTER.md` and document the impact.
