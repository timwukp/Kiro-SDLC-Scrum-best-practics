---
name: threat-modeling
description: Perform STRIDE threat modeling for new features, APIs, and architecture changes
---

# Threat Modeling Skill

## When to Use
Invoke when designing new features, APIs, or reviewing architecture changes that affect the threat surface.

## STRIDE Threat Model Template
```markdown
# Threat Model: [Feature Name]
**Date:** [YYYY-MM-DD]
**Author:** [Security Champion / Team]
**Phase:** [Requirements / Design / Implementation]

## Feature Description
[Brief description of the feature being threat-modeled]

## Data Flow Diagram
[Describe: User → Frontend → API Gateway → Service → Database]

## STRIDE Analysis
| # | Threat | Category | Component | Likelihood | Impact | Risk | Mitigation |
|---|--------|----------|-----------|-----------|--------|------|------------|
| 1 | [desc] | Spoofing | [Component] | H/M/L | H/M/L | H/M/L | [control] |
| 2 | [desc] | Tampering | [Component] | H/M/L | H/M/L | H/M/L | [control] |
| 3 | [desc] | Repudiation | [Component] | H/M/L | H/M/L | H/M/L | [control] |
| 4 | [desc] | Info Disclosure | [Component] | H/M/L | H/M/L | H/M/L | [control] |
| 5 | [desc] | Denial of Service | [Component] | H/M/L | H/M/L | H/M/L | [control] |
| 6 | [desc] | Elevation of Privilege | [Component] | H/M/L | H/M/L | H/M/L | [control] |

## Trust Boundaries
- External → API Gateway (TLS termination, JWT validation)
- API Gateway → Internal Services (service mesh)
- Service → Database (encrypted connection, read-only app accounts)

## Residual Risks
| Risk | Justification for Acceptance | Review Date |
|------|------------------------------|-------------|
| [Risk] | [Why accepted] | [YYYY-MM-DD] |

## Action Items
| # | Action | Owner | Due | Status |
|---|--------|-------|-----|--------|
| 1 | [Action] | [Name] | [Date] | Open |
```

## Process
1. Identify the feature's data flow and trust boundaries
2. Walk through each STRIDE category systematically
3. Assess likelihood and impact for each identified threat
4. Define mitigations and map to implementation tasks
5. Document residual risks with acceptance justification
6. Review threat model during architecture review phase

#[[file:docs/threat-models/threat-model-template.md]]
