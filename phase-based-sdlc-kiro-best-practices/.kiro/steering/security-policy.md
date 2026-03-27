---
inclusion: always
---
## Banking Security Policy

### Production Environment Protection
- NEVER directly modify files under config/prod/, infra/lib/*Prod*, or deploy-prod workflows
- All production changes must go through the prod-change-request skill and CAB approval
- Credentials must come from AWS Secrets Manager — never hardcoded in source

### Credential Rules
- No AWS Access Keys (AKIA*) in source code
- No database passwords, connection strings with credentials
- No private keys (-----BEGIN RSA/PRIVATE)
- No API tokens or secret_key= patterns
- Use ${VAR_NAME} environment variable references only

### Data Protection (PDPA / PCI-DSS)
- PII fields (name, NRIC, phone, email, address) must be encrypted at rest
- Credit card numbers: mask all but last 4 digits in logs and UI
- Never log full request/response bodies containing PII
- Data classification: PUBLIC, INTERNAL, CONFIDENTIAL, RESTRICTED

### Access Control
- Principle of least privilege for all service accounts
- API endpoints require authentication (JWT/OAuth2)
- Admin operations require MFA
- Database access: read-only for application accounts; write via migration scripts only

### Audit Requirements
- All state-changing operations must produce an audit event
- Audit events: who, what, when, where, before-state, after-state
- Audit logs are immutable — append-only to CloudWatch/S3
- Retention: 7 years minimum

#[[file:config/prod/protected-paths.json]]
