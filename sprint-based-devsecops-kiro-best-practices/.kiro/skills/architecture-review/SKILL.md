---
name: architecture-review
description: Create ADR documents, review architecture designs for Zero Trust compliance, and assess secure-by-design principles
---

# Architecture Review Skill (Secure by Design)

## When to Use
Invoke when designing new services, reviewing architecture, or creating ADRs.

## ADR Template
```markdown
# ADR-{NNN}: {Title}
## Status: Proposed | Accepted | Deprecated
## Context: [What problem are we solving?]
## Decision: [What did we decide?]
## Security Impact: [Zero Trust alignment, threat surface changes]
## Consequences: [Positive / Negative / Risks]
## Compliance: [MAS TRM / PCI-DSS affected sections]
```

## Zero Trust Review Checklist
- [ ] mTLS between all services
- [ ] JWT validation at API Gateway edge
- [ ] No implicit trust between services
- [ ] Database access: read-only for app accounts
- [ ] Secrets rotated automatically via KMS
- [ ] Network: private subnets, no direct internet access
