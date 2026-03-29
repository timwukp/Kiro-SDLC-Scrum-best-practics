# SIEM Integration Requirements

> Reference: MAS TRM 2023 Section 8.1.1

## Purpose

This document defines the Security Information and Event Management (SIEM) integration architecture, log sources, alerting rules, and retention requirements for the banking platform.

## Architecture

```
Application Logs ─┐
Audit Logs ───────┤
Infrastructure ───┼──> CloudWatch Logs ──> OpenSearch (analysis + dashboards)
Security Events ──┤
Database Logs ────┘
                        Datadog Security Monitoring (real-time alerting)
                        X-Ray (distributed tracing)
```

- **Primary SIEM**: CloudWatch Logs aggregated into OpenSearch for search, correlation, and long-term analysis.
- **Real-time monitoring**: Datadog Security Monitoring for anomaly detection and real-time alerting.
- **Distributed tracing**: AWS X-Ray for cross-service request tracing and latency analysis.

## Log Sources

| Source | Content | Format | Destination |
|--------|---------|--------|-------------|
| Application logs | Service events, errors, request/response metadata | Structured JSON | CloudWatch + Datadog |
| Audit logs | State-changing operations (who, what, when, before/after) | Structured JSON | CloudWatch (immutable, append-only) |
| Infrastructure logs | ECS task events, ALB access logs, VPC flow logs | AWS native | CloudWatch |
| Security events | Authentication, authorization, failed logins, MFA events | Structured JSON | CloudWatch + Datadog Security |
| Database logs | Slow queries, connection events, failover events | PostgreSQL native | CloudWatch |

## Alerting Rules

| Rule | Trigger Condition | Severity | Response |
|------|-------------------|----------|----------|
| Brute force detection | > 5 failed login attempts from same IP in 5 minutes | High | Block IP, alert Security Champion |
| Privilege escalation | Non-admin account attempts admin operation | Critical | Terminate session, alert CISO |
| Data exfiltration | Bulk data export (> 1000 records) outside business hours | Critical | Block request, alert Security + DR Coordinator |
| Off-hours access | Admin access to production systems outside 07:00-22:00 SGT | Medium | Alert on-call engineer for verification |
| SQL injection attempt | Input matching SQL injection patterns on API endpoints | High | Block request, alert Security Champion |
| Unusual API traffic | API request rate > 3x normal baseline for 10 minutes | Medium | Rate limit, alert platform team |
| Certificate expiry | TLS certificate expires within 30 days | Medium | Alert Infrastructure Lead |

## Correlation Rules

Example correlation rule for detecting account takeover:

1. Failed login attempts (> 3) for a specific account within 10 minutes.
2. Followed by a successful login from a new IP address or device.
3. Followed by a high-value transaction or profile change within 30 minutes.
4. **Action**: Flag account for review, require step-up MFA, alert fraud team.

## Log Retention Requirements

| Log Type | Retention Period | Storage Tier | Regulatory Basis |
|----------|-----------------|-------------|-----------------|
| Audit logs | 7 years | S3 Glacier (after 90 days active) | MAS TRM 2023, SOX |
| Security event logs | 1 year | OpenSearch (90 days), S3 (1 year) | MAS TRM 2023 |
| Application logs | 90 days | CloudWatch (30 days), S3 (90 days) | Operational |
| Infrastructure logs | 90 days | CloudWatch (30 days), S3 (90 days) | Operational |
| Database logs | 90 days | CloudWatch | Operational |

All audit logs must be tamper-evident using CloudWatch Logs integrity validation.

## Dashboard Requirements

| Dashboard | Audience | Key Metrics |
|-----------|----------|-------------|
| Security Operations | Security Champion, CISO | Active alerts, failed logins, blocked IPs, incident timeline |
| Compliance | Compliance Team | Audit log coverage, retention status, regulatory alert summary |
| Platform Health | Engineering Team | Error rates, latency P95, service availability, deployment events |
| Executive | CTO, Board reporting | Risk posture summary, incident count, compliance status |

## Integration with Incident Response

1. SIEM alerts auto-create incidents in PagerDuty for SEV1/SEV2 triggers.
2. Alert context (log entries, correlation matches) is attached to the incident.
3. On-call engineer acknowledges within response SLA (15 min SEV1, 30 min SEV2).
4. Post-incident: SIEM logs preserved as evidence for root cause analysis.
5. MAS notification triggered within 1 hour if customer data is impacted.

## Document Control

| Field | Value |
|-------|-------|
| Owner | Security Champion / Platform Team |
| Review Frequency | Annual, or upon architecture changes |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | INTERNAL |
