---
name: security-audit
description: Perform security assessments, vulnerability scanning, and OWASP compliance checks for banking applications
---

# Security Audit Skill

## When to Use
Invoke for security reviews, vulnerability assessments, or compliance audits.

## OWASP Top 10 Checklist (Banking Focus)
1. **Injection**: SQL injection, command injection — parameterized queries only
2. **Broken Authentication**: Session management, MFA, password policies
3. **Sensitive Data Exposure**: PII encryption, PCI-DSS card masking
4. **XML External Entities**: Disable DTD processing
5. **Broken Access Control**: RBAC validation, privilege escalation checks
6. **Security Misconfiguration**: Default credentials, unnecessary services
7. **XSS**: Input sanitization, CSP headers, output encoding
8. **Insecure Deserialization**: Whitelist-based deserialization
9. **Known Vulnerabilities**: Snyk scan, dependency updates
10. **Insufficient Logging**: Audit trail completeness, tamper detection

## Banking-Specific Security Checks
- [ ] No hardcoded credentials (AKIA*, password=, private keys)
- [ ] PII encrypted at rest (AES-256) and in transit (TLS 1.3)
- [ ] Credit card numbers masked (show only last 4 digits)
- [ ] Audit logging for all state-changing operations
- [ ] Rate limiting on authentication endpoints
- [ ] Account lockout after 5 failed login attempts
- [ ] Session timeout: 15 min internal, 5 min customer-facing
