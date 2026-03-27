---
inclusion: auto
name: sre-operations
description: Incident response, system monitoring, reliability, or operational issues
---
## Banking SRE Runbook Standards

### Incident Severity Levels
| Level | Description | Response Time | Escalation |
|-------|-------------|---------------|------------|
| SEV1 | Customer-facing outage, data loss risk | 15 min | VP Engineering + CISO |
| SEV2 | Degraded performance, partial outage | 30 min | Engineering Manager |
| SEV3 | Non-critical service issue | 4 hours | Team Lead |
| SEV4 | Cosmetic / low-impact | Next business day | Sprint backlog |

### Monitoring Stack
- Metrics: Datadog (application + infrastructure)
- Logs: CloudWatch Logs → OpenSearch for analysis
- Traces: AWS X-Ray for distributed tracing
- Alerts: PagerDuty integration with Datadog monitors
- Dashboards: Datadog for real-time, Grafana for historical

### Key SLIs/SLOs
| Service | SLI | SLO |
|---------|-----|-----|
| Account API | Availability | 99.95% |
| Transaction API | Availability | 99.99% |
| Transaction API | Latency P95 | < 200ms |
| Auth Service | Availability | 99.99% |
| Batch Processing | Completion | Within 4-hour window |

### Alert Thresholds
- Error rate > 1% for 5 minutes → SEV2
- P95 latency > 500ms for 10 minutes → SEV3
- Database connection pool > 80% → SEV3
- Disk usage > 85% → SEV3
- Any 5xx on transaction endpoints → SEV2

### Post-Incident Process
1. Incident declared → War room opened (Slack #incident-{date})
2. Mitigation → Restore service first, investigate later
3. Root Cause Analysis within 48 hours
4. Blameless post-mortem document
5. Action items tracked in Jira with due dates
6. MAS notification if customer data impacted (within 1 hour)

#[[file:docs/runbooks/incident-response.md]]
