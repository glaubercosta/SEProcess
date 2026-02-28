# Quickstart

## 1. Install artifacts into a target project
```powershell
./bootstrap/install.ps1 -TargetPath C:\path\to\project
# Optional smoke test right after install:
./bootstrap/install.ps1 -TargetPath C:\path\to\project -RunChecks
```

## 2. Select adapter
- Codex: `adapters/codex/SESSION_STARTER.md`
- Generic LLM: `adapters/generic-llm/SESSION_STARTER.md`

## 3. Start workflow
- Create work files **from** templates (do not edit template files directly):
  - Create `seprocess/sessions/session-kickoff-YYYYMMDD-<topic>.md` from `seprocess/session-kickoff-template.md`
  - Create `seprocess/sessions/discovery-checklist-YYYYMMDD-<topic>.md` from `seprocess/discovery-checklist-template.md`
  - Create `seprocess/sessions/implementation-plan-sprint-XXX-<topic>.md` from `seprocess/implementation-plan-template.md`

## 4. Validate with gates
- Apply `seprocess/quality-gates-template.md`
- Use `seprocess/pr-checklist-template.md` in each PR
- Run template hygiene check for finalized session artifacts:
  - `python seprocess/scaffold/check-template-hygiene.py`
  - Optional (PowerShell): `./seprocess/scaffold/check-template-hygiene.ps1`

## 5. Pilot adoption
- Execute `docs/pilot-adoption-checklist.md` from this repository in the first target project adoption
- Capture gaps and feed updates back to `CHANGELOG.md`
