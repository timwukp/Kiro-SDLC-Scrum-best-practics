---
inclusion: auto
name: backlog-management
description: Sprint planning, backlog refinement, user story writing, or issue triage
---
## Banking Backlog & Sprint Standards

### User Story Format
```
As a [banking role/customer type],
I want to [action],
So that [business value].
```

### Acceptance Criteria Format (Given/When/Then)
```
Given [precondition],
When [action],
Then [expected outcome].
```

### Priority Classification
| Priority | Label | SLA | Examples |
|----------|-------|-----|---------|
| P0 | Critical | Same day | Security vulnerability, data breach, production outage |
| P1 | High | Within sprint | Regulatory deadline, customer-blocking bug |
| P2 | Normal | Next 2 sprints | Feature enhancement, tech debt |
| P3 | Low | Backlog | Nice-to-have, cosmetic improvements |

### Story Point Scale (Fibonacci)
- 1: Trivial change, config update
- 2: Simple feature, single file change
- 3: Standard feature, 2-3 files
- 5: Complex feature, multiple components
- 8: Large feature, cross-service impact
- 13: Epic-level, needs decomposition

### Sprint Events
- Sprint Planning: Monday 10:00 SGT (2 hours)
- Daily Scrum: 09:30 SGT (15 min)
- Sprint Review: Friday 14:00 SGT (1 hour)
- Retrospective: Friday 15:30 SGT (1 hour)
- Backlog Refinement: Wednesday 14:00 SGT (1 hour)

### Definition of Ready
- [ ] User story follows template
- [ ] Acceptance criteria defined (≥ 3)
- [ ] Story pointed by team
- [ ] Dependencies identified
- [ ] UX mockups attached (if UI change)
- [ ] API contract agreed (if API change)
