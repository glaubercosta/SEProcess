# SEprocess Improvement Proposal (v3 Roadmap)

This document outlines suggested enhancements for the `SEprocess` framework to further increase project "assertiveness" (accertividade) and reduce common failure modes in AI-guided development.

## 1. Context & Knowledge Continuity
**Problem:** AIs often lose the "Why" and the "Global Picture" when switching between tasks or sessions.

### [NEW] `seprocess/context-snapshot-template.md`
A lightweight artifact updated at the end of every session to bridge the context gap.
- **Current Domain Model:** Key entities and their relationships.
- **Architectural Debt/Smells:** Known issues introduced or discovered.
- **Decision Log (Last 3):** To prevent the AI from proposing changes that contradict recent ADRs.

## 2. Advanced Architectural Governance
**Problem:** Simply having a Linter doesn't ensure architectural alignment (e.g., mixing layers in Clean Architecture).

### [UPDATE] [seprocess/playbook.md](file:///c:/Users/Glauber/codes/MicroTaskManager/seprocess/playbook.md) (Design-First Clause)
Add a "Design-First" requirement to the Discovery Phase:
- **Component Mapping:** Before coding, the AI must explicitly state which module/layer the new code belongs to and which dependencies it is allowed to have.
- **Pattern Declaration:** Explicitly name the design pattern being applied (e.g., "Strategy Pattern for discount logic").

## 3. "Red Teaming" Discovery
**Problem:** Discovery checklists are often treated as "check the box" rather than challenging the plan.

### [UPDATE] [seprocess/session-kickoff-template.md](file:///c:/Users/Glauber/codes/MicroTaskManager/seprocess/session-kickoff-template.md)
Add a **Pre-Mortem / Red Team** section:
- **Failure Modes:** "List 3 ways this plan could fail."
- **Contingency:** "What is the immediate action if [Assumption X] is proven false during the first 15 minutes of coding?"

## 4. Evidence-Based Quality Gates
**Problem:** "Tests pass" is a weak signal for complex system behavior.

### [UPDATE] [seprocess/quality-gates-template.md](file:///c:/Users/Glauber/codes/MicroTaskManager/seprocess/quality-gates-template.md)
Require **Physical Evidence** for non-trivial PRs:
- **Traceability Link:** Every requirement in the Implementation Plan must be linked to a specific test case or log output.
- **Scenario Validation:** AI must run and document at least one "Integration Scenario" that spans multiple components, even if unit tests pass.

## 5. Explicit UX & Aesthetics Gate
**Problem:** Functional code often lacks the "vibrant, premium" feel required for modern apps.

### [NEW] `seprocess/ux-ui-checklist-template.md`
A checklist for any task involving UI:
- [ ] **State Feedback:** Loading, Success, and Error states handled.
- [ ] **Interactive Polish:** Hover, Focus, and Transition effects applied.
- [ ] **Accessibility:** Alt tags, ARIA labels, and keyboard navigation.

## 6. Process Self-Correction (Meta-Learning)
**Problem:** The process remains static while project complexity grows.

### [UPDATE] [seprocess/playbook.md](file:///c:/Users/Glauber/codes/MicroTaskManager/seprocess/playbook.md) (Post-Session Retrospective)
Include a 2-minute "Process Retro" at the end of each session:
- **Process Friction:** "What part of SEprocess felt like a bottleneck?"
- **Surprises:** "What did we miss in Discovery that appeared during Execution?"
- **Adaptation:** "Does a template need an update?"

---

## Next Steps for Export
To take these to your other workspace:
1.  **Refine the Templates:** I can create the new [.md](file:///c:/Users/Glauber/codes/MicroTaskManager/seprocess/playbook.md) files based on these suggestions.
2.  **Versioning:** Tag your `SEprocess` folder as `v2.1-stable` before applying these "v3-proposal" changes.
