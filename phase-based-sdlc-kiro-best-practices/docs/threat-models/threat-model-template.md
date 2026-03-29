# Threat Model Template (STRIDE)

## MAS TRM §5.1.2 Compliance

### Feature: [Feature Name]
- **Date:** [YYYY-MM-DD]
- **Author:** [Security Champion / Team]
- **Phase:** [Requirements / Design / Implementation]

### Data Flow Diagram
```
[User] → [Frontend] → [API Gateway] → [Service] → [Database]
                                    ↕
                              [External Service]
```

### STRIDE Analysis

| # | Threat | Category | Component | Likelihood | Impact | Risk | Mitigation |
|---|--------|----------|-----------|-----------|--------|------|------------|
| 1 | [Description] | Spoofing | [Component] | H/M/L | H/M/L | H/M/L | [Control] |
| 2 | [Description] | Tampering | [Component] | H/M/L | H/M/L | H/M/L | [Control] |
| 3 | [Description] | Repudiation | [Component] | H/M/L | H/M/L | H/M/L | [Control] |
| 4 | [Description] | Info Disclosure | [Component] | H/M/L | H/M/L | H/M/L | [Control] |
| 5 | [Description] | Denial of Service | [Component] | H/M/L | H/M/L | H/M/L | [Control] |
| 6 | [Description] | Elevation of Privilege | [Component] | H/M/L | H/M/L | H/M/L | [Control] |

### Trust Boundaries
- External → API Gateway (TLS termination, JWT validation)
- API Gateway → Internal Services (mTLS)
- Service → Database (encrypted connection, read-only app accounts)

### Residual Risks
| Risk | Justification for Acceptance | Review Date |
|------|------------------------------|-------------|
| [Risk] | [Why accepted] | [YYYY-MM-DD] |

### Action Items
| # | Action | Owner | Due | Status |
|---|--------|-------|-----|--------|
| 1 | [Action] | [Name] | [Date] | Open |
