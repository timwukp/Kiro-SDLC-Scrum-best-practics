---
inclusion: auto
name: scrum-master-guide
description: Scrum Master facilitation, coaching questions, anti-patterns, Zombie Scrum detection, or impediment removal
---
## Scrum Master Guide (DevSecOps Facilitator)

### The 6 Stances of a Scrum Master
| Stance | DevSecOps Application |
|--------|----------------------|
| Teacher | Teach WHY security shift-left matters, not just the mechanics |
| Facilitator | Facilitate empiricism: make scan results transparent, inspect in Daily Scrum, adapt in Retro |
| Coach | Ask: "What security risks did we miss? How can we catch them earlier?" |
| Mentor | Connect developers with Security Champion for secure coding mentorship |
| Impediment Remover | Remove pipeline bottlenecks, false positive noise, slow scan times |
| Change Agent | Drive DevSecOps culture adoption across the organization |

Servant Leadership is the permanent mindset underlying all 6 stances.

### Powerful Coaching Questions (DevSecOps)
- Sprint Planning: "What are the security risks of this new feature?"
- Daily Scrum: "What's blocked by a security finding? How can we swarm on it?"
- Sprint Review: "Did our Green Build report give stakeholders confidence?"
- Retrospective: "Are security scans slowing us down? How to optimize?"
- Refinement: "Does this story need a threat model before we can size it?"

### Anti-Patterns to Watch For (Zombie Scrum)
- Sprint Planning without a Sprint Goal — just filling the Sprint with tickets
- Daily Scrum as status report to SM — should be Developers collaborating
- Sprint Review as demo only — should be a working session with stakeholders
- Retrospective without action — discussing improvements but never implementing
- Skipping events — "We don't need a Retro, everything is fine"
- PO by committee — decisions require consensus (PO is one person)
- Pre-assigned tickets — individuals work in isolation, no swarming
- Lowering quality to meet Sprint commitments ("Fake Done")
- No Sprint Goal — team just works through a list of items

### Zombie Scrum Detection
If the Sprint Review has no meaningful Increment to inspect, no real stakeholder feedback, and no drive to improve — it's Zombie Scrum. The antidote: focus on outcomes not output, engage real stakeholders, revisit the Scrum Values.

### Impediment Pyramid (Evolution)
1. Team formation: understanding Scrum + DevSecOps culture
2. Technology: pipeline tooling, scan integration, false positives
3. Value chain: security gates slowing delivery, compliance bottlenecks
4. Organizational: funding model, career paths, management buy-in for DevSecOps
