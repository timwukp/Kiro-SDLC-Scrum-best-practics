# Third-Party Vendor Risk Register

## MAS TRM §9.3.1 Compliance

### Risk Assessment Frequency
- **Full Assessment:** Annual for all Critical/High vendors
- **Continuous Monitoring:** Quarterly review of vendor security posture
- **Incident Review:** Within 48 hours of vendor security incident

### Vendor Register

| Vendor | Service | Risk Tier | Data Access | Last Assessment | Next Assessment | Status |
|--------|---------|-----------|-------------|-----------------|-----------------|--------|
| Payment Gateway Provider | Card processing, settlements | Critical | PCI data, transaction amounts | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| KYC/AML Provider | Identity verification | Critical | PII (NRIC, name, address) | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| SWIFT Network | International transfers | Critical | Transaction data | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| Cloud Provider (AWS) | Infrastructure | Critical | All data | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| Datadog | Monitoring/observability | High | Logs, metrics (no PII) | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| SonarQube | SAST scanning | Medium | Source code | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |
| Snyk | Dependency/container scanning | Medium | Source code, dependencies | [YYYY-MM-DD] | [YYYY-MM-DD] | Active |

### Risk Tier Classification
| Tier | Criteria | Assessment Depth |
|------|----------|-----------------|
| Critical | Handles PII/PCI data, or service outage causes customer impact | Full SOC 2 Type II + pen test results + BCP review |
| High | Access to internal systems or non-PII data | SOC 2 Type II + security questionnaire |
| Medium | Development tools, no production data access | Security questionnaire + contract review |
| Low | Non-technical vendors | Contract review only |

### Required Vendor Controls
- Data encryption in transit (TLS 1.2+) and at rest
- Access logging and audit trail
- Incident notification within 24 hours
- Data residency compliance (Singapore for customer data)
- Annual penetration testing
- Business continuity plan
