---
name: threat-modeling
description: Performing STRIDE threat modeling during Sprint Planning for new features and APIs
---

# Threat Modeling Skill (Sprint Planning Integration)

## When to Use
Invoke during Sprint Planning when new features or APIs are being discussed.

## STRIDE Threat Model Template
```markdown
# Threat Model: [Feature Name]
**Sprint:** [Sprint number]
**Date:** [YYYY-MM-DD]
**Participants:** [Security Champion + team members]

## Feature Description
[Brief description of the feature being threat-modeled]

## Data Flow Diagram
[Describe: User → Frontend → API Gateway → Service → Database]

## STRIDE Analysis
| # | Threat | Category | Likelihood | Impact | Risk | Mitigation | Story Points |
|---|--------|----------|-----------|--------|------|------------|-------------|
| 1 | [desc] | Spoofing | H/M/L | H/M/L | H/M/L | [control] | [pts] |
| 2 | [desc] | Tampering | H/M/L | H/M/L | H/M/L | [control] | [pts] |

## Security Stories Generated
- [ ] [Story title] — [priority] — [points]

## Residual Risks
- [Risks accepted with justification]
```

## Process
1. Security Champion presents the feature's data flow (5 min)
2. Team walks through STRIDE categories (10 min)
3. Identify mitigations and generate security stories
4. Add security stories to Sprint Backlog
