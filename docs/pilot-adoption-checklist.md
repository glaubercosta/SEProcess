# Pilot Adoption Checklist - SEprocess

Use this checklist when adopting the **SEprocess** playbook in a new project for the first time.

## 1. Preparation
- [x] Ensure target project has a Git repository initialized.
- [x] Identify the **Adoption Mode**:
  - `Forward-Only + Frozen Baseline`: Legacy code is tolerated; new changes must comply.
  - `Full Immediate Enforcement`: All code must comply immediately.

## 2. Installation
- [x] Run the bootstrap script from the SEprocess repository (choose your stack: `python` or `generic`):
  ```powershell
  ./bootstrap/install.ps1 -TargetPath <path-to-your-project> -Stack python
  ```
- [x] Verify that a `seprocess/` folder was created in your project root containing:
  - `playbook.md`
  - `quality-gates-template.md`
  - All `.md` templates.

## 3. Configuration
- [x] Open `seprocess/playbook.md` and fill the **Project Binding** block. This is the **primary source of truth** for:
  - Project name.
  - Adoption mode (Forward-Only vs Full Enforcement).
  - Effective date.
- [x] Open `seprocess/quality-gates-template.md` and define the project-specific commands. These tools will enforce the mode selected in the playbook:
  - Tests.
  - Linting.
  - Duplication check (if available).
  - Contract validation.

## 4. First Session Protocol
- [x] Choose an adapter from `SEprocess/adapters/` (e.g., `codex` or `generic-llm`).
- [x] Copy the **Session Starter Prompt** and paste it into your AI Assistant's system context or initial message.
- [x] Start the first task by creating a session kickoff:
  - Use `seprocess/session-kickoff-template.md`.
  - **Define and initialize the development environment** (runtime, venv, scaffolding).
  - Follow the **Discovery-First** protocol.

## 5. Validation
- [ ] Create the first **Implementation Plan** for a non-trivial task using `seprocess/implementation-plan-template.md`.
- [ ] Verify that the development environment is active and following the defined scaffolding.
- [ ] Verify that all Quality Gates pass before the first merge after adoption.
- [ ] Update project `README.md` to reference the `seprocess/` directory as the process source of truth.
