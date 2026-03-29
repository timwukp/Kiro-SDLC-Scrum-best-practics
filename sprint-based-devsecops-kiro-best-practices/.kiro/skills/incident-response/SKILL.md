---
name: incident-response
description: Handle security incidents, production incident response, and write blameless post-mortem documentation
---

# Incident Response Skill

## When to Use
Invoke during production or security incidents, post-mortem writing, or incident planning.

## Security Incident Flow
1. Detect: Datadog security monitoring / anomaly alert
2. Triage: Severity assessment, open war room
3. Contain: Isolate affected service, preserve evidence
4. Mitigate: Restore service, apply emergency fix
5. Notify: MAS within 1 hour if customer data impacted
6. Investigate: Root cause analysis with timeline
7. Remediate: Fix root cause, add security regression test
8. Review: Blameless post-mortem within 48 hours

## Post-Mortem Template
```markdown
# Incident Post-Mortem: [Title]
**Date:** [YYYY-MM-DD] | **Severity:** SEV[1-4]
**Duration:** [X hours Y minutes]
**Security Impact:** [Data breach? PII exposed? Unauthorized access?]

## Timeline (SGT)
| Time | Event |
|------|-------|
| HH:MM | Alert fired |
| HH:MM | Incident declared, war room opened |
| HH:MM | Service isolated / mitigation applied |
| HH:MM | Service restored |

## Root Cause
[Technical explanation]

## Security Regression Test Added
- [Test description ensuring this cannot recur]

## Action Items
| # | Action | Owner | Due | Status |
|---|--------|-------|-----|--------|
| 1 | [Action] | [Name] | [Date] | Open |
```
