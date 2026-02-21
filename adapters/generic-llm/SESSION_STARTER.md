# Adapter: Generic LLM

Use this adapter for assistants without repository-native coding workflows.

## Session Starter Prompt
Use a discovery-first workflow before proposing implementation. Produce: context map, knowns/unknowns, assumptions with validation plan, and critical questions (minimum 10 for non-trivial work). Provide at least two implementation options with trade-offs. Gate execution on measurable acceptance criteria and explicit quality checks.

## Minimal Workflow
1. Discovery checklist
2. Implementation plan
3. Controlled execution
4. Validation against gates
5. Retrospective updates

## Required Artifacts Per Non-Trivial Task
- `engineering-artifacts/session-kickoff-template.md`
- `engineering-artifacts/discovery-checklist-template.md`
- `engineering-artifacts/implementation-plan-*.md`
- `engineering-artifacts/pr-checklist-template.md`
