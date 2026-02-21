# Quickstart

## 1. Install artifacts into a target project
```powershell
./bootstrap/install.ps1 -TargetPath C:\path\to\project
```

## 2. Select adapter
- Codex: `adapters/codex/SESSION_STARTER.md`
- Generic LLM: `adapters/generic-llm/SESSION_STARTER.md`

## 3. Start workflow
- Fill `session-kickoff-template.md`
- Fill `discovery-checklist-template.md`
- Create `implementation-plan-sprint-XXX-<topic>.md`

## 4. Validate with gates
- Apply `quality-gates-template.md`
- Use `pr-checklist-template.md` in each PR

## 5. Pilot adoption
- Execute `docs/pilot-adoption-checklist.md` in the first target project
- Capture gaps and feed updates back to `CHANGELOG.md`

## 6. Scale to multiple projects
- Follow `docs/rollout-plan-3-projects.md`
- Progress only when each phase exit criteria is met
