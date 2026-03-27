# Incident Response Runbook

## Quick Reference
| Severity | Response | Escalation | MAS Notification |
|----------|----------|------------|------------------|
| SEV1 | 15 min | VP Eng + CISO | Within 1 hour (data breach) |
| SEV2 | 30 min | Eng Manager | Within 24 hours (>4hr outage) |
| SEV3 | 4 hours | Team Lead | Not required |
| SEV4 | Next business day | Sprint backlog | Not required |

## Step 1: Detect & Triage
1. Alert via PagerDuty / Datadog Security Monitoring
2. Acknowledge within response time SLA
3. Assess severity, open war room: Slack #incident-{date}

## Step 2: Contain & Mitigate
- Security incident: isolate affected service, preserve evidence
- Service down: check ECS health, trigger redeployment
- High error rate: check recent deployments, consider rollback

## Step 3: Resolve & Review
- Deploy fix or confirm rollback
- Verify monitoring shows recovery
- Schedule blameless post-mortem within 48 hours
- Add security regression test for the root cause
