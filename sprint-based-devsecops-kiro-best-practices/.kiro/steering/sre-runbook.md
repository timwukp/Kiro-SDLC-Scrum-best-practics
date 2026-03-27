---
inclusion: auto
name: sre-operations
description: Incident response, system monitoring, reliability, observability, or resilience
---
## Banking SRE Standards (Resilience & Observability)

### Incident Severity
| Level | Description | Response | Escalation |
|-------|-------------|----------|------------|
| SEV1 | Customer outage, data loss risk | 15 min | VP Eng + CISO |
| SEV2 | Degraded performance, partial outage | 30 min | Eng Manager |
| SEV3 | Non-critical service issue | 4 hours | Team Lead |
| SEV4 | Cosmetic / low-impact | Next business day | Sprint backlog |

### Observability Stack
- Metrics: Datadog (application + infrastructure)
- Logs: CloudWatch → OpenSearch
- Traces: AWS X-Ray for distributed tracing
- Security monitoring: Datadog Security Monitoring
- Alerts: PagerDuty integration

### SLIs/SLOs
| Service | SLI | SLO |
|---------|-----|-----|
| Account API | Availability | 99.95% |
| Transaction API | Availability | 99.99% |
| Transaction API | Latency P95 | < 200ms |
| Auth Service | Availability | 99.99% |

### Self-Healing Patterns
- Circuit breakers on all external service calls
- Auto-scaling based on CPU/memory thresholds
- Automatic rollback on health check failure
- Rate limiting to prevent cascade failures
- Bulkhead isolation between service domains

### Security Incident Response
- Anomaly detected → auto-alert to on-call + Security Champion
- Isolate affected service (network policy update)
- Preserve evidence (snapshot logs, freeze audit trail)
- MAS notification within 1 hour if customer data impacted
- Post-incident blameless review within 48 hours

#[[file:docs/runbooks/incident-response.md]]
