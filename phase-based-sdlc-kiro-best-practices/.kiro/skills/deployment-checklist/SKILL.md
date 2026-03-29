---
name: deployment-checklist
description: Verify pre-deployment readiness, release management, and production deployment procedures for banking systems
---

# Deployment Checklist Skill

## When to Use
Invoke when preparing a deployment, creating a release, or reviewing deployment readiness.

## Pre-Deployment Checklist
### Code Quality
- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] Code coverage ≥ 80% (critical paths ≥ 95%)
- [ ] No critical/high Snyk vulnerabilities
- [ ] Code review approved by ≥ 1 peer

### Database
- [ ] Migration scripts tested against prod schema copy
- [ ] Rollback scripts prepared and tested
- [ ] No breaking schema changes (backward compatible)
- [ ] Performance impact assessed for large table changes

### API
- [ ] Backward compatibility verified (no breaking changes)
- [ ] OpenAPI spec updated
- [ ] Rate limiting configured
- [ ] Error responses follow standard format

### Infrastructure
- [ ] CDK diff reviewed (no unexpected resource changes)
- [ ] Security group changes reviewed
- [ ] IAM policy changes reviewed (least privilege)
- [ ] Resource tagging complete

### Compliance
- [ ] Compliance checklist signed off (if regulated feature)
- [ ] Audit logging verified for new endpoints
- [ ] Data classification reviewed for new data fields
- [ ] CAB approval obtained (for production)

### Operations
- [ ] Monitoring dashboards updated
- [ ] Alert thresholds configured
- [ ] Runbook updated for new features
- [ ] Rollback plan documented
- [ ] On-call team notified
