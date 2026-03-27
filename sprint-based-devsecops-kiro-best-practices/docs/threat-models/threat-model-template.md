# Threat Model Template

## Feature: [Feature Name]
**Sprint:** [N] | **Date:** [YYYY-MM-DD] | **Security Champion:** [Name]

## Data Flow
```
User → Browser → API Gateway (JWT) → Service → Database
                                    → Kafka → Consumer
```

## STRIDE Analysis
| # | Threat | Category | Likelihood | Impact | Risk | Mitigation |
|---|--------|----------|-----------|--------|------|------------|
| 1 | Token forgery | Spoofing | Low | High | Medium | JWT RS256 + short expiry |
| 2 | Amount tampering | Tampering | Medium | High | High | Server-side validation |
| 3 | Missing audit log | Repudiation | Low | High | Medium | Audit every state change |
| 4 | PII in error response | Info Disclosure | Medium | High | High | Sanitize error responses |
| 5 | API flood | DoS | High | Medium | High | Rate limiting + WAF |
| 6 | IDOR on accounts | Elevation | Medium | Critical | Critical | Ownership check on every request |

## Security Stories Generated
- [ ] BANK-SEC-001: Implement rate limiting on transfer API (P1, 3 pts)
- [ ] BANK-SEC-002: Add IDOR protection to account endpoints (P0, 5 pts)

## Residual Risks
- [Accepted risks with justification and review date]
