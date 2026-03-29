---
name: deployment-checklist
description: Verify pre-deployment readiness with security gates, compliance sign-off, and rollback planning
---

# Deployment Checklist Skill (DevSecOps)

## When to Use
Invoke when preparing a deployment or reviewing deployment readiness.

## Pre-Deployment Checklist
### Security Gates
- [ ] SAST scan passed (no High/Critical)
- [ ] DAST scan passed (no High/Critical)
- [ ] Dependency scan clean (no Critical CVEs)
- [ ] Container image scan clean
- [ ] No hardcoded credentials in diff

### Quality Gates
- [ ] All unit tests passing (≥ 80% coverage)
- [ ] All integration tests passing
- [ ] Security regression tests passing
- [ ] Code review approved by ≥ 1 peer

### Database
- [ ] Migration tested against prod schema copy
- [ ] Rollback script prepared and tested

### Compliance
- [ ] Compliance checklist signed off (if regulated feature)
- [ ] Audit logging verified for new endpoints
- [ ] CAB approval obtained (for production)

### Operations
- [ ] Monitoring dashboards updated
- [ ] Alert thresholds configured
- [ ] Rollback plan documented
- [ ] On-call team notified
