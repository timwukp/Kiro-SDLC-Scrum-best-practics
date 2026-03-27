# Incident Response Runbook

## Quick Reference
| Severity | Response Time | Escalation | MAS Notification |
|----------|---------------|------------|------------------|
| SEV1 | 15 min | VP Eng + CISO | Within 1 hour (if data breach) |
| SEV2 | 30 min | Eng Manager | Within 24 hours (if > 4hr outage) |
| SEV3 | 4 hours | Team Lead | Not required |
| SEV4 | Next business day | Sprint backlog | Not required |

## Step 1: Detect & Triage
1. Alert received via PagerDuty
2. Acknowledge alert within response time SLA
3. Assess severity using criteria above
4. Open war room: Slack #incident-{YYYY-MM-DD}

## Step 2: Mitigate
- **Service down**: Check ECS task health, trigger redeployment
- **High error rate**: Check recent deployments, consider rollback
- **Database issues**: Check connection pool, query performance
- **External dependency**: Enable circuit breaker, serve cached data

## Step 3: Communicate
- Update status page (statuspage.io)
- Notify stakeholders via Slack #incidents channel
- Customer-facing impact: notify Customer Service team

## Step 4: Resolve & Review
- Deploy fix or confirm rollback successful
- Verify monitoring shows recovery
- Close war room
- Schedule post-mortem within 48 hours

## Emergency Contacts
| Role | Contact | Backup |
|------|---------|--------|
| On-call Engineer | PagerDuty rotation | @devops-oncall |
| Engineering Manager | [name] | [name] |
| CISO | [name] | [name] |
| MAS Liaison | [name] | Compliance team |
