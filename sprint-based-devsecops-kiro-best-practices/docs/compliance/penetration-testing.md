# Penetration Testing Program

## MAS TRM §8.3.1 / PCI-DSS Requirement 11 Compliance

### Annual Penetration Test Schedule
- **Frequency:** Annual (minimum), plus after significant infrastructure changes
- **Scope:** All customer-facing APIs, web portal, mobile API, internal services
- **Vendor:** [Approved third-party pen test vendor]
- **Next Scheduled Test:** [YYYY-MM-DD]

### Pen Test Scope
| Target | Type | Frequency |
|--------|------|-----------|
| External APIs (/api/v1/*) | Black-box | Annual |
| Web Portal (React) | Grey-box | Annual |
| Mobile API | Grey-box | Annual |
| Internal Services | White-box | Annual |
| Infrastructure (AWS) | Grey-box | Annual |
| Social Engineering | Phishing simulation | Semi-annual |

### Methodology
- OWASP Testing Guide v4.2
- PTES (Penetration Testing Execution Standard)
- NIST SP 800-115

### Remediation SLAs
| Severity | Remediation SLA | Retest |
|----------|----------------|--------|
| Critical | 7 days | Within 14 days |
| High | 30 days | Within 45 days |
| Medium | 90 days | Next annual test |
| Low | 180 days | Next annual test |

### Reporting
- Executive summary for board/management
- Technical findings with CVSS scores
- Remediation recommendations
- Retest confirmation for Critical/High findings
- Report retained for 7 years (MAS TRM compliance)
