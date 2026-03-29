---
name: backlog-management
description: Triage Jira issues, refine user stories with security stories, and manage risk-weighted backlog prioritization
---

# Backlog Management Skill (Secure Value)

## When to Use
Invoke for sprint planning, backlog refinement, or security story prioritization.

## PO as Risk Manager — Security Debt vs Feature Value
The Product Owner balances Feature Velocity against Security Debt:
- Security vulnerabilities (Critical/High) are always P0/P1
- Regulatory deadlines are non-negotiable
- Security stories from threat modeling get Sprint capacity
- Reserve 20% Sprint capacity for security + unplanned work

### Security Debt vs Feature Value Calculation
For each Sprint, the PO uses this framework:
```
Security Debt Score = Σ (vulnerability_severity × exposure_days × affected_users)
  - Critical: 10 pts, High: 5 pts, Medium: 2 pts, Low: 1 pt
  - Exposure multiplier: days since discovery / 30

Feature Value Score = business_impact × user_reach × revenue_potential
  - Scale: 1-10 for each factor

Sprint Priority = items with highest (Feature Value - Security Debt Risk)
  - Exception: Critical/High security debt ALWAYS takes priority
```

## Sprint Capacity Planning
- Track 3-sprint rolling velocity average
- Buffer: 20% for security remediation + production support
- Security Champion time: ~20% of Sprint on security activities
- Carry-over > 30% → reduce next Sprint commitment

## Definition of Done (DevSecOps)
- [ ] Code peer-reviewed
- [ ] Unit tests passing (≥ 80% coverage)
- [ ] SAST/DAST scans passed (no High/Critical)
- [ ] No Critical CVEs in dependencies
- [ ] Compliance documentation updated (if applicable)
- [ ] Deployed to staging and verified
