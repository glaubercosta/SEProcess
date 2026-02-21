# Pilot Adoption Checklist - SEprocess

Use this checklist when adopting the **SEprocess** playbook in a new project for the first time.

## 1. Preparation
- [ ] Ensure target project has a Git repository initialized.
- [ ] Identify the **Adoption Mode**:
  - `Forward-Only + Frozen Baseline`: Legacy code is tolerated; new changes must comply.
  - `Full Immediate Enforcement`: All code must comply immediately.

## 2. Installation
- [ ] Run the bootstrap script from the SEprocess repository:
  ```powershell
  ./bootstrap/install.ps1 -TargetPath <path-to-your-project>
  ```
- [ ] Verify that a `seprocess/` folder was created in your project root containing:
  - `playbook.md`
  - `quality-gates-template.md`
  - All `.md` templates.

## 3. Configuration
- [ ] Open `seprocess/playbook.md` and fill the **Project Binding** block:
  - Project name.
  - Adoption mode.
  - Effective date.
- [ ] Open `seprocess/quality-gates-template.md` and define the project-specific commands for:
  - Tests.
  - Linting.
  - Duplication check (if available).
  - Contract validation.

## 4. First Session Protocol
- [ ] Choose an adapter from `SEprocess/adapters/` (e.g., `codex` or `generic-llm`).
- [ ] Copy the **Session Starter Prompt** and paste it into your AI Assistant's system context or initial message.
- [ ] Start the first task by creating a session kickoff:
  - Use `seprocess/session-kickoff-template.md`.
  - Follow the **Discovery-First** protocol.

## 5. Validation
- [ ] Create the first **Implementation Plan** for a non-trivial task using `seprocess/implementation-plan-template.md`.
- [ ] Verify that all Quality Gates pass before the first merge after adoption.
- [ ] Update project `README.md` to reference the `seprocess/` directory as the process source of truth.
