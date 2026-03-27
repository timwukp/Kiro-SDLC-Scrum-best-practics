---
inclusion: always
---
## Banking Security Policy (DevSecOps Shift-Left)

### Core Principle: Security is Everyone's Job
- Security is not a phase — it is continuous throughout every Sprint
- Every developer runs security scans before pushing code
- Security stories are first-class citizens in the Product Backlog
- The Security Champion participates in Sprint Planning for threat modeling

### Production Environment Protection
- NEVER directly modify files under config/prod/ or deploy-prod workflows
- All production changes require CAB approval via prod-change-request skill
- Credentials must come from AWS Secrets Manager — never hardcoded

### Credential Rules
- No AWS Access Keys (AKIA*) in source code
- No database passwords or connection strings with credentials
- No private keys (-----BEGIN RSA/PRIVATE)
- No API tokens or secret_key= patterns
- Use ${VAR_NAME} environment variable references only

### Data Protection (PDPA / PCI-DSS)
- PII fields (name, NRIC, phone, email, address) encrypted at rest
- Credit card numbers: mask all but last 4 digits in logs and UI
- Never log full request/response bodies containing PII
- Data classification: PUBLIC, INTERNAL, CONFIDENTIAL, RESTRICTED
- Non-production databases use masked/synthetic data only

### CI/CD Security Gates (Automated)
1. Pre-commit: git-secrets scan for credentials
2. Build: SAST (SonarQube) + dependency scan (Snyk)
3. Test: DAST (OWASP ZAP) against staging
4. Deploy: Container image scan (Snyk Container)
5. Runtime: Datadog security monitoring + anomaly detection

### Audit Requirements
- All state-changing operations produce an audit event
- Audit events: who, what, when, where, before-state, after-state
- Audit logs are immutable — append-only to CloudWatch/S3
- Retention: 7 years minimum

#[[file:config/prod/protected-paths.json]]
