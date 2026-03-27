# OWASP Banking Security Checklist

## Authentication & Session Management
- [ ] Multi-factor authentication for all privileged operations
- [ ] JWT tokens: short-lived (15 min access, 7 day refresh)
- [ ] Refresh token rotation on every use
- [ ] Session invalidation on password change
- [ ] Brute force protection: exponential backoff + CAPTCHA after 3 failures
- [ ] Account lockout after 5 consecutive failures (30 min cooldown)

## Input Validation
- [ ] Server-side validation on ALL inputs (never trust client)
- [ ] Whitelist validation for known formats (NRIC, phone, email)
- [ ] Amount validation: positive, non-zero, within limits, correct precision
- [ ] SQL parameterized queries — no exceptions
- [ ] HTML output encoding for all user-supplied content

## Cryptography
- [ ] TLS 1.3 for all external communications
- [ ] AES-256-GCM for data at rest
- [ ] AWS KMS for key management (no local key storage)
- [ ] Key rotation: automatic, every 90 days
- [ ] No MD5 or SHA-1 — use SHA-256 minimum

## Logging & Monitoring
- [ ] Log authentication events (success and failure)
- [ ] Log all financial transactions with before/after state
- [ ] Never log PII, passwords, or full card numbers
- [ ] Tamper-evident log storage (CloudWatch with integrity)
- [ ] Real-time alerting for anomalous patterns
