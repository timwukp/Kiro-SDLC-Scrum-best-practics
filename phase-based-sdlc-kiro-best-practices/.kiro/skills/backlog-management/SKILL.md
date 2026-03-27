---
name: backlog-management
description: Managing product backlog, sprint planning, story prioritization, and issue triage for banking teams
---

# Backlog Management Skill

## When to Use
Invoke this skill for sprint planning, backlog refinement, story prioritization, or issue triage.

## Prioritization Framework (Banking-Specific)
1. **Regulatory deadlines** (P0): MAS audit findings, PCI-DSS remediation
2. **Security vulnerabilities** (P0-P1): Critical/High CVEs, penetration test findings
3. **Customer-blocking bugs** (P1): Production issues affecting transactions
4. **Revenue features** (P1-P2): New products, customer acquisition
5. **Tech debt** (P2-P3): Performance, maintainability, test coverage

## Sprint Capacity Planning
- Team velocity: track 3-sprint rolling average
- Buffer: reserve 20% capacity for production support and unplanned work
- Carry-over: if > 30% stories carry over, reduce next sprint commitment

## Jira Workflow
```
Backlog → Ready → In Progress → In Review → QA → Done
```

## Definition of Done
- [ ] Code reviewed and approved
- [ ] Unit tests passing (≥ 80% coverage)
- [ ] Integration tests passing
- [ ] No critical/high Snyk findings
- [ ] API documentation updated
- [ ] Compliance checklist completed (if applicable)
- [ ] Deployed to staging and verified
