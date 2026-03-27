---
name: prod-change-request
description: Preparing production change requests with security impact assessment for CAB approval
---

# Production Change Request Skill

## When to Use
Invoke when preparing changes to production environments.

## Change Request Template
```markdown
# Change Request: [CR-YYYY-NNN]

## Summary
[Brief description]

## Security Impact Assessment
- Security scan status: [PASSED / findings]
- New attack surface: [yes/no, details]
- Data impact: [PII changes? encryption changes?]
- Access control changes: [yes/no, details]

## Risk Assessment
- Risk level: LOW / MEDIUM / HIGH / CRITICAL
- Rollback time estimate: [minutes]

## Implementation Plan
1. [Step 1]
2. [Step 2]

## Rollback Plan
1. [Step 1]
2. [Step 2]

## Approvals Required
- [ ] Tech Lead
- [ ] Security Champion
- [ ] QA Lead
- [ ] CAB Chair
```
