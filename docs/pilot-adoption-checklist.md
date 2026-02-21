# Pilot Adoption Checklist

Use this checklist to adopt `engineering-playbook-core` in the first target project and validate operational fit.

## 1) Preparation
- [ ] Confirm target project owner and technical approver
- [ ] Define adoption mode: `Forward-Only + Frozen Baseline` or `Full Immediate Enforcement`
- [ ] Set effective date (`YYYY-MM-DD`)
- [ ] Define success criteria for pilot (quality, lead time, rework, predictability)

## 2) Installation
- [ ] Run bootstrap installer:
  - `./bootstrap/install.ps1 -TargetPath <target-project-path>`
- [ ] Confirm `engineering-artifacts/` exists in target project
- [ ] Confirm all templates and policies were copied

## 3) Project Binding
- [ ] Fill project binding block in `engineering-artifacts/playbook.md`
  - Project name
  - Mode
  - Effective date
  - Legacy handling rule
- [ ] Fill project binding block in `engineering-artifacts/quality-gates-template.md`
  - Effective date
  - Legacy handling
  - Merge blocking rule
- [ ] Replace `...` gate commands with runnable project commands

## 4) Team Workflow Enablement
- [ ] Choose adapter (`adapters/codex` or `adapters/generic-llm`)
- [ ] Share `SESSION_STARTER.md` with team
- [ ] Require kickoff artifacts for non-trivial work:
  - `engineering-artifacts/session-kickoff-template.md`
  - `engineering-artifacts/discovery-checklist-template.md`
  - `engineering-artifacts/implementation-plan-sprint-XXX-<topic>.md`
  - `engineering-artifacts/pr-checklist-template.md`

## 5) First Execution Cycle
- [ ] Run one full change using discovery-first + implementation plan + gates
- [ ] Validate quality gates evidence in PR
- [ ] Validate docs updates (README/operational docs)
- [ ] Create checkpoint tag in target project after successful merge

## 6) Pilot Retrospective
- [ ] Record friction points (missing templates, ambiguous gates, adapter gaps)
- [ ] Record measurable gains/losses (speed, defects, review quality)
- [ ] Open improvement backlog items
- [ ] Update `engineering-playbook-core` templates/policies/adapters as needed

## 7) Exit Criteria
- [ ] Team can execute process without facilitator
- [ ] Gate commands are stable in CI
- [ ] Checklist completion evidence linked in pilot PRs
- [ ] Decision made: scale to more projects or run second pilot
