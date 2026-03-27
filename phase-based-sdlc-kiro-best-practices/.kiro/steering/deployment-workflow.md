---
inclusion: auto
name: deployment-workflow
description: Deployment procedures, release management, or production changes
---
## Banking Deployment Workflow

### Environment Promotion
```
dev → staging → pre-prod → production
```
- dev: auto-deploy on merge to develop branch
- staging: auto-deploy on merge to release/* branch
- pre-prod: manual approval required (Tech Lead + QA Lead)
- production: CAB approval required (Change Advisory Board)

### Pre-Deployment Checklist
- [ ] All tests passing (unit, integration, contract)
- [ ] No critical/high Snyk vulnerabilities
- [ ] Database migration tested against prod schema copy
- [ ] API backward compatibility verified
- [ ] Rollback plan documented and tested
- [ ] Monitoring dashboards updated
- [ ] Runbook updated for new features
- [ ] Compliance sign-off (for regulated features)

### Deployment Strategy
- Blue/Green deployment for zero-downtime releases
- Canary releases for high-risk changes (10% → 50% → 100%)
- Feature flags for gradual rollout (LaunchDarkly)
- Database migrations run before application deployment

### Rollback Procedure
1. Trigger rollback via GitHub Actions workflow_dispatch
2. ECS rolls back to previous task definition
3. If DB migration involved: run rollback script within 30 minutes
4. Notify on-call team via PagerDuty
5. Post-incident review within 24 hours

### Maintenance Windows
- Scheduled: Sunday 02:00-06:00 SGT
- Emergency: requires VP Engineering approval
- Customer notification: 72 hours advance for scheduled, immediate for emergency
