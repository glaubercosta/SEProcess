# Changelog

## [0.1.2] - 2026-02-21
### Added
- **Multi-Stack Starter Kits**: Added `scaffolds/` directory with `python` and `generic` boilerplate.
- **Continuous QA**: Added "Check on Change" directive to the Playbook.
- **Token Efficiency**: Added Token KPI reporting to Session DoD and PR checklists.

### Changed
- **Centralized Configuration**: All project metadata and adoption mode selection is now centralized in `playbook.md`.
- **Improved Bootstrap**: `install.ps1` now supports `-Stack` parameter to automatically deploy starter kits.
- Updated templates (`session-kickoff`, `implementation-plan`, `discovery-checklist`) for consistency.


## [0.1.1] - 2026-02-21
### Changed
- **Rebranding**: Renamed product from `engineering-playbook-core` to `SEprocess`.
- **Folder Structure**: Changed target project installation folder from `engineering-artifacts/` to `seprocess/`.
- Updated all templates, policies, and adapters to reflect the new naming and folder convention.
- Improved `playbook.md` with explicit references to ADR and Spike templates.

### Added
- Missing `docs/pilot-adoption-checklist.md` for guided project onboarding.
- Clarification in README regarding the process-only nature of the repository.

## v0.1.0 - 2026-02-21
- Initial standalone process product created from Versa engineering artifacts.
- Added discovery-first templates and quality-gate policy baseline.
- Added adapter scaffolds for Codex and generic LLM workflows.
- Added bootstrap installer for safe adoption in external projects.
- Normalized policies/templates to remove repo-specific bindings and keep portability.
- Added pilot adoption checklist for first-project operational rollout.
