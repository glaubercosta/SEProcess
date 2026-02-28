# Changelog

## Versioning Policy (SemVer)
SEprocess follows `MAJOR.MINOR.PATCH`:
- **MAJOR**: incompatible process changes (breaking policy/gate/template behavior requiring migration).
- **MINOR**: backward-compatible process capabilities (new gates, templates, adapters, or workflow steps).
- **PATCH**: backward-compatible fixes, clarifications, typo/docs-only corrections, and non-breaking script adjustments.

Decision rule:
- If adoption in an existing consumer project requires changing established behavior, prefer **MAJOR**.
- If it adds optional or compatible behavior, use **MINOR**.
- If it only fixes/clarifies existing behavior without expanding scope, use **PATCH**.

## [0.2.0] - 2026-02-28
### Added
- **Template Hygiene Enforcement**: Added cross-platform checker (`check-template-hygiene.py`) in scaffold templates and integrated it into `.pre-commit-config` template.
- **Artifact Existence Gate**: Added explicit gate to ensure kickoff-declared deliverables exist or are descoped with rationale.
- **Session Close Evidence Standard**: Added minimum evidence block (tests, lint/typecheck, gate summary, tag/commit, deliverable status).
- **Bootstrap Smoke Checks**: `install.ps1` now supports optional `-RunChecks` for post-install validation.

### Changed
- **Template Instantiation Rule**: Standardized `TEMPLATE_ONLY` behavior across playbook, templates, adapters, and onboarding docs.
- **README Drift Controls**: Expanded PR checklist and adoption docs with explicit README drift confirmations.
- **Versioning Policy**: Adopted SemVer as official process versioning strategy.

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
