# Rollout Plan (3 Projects)

Goal: scale `engineering-playbook-core` from one pilot to organization-level standard with low risk and measurable adoption.

## Scope
- Project 1: Pilot adoption (prove process fit)
- Project 2: Controlled expansion (validate transferability)
- Project 3: Standardization (consolidate as default)

## Global Success Metrics
- Process compliance: % PRs with required artifacts linked
- Quality compliance: % PRs passing configured gates on first CI run
- Lead time trend: median cycle time from plan to merge
- Rework trend: % PRs requiring major rework after review
- Documentation hygiene: % changes with README/ops docs updated when required

## Phase 1 - Project 1 (Pilot)
Duration target: 1-2 sprints

### Objective (Project 1)
Validate that discovery-first + gates + templates improve delivery predictability without excessive overhead.

### Execution (Project 1)
- Run full onboarding with `docs/pilot-adoption-checklist.md`
- Bind project mode in copied `engineering-artifacts/playbook.md`
- Configure runnable gate commands in copied `engineering-artifacts/quality-gates-template.md`
- Run at least 2 non-trivial changes using full artifact set

### Exit Criteria (Project 1)
- At least 2 PRs executed end-to-end with all required artifacts
- Gate evidence consistently present in PR descriptions
- Team reports manageable overhead and clear decision quality gains
- Improvement backlog captured for `engineering-playbook-core`

## Phase 2 - Project 2 (Controlled Expansion)
Duration target: 1 sprint after pilot hardening

### Objective (Project 2)
Confirm process portability to a different team/context with minimal facilitation.

### Execution (Project 2)
- Apply hardened artifacts from pilot learnings
- Repeat adoption with reduced facilitator intervention
- Compare phase 2 metrics against pilot baseline

### Exit Criteria (Project 2)
- Team executes workflow autonomously
- No critical ambiguity in templates/policies/adapters
- Gate commands stable in CI with low false positives
- Only minor customization needed (documented and justified)

## Phase 3 - Project 3 (Standardization)
Duration target: 1 sprint

### Objective (Project 3)
Establish the process as default for new projects.

### Execution (Project 3)
- Adopt in third project with the finalized kit
- Publish org-level onboarding notes (internal wiki/handbook)
- Define ownership model for future playbook releases

### Exit Criteria (Project 3)
- 3 projects adopted with evidence of consistent use
- Release process defined for future playbook versions
- Change management flow agreed (proposal -> review -> release)
- Decision recorded: `engineering-playbook-core` becomes standard baseline

## Governance Model
- Product owner (process): owns roadmap and release prioritization
- Technical maintainers: own templates/policies/adapters quality
- Project champions: provide adoption feedback and metric snapshots

## Release Cadence Recommendation
- Minor (`0.x+1`): content clarifications, docs, non-breaking template improvements
- Major (`1.0+`): process baseline declared stable for broad rollout
- Every release must include changelog notes + migration guidance deltas

## Operational Checklist per New Project
- [ ] Install artifacts via bootstrap
- [ ] Select policy mode and effective date
- [ ] Configure gate commands
- [ ] Align team on selected adapter
- [ ] Execute first non-trivial change using full workflow
- [ ] Run retrospective and feed improvements back

## Decision Gates (Go / Hold)
- Gate A (after project 1): continue to project 2 only if pilot exit criteria are met
- Gate B (after project 2): continue to project 3 only if portability is validated
- Gate C (after project 3): declare standard only if governance and release model are active
