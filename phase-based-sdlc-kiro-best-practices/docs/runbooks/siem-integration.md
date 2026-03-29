# SIEM Integration Documentation

## Overview
Security Information and Event Management (SIEM) integration for centralized security monitoring, threat detection, and compliance reporting.

## Architecture
```
Application Logs → CloudWatch Logs → Kinesis Firehose → SIEM
Audit Events    → CloudWatch Logs → Kinesis Firehose → SIEM
VPC Flow Logs   → CloudWatch Logs → Kinesis Firehose → SIEM
CloudTrail      → S3 → SIEM Collector
WAF Logs        → Kinesis Firehose → SIEM
```

## Log Sources
| Source | Log Type | Retention (SIEM) | Retention (Archive) |
|--------|----------|-----------------|---------------------|
| Application (Spring Boot) | Structured JSON | 90 days hot | 7 years S3 Glacier |
| Audit Events | Structured JSON | 1 year hot | 7 years S3 Glacier |
| CloudTrail | API activity | 90 days hot | 7 years S3 Glacier |
| VPC Flow Logs | Network traffic | 30 days hot | 1 year S3 |
| WAF Logs | Web attack attempts | 90 days hot | 1 year S3 |
| Database Audit | PostgreSQL audit | 90 days hot | 7 years S3 Glacier |

## Detection Rules
| Rule | Severity | Trigger | Action |
|------|----------|---------|--------|
| Brute force login | High | >5 failed logins in 5 min from same IP | Alert + auto-block IP |
| Privilege escalation | Critical | Non-admin accessing admin endpoints | Alert + isolate session |
| Data exfiltration | Critical | >1000 records queried in 1 min | Alert + rate limit |
| SQL injection attempt | High | WAF SQL injection signature match | Alert + block request |
| Anomalous API usage | Medium | API calls >3 std dev from baseline | Alert for investigation |
| Off-hours admin access | Medium | Admin API calls outside 07:00-22:00 SGT | Alert for verification |

## Correlation Rules
- Failed login → successful login from different IP within 10 min → account takeover alert
- New IAM role creation → immediate API calls from that role → insider threat alert
- Multiple services returning 500 → correlated with deployment event → deployment failure alert

## Compliance Dashboards
| Dashboard | Audience | Refresh |
|-----------|----------|---------|
| Security Operations | SOC team | Real-time |
| MAS TRM Compliance | CISO | Weekly |
| PCI-DSS Audit Trail | Compliance | Monthly |
| Incident Timeline | Incident responders | On-demand |

## MAS TRM Alignment
- §8.4.1: Real-time alerting for suspicious activities — covered by detection rules
- §10.2.1: Audit log integrity — CloudWatch integrity validation + S3 object lock
- §10.4.1: Log retention minimum 7 years — S3 Glacier lifecycle policy
