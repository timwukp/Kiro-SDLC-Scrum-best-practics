---
inclusion: always
---
## Banking Platform — Product Context

### Business Domain
- Core Banking System: Account management, transactions, payments, lending
- Customer channels: Web portal (React), Mobile API, Branch systems
- Regulatory jurisdiction: MAS (Singapore), with PCI-DSS and SOX compliance

### Business Rules
- All monetary calculations use BigDecimal — never floating point
- Transaction amounts must be validated: positive, non-zero, within account limits
- All customer-facing operations require audit trail logging
- Data retention: 7 years minimum for financial records
- Multi-currency support: SGD, USD, HKD, JPY, AUD

### Stakeholders
- Retail Banking Division (account holders)
- Treasury & Risk Management
- Compliance & Legal
- IT Operations

### Definition of Done
- Code reviewed by at least one peer
- Unit test coverage ≥ 80%
- No critical/high Snyk vulnerabilities
- Compliance checklist signed off
- API documentation updated in Confluence
