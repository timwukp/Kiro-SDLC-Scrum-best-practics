---
inclusion: auto
name: mas-compliance
description: MAS Technology Risk Management guidelines for Singapore banking compliance
---
## MAS TRM 2023 — Key Requirements

### Availability & Resilience
- System availability target: ≥ 99.9%
- RTO: ≤ 4 hours for critical systems
- RPO: ≤ 1 hour for transaction data
- Annual disaster recovery testing required

### Data Protection
- Encryption: AES-256 at rest, TLS 1.3 in transit
- Key management via AWS KMS with automatic rotation
- Data residency: customer data in ap-southeast-1 only
- Cross-border data transfer requires explicit approval

### Access Management
- MFA for privileged access
- Quarterly access reviews for all system accounts
- Segregation of duties: developers cannot deploy to production
- Session timeout: 15 min internal, 5 min customer-facing

### Audit & Logging
- Audit log retention: minimum 5 years
- Tamper-evident logging (CloudWatch with integrity validation)
- Real-time alerting for suspicious activities

### Change Management
- All changes require documented approval (CAB for production)
- Emergency changes: post-implementation review within 48 hours
- Rollback plan mandatory for every production deployment

#[[file:docs/compliance/mas-trm-checklist.md]]
