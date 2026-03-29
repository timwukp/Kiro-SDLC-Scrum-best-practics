# Third-Party Vendor Risk Register

> Reference: MAS TRM 2023 Section 9.3.1, PDPA Part IV

## Purpose

This register documents all third-party vendors that process, store, or transmit banking data. Each vendor is assessed for risk level, required controls, and review cadence per MAS Technology Risk Management guidelines.

## Vendor Risk Register

| Vendor | Service | Data Shared | Risk Level | Controls | Last Assessment | Next Review |
|--------|---------|-------------|------------|----------|----------------|-------------|
| Payment Gateway Provider | Payment processing | Transaction data, card tokens | High | PCI-DSS Level 1, tokenization, TLS 1.3 | YYYY-MM-DD | Annual |
| KYC/AML Provider | Identity verification | Customer PII (name, NRIC, address) | High | PDPA compliant, data residency ap-southeast-1, AES-256 encryption | YYYY-MM-DD | Annual |
| SWIFT/Messaging | Cross-border payments | Transaction details, beneficiary info | High | SWIFT CSP certified, message encryption, audit logging | YYYY-MM-DD | Annual |
| AWS (Infrastructure) | Cloud infrastructure | All data (compute, storage, networking) | Critical | SOC 2 Type II, ISO 27001, ap-southeast-1 region lock, KMS encryption | YYYY-MM-DD | Annual |
| Datadog | Observability and monitoring | Sanitized metrics, application logs (no PII) | Medium | SOC 2 Type II, no PII in telemetry, data scrubbing configured | YYYY-MM-DD | Annual |

## Vendor Onboarding Checklist

Before onboarding any new vendor, complete the following:

- [ ] **Security assessment**: Vendor provides SOC 2 Type II or ISO 27001 certification
- [ ] **Data classification review**: Identify all data shared and classify per policy (PUBLIC, INTERNAL, CONFIDENTIAL, RESTRICTED)
- [ ] **Contract review**: Legal review of data processing agreement, liability clauses, and SLAs
- [ ] **Data residency verification**: Confirm vendor stores/processes customer data in ap-southeast-1 (Singapore) only
- [ ] **Incident notification clause**: Contract requires vendor to notify within 1 hour of any security incident affecting our data
- [ ] **Right to audit**: Contract includes right-to-audit clause for compliance inspections
- [ ] **Exit strategy**: Data return/destruction procedures documented in contract
- [ ] **Regulatory approval**: MAS notification for material outsourcing arrangements (if applicable)

## Ongoing Monitoring Requirements

| Activity | Frequency | Responsible |
|----------|-----------|-------------|
| Full vendor risk reassessment | Annual | Security Champion + Compliance |
| Quarterly compliance status check | Quarterly | Security Champion |
| SOC 2 / ISO 27001 certificate renewal verification | Annual | Compliance |
| Incident notification response drill | Annual | Engineering + Vendor |
| Data residency audit (ap-southeast-1 verification) | Semi-annual | Infrastructure Lead |
| PCI-DSS compliance validation (payment vendors) | Annual | Compliance |

## Incident Notification Requirements

- Vendor must notify the bank within **1 hour** of detecting any security incident affecting shared data.
- Bank must notify MAS within **1 hour** if customer data is impacted (MAS TRM 2023).
- Post-incident review with vendor required within **48 hours**.
- Root cause analysis and remediation plan due from vendor within **2 weeks**.

## Data Residency Requirements

All customer data must remain within ap-southeast-1 (Singapore) per PDPA and MAS TRM requirements. Vendors must:

- Confirm data processing location in writing before onboarding.
- Provide evidence of data residency controls during annual assessment.
- Notify immediately if data is transferred outside approved region.
- Cross-border data transfer requires explicit approval from CISO and Legal.

## Document Control

| Field | Value |
|-------|-------|
| Owner | Security Champion / Compliance Team |
| Review Frequency | Annual, or upon vendor onboarding/offboarding |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | CONFIDENTIAL |
