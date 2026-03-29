# Threat Modeling Process

> Reference: MAS TRM 2023 Section 5.1.2, OWASP Threat Modeling Guide

## Purpose

Establish a structured threat modeling process using the STRIDE methodology to identify, assess, and mitigate security threats for all banking platform features and API changes.

## When to Perform Threat Modeling

| Trigger | Scope | Owner |
|---------|-------|-------|
| New feature or user story | Full STRIDE analysis | Security Champion + Developers |
| New or modified API endpoint | API-focused threat analysis | Security Champion |
| Architecture change (new service, data flow) | System-level threat model | Architecture Reviewer |
| Third-party integration (payment gateway, KYC) | Integration threat model | Security Champion |
| Post-incident (security breach or near-miss) | Targeted threat reassessment | Incident Response Lead |

## Process Steps

1. **Define Scope** - Identify the feature, data flows, trust boundaries, and assets under review.
2. **Create Data Flow Diagram** - Map all actors, processes, data stores, and external entities (see template below).
3. **Identify Threats (STRIDE)** - Systematically apply each STRIDE category to every element in the data flow.
4. **Score Risks** - Assess each threat using the Likelihood x Impact matrix (see below).
5. **Define Mitigations** - Specify technical controls for each High or Critical risk.
6. **Generate Security Stories** - Create backlog items for each mitigation with priority and story points.
7. **Review Residual Risks** - Document accepted risks with justification and scheduled review date.

## STRIDE Categories

| Category | Threat Type | Banking Example |
|----------|------------|-----------------|
| **S**poofing | Identity impersonation | Forged JWT tokens, session hijacking |
| **T**ampering | Data modification | Transaction amount manipulation in transit |
| **R**epudiation | Denying actions | Missing audit trail for fund transfers |
| **I**nformation Disclosure | Data exposure | PII leaked in error responses or logs |
| **D**enial of Service | Availability disruption | API flood on transaction endpoints |
| **E**levation of Privilege | Unauthorized access | IDOR on account endpoints, privilege escalation |

## Data Flow Diagram Template

```
[Actor] --> [Trust Boundary] --> [Process] --> [Data Store]
                                           --> [External Entity]

Example:
Customer --> TLS 1.3 --> API Gateway (JWT validation)
                         --> Account Service --> accounts-db (AES-256)
                         --> Kafka (mTLS) --> Notification Service
```

## Risk Scoring Matrix (Likelihood x Impact)

| | Low Impact | Medium Impact | High Impact |
|---|-----------|---------------|-------------|
| **High Likelihood** | Medium | High | Critical |
| **Medium Likelihood** | Low | Medium | High |
| **Low Likelihood** | Low | Low | Medium |

### Risk Treatment

| Risk Level | Required Action | SLA |
|------------|----------------|-----|
| Critical | Immediate mitigation, block deployment | Before Sprint end |
| High | Security story in current Sprint backlog | Current Sprint |
| Medium | Security story in next Sprint | Next 2 Sprints |
| Low | Add to backlog, address opportunistically | Backlog |

## STRIDE Analysis Table Template

| # | Element | Threat | STRIDE Category | Likelihood | Impact | Risk | Mitigation | Story ID |
|---|---------|--------|----------------|-----------|--------|------|------------|----------|
| 1 | API Gateway | Token forgery | Spoofing | Low | High | Medium | JWT RS256 + short expiry | BANK-SEC-xxx |
| 2 | Transfer API | Amount tampering | Tampering | Medium | High | High | Server-side BigDecimal validation | BANK-SEC-xxx |
| 3 | Account API | IDOR access | Elevation | Medium | Critical | Critical | Ownership check per request | BANK-SEC-xxx |

## SDLC Integration Points

| Phase | Threat Modeling Activity |
|-------|------------------------|
| Requirements | Initial threat model for new features; identify security constraints |
| Design | Full STRIDE analysis on architecture and data flows |
| Implementation | Verify mitigations implemented; update model if design changed |
| Testing | Validate mitigations via DAST/SAST; pen test high-risk areas |
| Deployment | Confirm residual risks documented; DR procedures updated |
| Operations | Reassess after incidents; annual review of existing threat models |

## Compliance References

- **MAS TRM 2023 Section 5.1.2**: Threat modeling completed for new features
- **MAS TRM 2023 Section 8.3.1**: Penetration testing informed by threat models
- **OWASP Threat Modeling**: [owasp.org/www-community/Threat_Modeling](https://owasp.org/www-community/Threat_Modeling)
- **PCI-DSS Requirement 6.5**: Address common coding vulnerabilities identified through threat modeling

## Document Control

| Field | Value |
|-------|-------|
| Owner | Security Champion |
| Review Frequency | Annual, or upon significant architecture change |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | INTERNAL |
