# SEprocess

Portable, versioned process product for software delivery with discovery-first workflow, quality gates, and reusable templates.
**Important**: This is a process-only repository. It should not contain software implementation code with other objectives.

## Version
Current version: `v0.2.0`

## Repository Structure
- `core/templates`: reusable project templates.
- `core/policies`: playbook and quality-gate standards.
- `adapters`: tool/assistant-specific starter prompts and usage mapping.
- `bootstrap`: scripts to install/sync artifacts into target projects.
- `docs`: usage and migration docs.
- `feedbacks`: repository of process improvement suggestions.

## Quick Start
1. Choose your adapter within your project (`seprocess/adapters/codex` or `seprocess/adapters/generic-llm`).
2. Paste the **Session Starter Prompt** into your assistant's context.
   - PowerShell: `./bootstrap/install.ps1 -TargetPath <project-path>`
3. In target project, start sessions with templates from the `seprocess/` folder:
   - `seprocess/session-kickoff-template.md`
   - `seprocess/discovery-checklist-template.md`
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
- SemVer is the official versioning policy for SEprocess (`MAJOR.MINOR.PATCH`).
- README/docs are updated when behavior/config/workflow changes.
- **Continuous Improvement**: feedback or suggestions for process improvement are recorded in `feedbacks/improvement-suggestions.md`.
- Contract and telemetry requirements are met for changed critical paths.
- Adapter compatibility updates must be documented.

## GitHub Readiness Checklist
- Configure remote before first push: `git remote add origin <repo-url>`
- Ensure default branch policy is defined (`main` or `master`) and protected in GitHub settings.
- Keep versions synchronized across `README.md`, `CHANGELOG.md`, and `playbook.json`.
- Publish tags for stable playbook versions (`vX.Y.Z`).
