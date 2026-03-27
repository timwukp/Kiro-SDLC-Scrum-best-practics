---
name: prod-change-request
description: Preparing and documenting production change requests for banking CAB approval
---

# Production Change Request Skill

## When to Use
Invoke when preparing changes to production environments or seeking CAB approval.

## Change Request Template
```markdown
# Change Request: [CR-YYYY-NNN]

## Summary
[Brief description of the change]

## Justification
[Business reason for the change]

## Scope
- Services affected: [list]
- Database changes: [yes/no, details]
- Infrastructure changes: [yes/no, details]
- Configuration changes: [yes/no, details]

## Risk Assessment
- Risk level: LOW / MEDIUM / HIGH / CRITICAL
- Customer impact: [description]
- Rollback time estimate: [minutes]

## Implementation Plan
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Rollback Plan
1. [Step 1]
2. [Step 2]

## Testing Evidence
- Unit tests: [pass/fail, coverage %]
- Integration tests: [pass/fail]
- Pre-prod verification: [date, result]

## Approvals Required
- [ ] Tech Lead
- [ ] QA Lead
- [ ] Security (if applicable)
- [ ] Compliance (if applicable)
- [ ] CAB Chair

## Deployment Window
- Preferred: [date, time SGT]
- Maintenance window required: [yes/no]
```
