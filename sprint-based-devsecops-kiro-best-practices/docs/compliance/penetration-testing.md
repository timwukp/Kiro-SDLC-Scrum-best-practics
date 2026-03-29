# Penetration Testing Program

> Reference: MAS TRM 2023 Section 8.3.1, PCI-DSS Requirement 11.3

## Scope

Annual full-scope and quarterly targeted penetration testing of all banking platform systems, covering external, internal, and application-layer attack surfaces.

### In Scope

| Layer | Targets |
|-------|---------|
| External | Public API endpoints, web portal, mobile API, CDN/CloudFront |
| Internal | Service-to-service communication, Kafka brokers, internal APIs |
| Application | Business logic (transaction processing, auth flows, lending workflows) |
| Infrastructure | ECS Fargate, Aurora PostgreSQL, ElastiCache Redis, VPC configuration |
| Social Engineering | Phishing simulation (annual, coordinated with HR) |

### Out of Scope

- Third-party vendor systems (covered by vendor risk assessments)
- Physical security testing
- Production data manipulation (use staging with synthetic data)

## Testing Schedule

| Period | Test Type | Focus Area | Duration |
|--------|-----------|-----------|----------|
| Q1 (Annual) | Full penetration test | All layers: external, internal, application | 3-4 weeks |
| Q2 | Targeted test | API security and authentication flows | 1-2 weeks |
| Q3 | Targeted test | Infrastructure and network segmentation | 1-2 weeks |
| Q4 | Targeted test | Application logic and new features from prior Sprints | 1-2 weeks |

## Vendor Requirements

| Requirement | Minimum Standard |
|-------------|-----------------|
| Certification | CREST accredited or OSCP certified testers |
| Banking Experience | Minimum 3 years financial services pen testing |
| Confidentiality | NDA executed before engagement; no data leaves Singapore |
| Location | Singapore-based team or approved remote with VPN to SG |
| Methodology | OWASP Testing Guide, PTES, or NIST SP 800-115 |
| Insurance | Professional indemnity insurance >= S$5M |
| Reporting | Draft report within 5 business days of test completion |

## Findings Classification and Remediation SLAs

| Severity | Definition | Remediation SLA | Retest Required |
|----------|-----------|----------------|-----------------|
| Critical | Remote code execution, authentication bypass, data breach risk | 48 hours | Yes (mandatory) |
| High | Privilege escalation, SQL injection, sensitive data exposure | 1 Sprint (2 weeks) | Yes (mandatory) |
| Medium | XSS, CSRF, information disclosure, misconfiguration | 2 Sprints (4 weeks) | Recommended |
| Low | Minor information leakage, best practice deviations | Backlog (next quarter) | No |

## Rules of Engagement

1. Testing window: business hours (09:00-18:00 SGT) unless otherwise agreed.
2. Use designated staging environment with synthetic data only.
3. No denial-of-service testing against production systems.
4. Immediately report any critical findings (do not wait for final report).
5. All testing traffic must originate from pre-approved IP ranges.
6. Stop testing if unintended data access or system instability occurs.
7. Preserve evidence chain for all findings (screenshots, request/response logs).

## Reporting Requirements

### Executive Summary Report
- Overall risk posture assessment (Critical/High/Medium/Low)
- Key findings summary with business impact
- Comparison with previous test results (trend analysis)
- Strategic recommendations for risk reduction

### Technical Findings Report
- Finding ID, severity, CVSS score, CWE reference
- Affected system/endpoint and reproduction steps
- Evidence (screenshots, HTTP request/response)
- Recommended remediation with code examples where applicable
- OWASP Top 10 and MAS TRM mapping

## Retest Process

- Critical and High findings require mandatory retesting after remediation.
- Retest must be performed by the same testing vendor.
- Retest results documented and included in the final report.
- Unresolved Critical findings block production deployment.

## Compliance References

- **MAS TRM 2023 Section 8.3.1**: Penetration testing conducted annually
- **PCI-DSS Requirement 11.3**: Annual penetration testing of cardholder data environment
- **OWASP Testing Guide**: [owasp.org/www-project-web-security-testing-guide](https://owasp.org/www-project-web-security-testing-guide/)

## Document Control

| Field | Value |
|-------|-------|
| Owner | CISO / Security Champion |
| Review Frequency | Annual, or after each penetration test cycle |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | CONFIDENTIAL |
