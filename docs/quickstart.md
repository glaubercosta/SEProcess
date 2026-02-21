# Quickstart

## 1. Install artifacts into a target project
```powershell
./bootstrap/install.ps1 -TargetPath C:\path\to\project
```

## 2. Select adapter
- Codex: `adapters/codex/SESSION_STARTER.md`
- Generic LLM: `adapters/generic-llm/SESSION_STARTER.md`

## 3. Start workflow
- Fill `engineering-artifacts/session-kickoff-template.md`
- Fill `engineering-artifacts/discovery-checklist-template.md`
- Create `engineering-artifacts/implementation-plan-sprint-XXX-<topic>.md`

## 4. Validate with gates
- Apply `engineering-artifacts/quality-gates-template.md`
- Use `engineering-artifacts/pr-checklist-template.md` in each PR

## 5. Pilot adoption
- Execute `docs/pilot-adoption-checklist.md` from this repository in the first target project adoption
- Capture gaps and feed updates back to `CHANGELOG.md`
