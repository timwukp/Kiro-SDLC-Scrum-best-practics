---
name: sprint-planning
description: Plan sprints, track velocity, identify risks, and allocate resources for banking projects
---

# Sprint Planning Skill

## When to Use
Invoke for sprint planning sessions, velocity analysis, or resource allocation decisions.

## Sprint Planning Process
1. Review previous sprint: velocity, carry-over, blockers
2. Assess team capacity: PTO, on-call rotation, training
3. Pull stories from prioritized backlog
4. Identify risks and dependencies
5. Commit to sprint goal

## Velocity Tracking
- Track story points completed per sprint (3-sprint rolling average)
- Flag if velocity drops > 20% from average
- Adjust commitment based on team changes (new members ramp at 50% for first sprint)

## Risk Identification Template
| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|------------|-------|
| [Description] | High/Med/Low | High/Med/Low | [Action] | [Name] |

## Banking Sprint Considerations
- Regulatory deadlines are non-negotiable — always reserve capacity
- Production support rotation: 1 developer on-call per sprint
- Quarter-end freeze: no deployments in last week of financial quarter
- Audit preparation: reserve 10% capacity during audit season (Q1, Q3)
