---
name: security-audit
description: Performing OWASP Top 10 security assessments, vulnerability scanning, and PCI-DSS compliance checks
---

# Security Audit Skill

## When to Use
Invoke for security reviews, vulnerability assessments, or compliance audits.

## OWASP Top 10 Checklist (Banking Focus)
1. Injection: parameterized queries only
2. Broken Authentication: session management, MFA, password policies
3. Sensitive Data Exposure: PII encryption, PCI-DSS card masking
4. XML External Entities: disable DTD processing
5. Broken Access Control: RBAC validation, privilege escalation
6. Security Misconfiguration: default credentials, unnecessary services
7. XSS: input sanitization, CSP headers, output encoding
8. Insecure Deserialization: whitelist-based deserialization
9. Known Vulnerabilities: Snyk scan, dependency updates
10. Insufficient Logging: audit trail completeness

## Banking-Specific Checks
- [ ] No hardcoded credentials
- [ ] PII encrypted at rest (AES-256) and in transit (TLS 1.3)
- [ ] Credit card numbers masked (last 4 digits only)
- [ ] Audit logging for all state-changing operations
- [ ] Rate limiting on authentication endpoints
- [ ] Account lockout after 5 failed attempts
- [ ] Session timeout: 15 min internal, 5 min customer-facing
