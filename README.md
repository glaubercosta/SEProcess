# Engineering Playbook Core

Portable, versioned process product for software delivery with discovery-first workflow, quality gates, and reusable templates.

## Version
Current version: `v0.1.0`

## Repository Structure
- `core/templates`: reusable project templates.
- `core/policies`: playbook and quality-gate standards.
- `adapters`: tool/assistant-specific starter prompts and usage mapping.
- `bootstrap`: scripts to install/sync artifacts into target projects.
- `docs`: usage and migration docs.

## Quick Start
1. Choose your adapter (`adapters/codex` or `adapters/generic-llm`).
2. Run bootstrap script from this repo:
   - PowerShell: `./bootstrap/install.ps1 -TargetPath <project-path>`
3. In target project, start sessions with:
   - `engineering-artifacts/session-kickoff-template.md`
   - `engineering-artifacts/discovery-checklist-template.md`
4. For first adoption, execute:
   - `docs/pilot-adoption-checklist.md`

## Included Artifacts
- `implementation-plan-template.md`
- `pr-checklist-template.md`
- `spike-header-template.md`
- `adr-template.md`
- `session-kickoff-template.md`
- `discovery-checklist-template.md`
- `playbook.md`
- `quality-gates-template.md`

## Release Discipline
- Semantic versioning for process changes.
- Changelog required for each release.
- Adapter compatibility updates must be documented.

## GitHub Readiness Checklist
- Configure remote before first push: `git remote add origin <repo-url>`
- Ensure default branch policy is defined (`main` or `master`) and protected in GitHub settings.
- Keep versions synchronized across `README.md`, `CHANGELOG.md`, and `playbook.json`.
- Publish tags for stable playbook versions (`vX.Y.Z`).
