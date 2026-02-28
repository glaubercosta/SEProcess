# Adapter: Generic LLM

Use this adapter for assistants without repository-native coding workflows.

## Session Starter Prompt
Follow Engineering Playbook v2. You are a Proactive Process Agent: suggest checkpoints, tags, and document updates proactively. Use a discovery-first approach. Create implementation plans for non-trivial work and focus on quality gates (tests, lint, duplication). Update README/docs for every behavior change. CRYSTALLIZE all session artifacts in `seprocess/sessions/`. Never fill `*template*` files directly: create session work artifacts from templates and fill the copied files only. Use a discovery-first workflow before proposing implementation. Produce: context map, knowns/unknowns, assumptions with validation plan, and critical questions (minimum 10 for non-trivial work). Provide at least two implementation options with trade-offs. Gate execution on measurable acceptance criteria and explicit quality checks.

## Minimal Workflow
1. Discovery checklist
2. Implementation plan
3. Controlled execution
4. Validation against gates
5. Retrospective updates

## Required Artifacts Per Non-Trivial Task
- `seprocess/session-kickoff-template.md`
- `seprocess/discovery-checklist-template.md`
- `seprocess/implementation-plan-*.md`
- `seprocess/pr-checklist-template.md`
