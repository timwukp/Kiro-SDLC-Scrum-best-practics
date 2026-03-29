---
name: incident-response
description: Handle production incidents, perform root cause analysis, and write blameless post-mortem reports
---

# Incident Response Skill

## When to Use
Invoke during production incidents, post-mortem writing, or incident response planning.

## Incident Response Flow
1. **Detect**: Alert fires (Datadog/PagerDuty)
2. **Triage**: Assign severity (SEV1-SEV4), open war room
3. **Mitigate**: Restore service first (rollback, failover, scale)
4. **Communicate**: Status page update, stakeholder notification
5. **Investigate**: Root cause analysis with timeline
6. **Remediate**: Fix root cause, deploy fix
7. **Review**: Blameless post-mortem within 48 hours

## Post-Mortem Template
```markdown
# Incident Post-Mortem: [Title]
**Date:** [YYYY-MM-DD]
**Severity:** SEV[1-4]
**Duration:** [X hours Y minutes]
**Impact:** [Number of affected customers/transactions]

## Summary
[1-2 sentence description]

## Timeline (SGT)
| Time | Event |
|------|-------|
| HH:MM | Alert fired |
| HH:MM | Incident declared |
| HH:MM | Mitigation applied |
| HH:MM | Service restored |

## Root Cause
[Technical explanation]

## Contributing Factors
- [Factor 1]
- [Factor 2]

## Action Items
| # | Action | Owner | Due Date | Status |
|---|--------|-------|----------|--------|
| 1 | [Action] | [Name] | [Date] | Open |

## Lessons Learned
- [What went well]
- [What could be improved]
```

## MAS Notification Requirements
- Customer data breach: notify MAS within 1 hour
- System outage > 4 hours: notify MAS within 24 hours
- Include: impact assessment, mitigation steps, remediation timeline
