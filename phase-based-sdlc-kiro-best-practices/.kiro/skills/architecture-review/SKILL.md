---
name: architecture-review
description: Create ADR documents, run architecture review checklists, and assess compliance impact assessment
---

# Architecture Review Skill

## When to Use
Invoke when designing new services, reviewing architecture decisions, or creating ADRs.

## ADR Template
```markdown
# ADR-{NNN}: {Title}

## Status
Proposed | Accepted | Deprecated | Superseded by ADR-{NNN}

## Context
What is the issue that we're seeing that is motivating this decision?

## Decision
What is the change that we're proposing and/or doing?

## Consequences
What becomes easier or more difficult to do because of this change?

### Positive
- ...

### Negative
- ...

### Risks
- ...

## Compliance Impact
- MAS TRM: [affected sections]
- PCI-DSS: [affected requirements]
- Data residency: [impact on data location]
```

## Architecture Review Checklist
- [ ] Service boundaries align with domain boundaries (DDD)
- [ ] All state changes produce domain events (Kafka)
- [ ] No single point of failure identified
- [ ] Horizontal scaling strategy defined
- [ ] Data consistency model documented (strong vs eventual)
- [ ] Security: authentication, authorization, encryption
- [ ] Monitoring: metrics, logs, traces, alerts
- [ ] Disaster recovery: RTO/RPO targets met
- [ ] Cost estimation included
- [ ] Compliance impact assessed
