---
inclusion: auto
name: backlog-standards
description: Backlog refinement, user story writing, security stories, or issue triage
---
## Banking Backlog Standards (Secure Value)

### Sprint Goal Crafting (Outcome-Oriented)
A good Sprint Goal is:
- Outcome-oriented: "Customers can transfer funds between accounts securely"
- NOT a task list: "Complete BANK-101, BANK-102, BANK-103"
- Coherent: ties the Sprint Backlog together with a single thread
- Flexible: Developers decide HOW to achieve it
- Negotiable: scope can be renegotiated without changing the goal

Anti-patterns to avoid:
- Sprint Goal is a list of PBIs (not a coherent objective)
- Sprint Goal is too vague ("improve the product")
- Sprint Goal changes mid-Sprint (it's a commitment)
- No Sprint Goal at all (team just works through tickets)

### Product Goal
The long-term objective for the Scrum Team. Must fulfill (or abandon) one Product Goal before taking on the next. All Sprint Goals should move the team toward the Product Goal.

### INVEST Criteria for PBIs
| Letter | Meaning | Description |
|--------|---------|-------------|
| I | Independent | Can be developed independently |
| N | Negotiable | Details negotiated between PO and Developers |
| V | Valuable | Delivers value to user or customer |
| E | Estimable | Team can estimate effort |
| S | Small | Completable within one Sprint |
| T | Testable | Clear criteria to verify when done |

### User Story Format (Security-Aware)
```
As a [banking role/customer type],
I want to [action],
So that [business value].

Security Consideration: [security constraint or risk]
```

### Security Story Format
```
As a [security role],
I want to [security control],
So that [risk mitigation].

Threat: [STRIDE category]
Compliance: [MAS TRM / PCI-DSS reference]
```

### Priority Classification (Risk-Weighted)
| Priority | Label | SLA | Examples |
|----------|-------|-----|---------|
| P0 | Critical | Same day | Security vulnerability, data breach, production outage |
| P1 | High | Within sprint | Regulatory deadline, customer-blocking bug, Critical CVE |
| P2 | Normal | Next 2 sprints | Feature enhancement, tech debt, Medium CVE |
| P3 | Low | Backlog | Nice-to-have, cosmetic, Low CVE |

### Sprint Events (2-Week Sprint)
- Sprint Planning: Monday 10:00 SGT (4 hours) — includes threat modeling
- Daily Scrum: 09:30 SGT (15 min) — includes scan result updates
- Sprint Review: Thursday 14:00 SGT (2 hours) — includes Green Build demo
- Retrospective: Thursday 16:00 SGT (1.5 hours) — includes pipeline review
- Backlog Refinement: Wednesday 14:00 SGT (1 hour)

### Definition of Ready (Guideline, Not Gate)
- [ ] User story follows template with security consideration
- [ ] Acceptance criteria defined (≥ 3)
- [ ] Threat model reviewed by Security Champion (if new feature)
- [ ] Story pointed by team
- [ ] Dependencies identified
