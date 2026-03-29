---
name: sprint-security-review
description: Conduct Sprint Review security demonstrations, Green Build reports, and security metrics presentation
---

# Sprint Security Review Skill

## When to Use
Invoke when preparing for Sprint Review to demonstrate security alongside features.

## Sprint Review Security Checklist
1. **Green Build Report** — show all pipeline stages passed
2. **Security Scan Summary** — SAST/DAST/dependency findings resolved
3. **Security Stories Completed** — demo security controls implemented
4. **Metrics Dashboard** — security KPIs for the Sprint

## Green Build Report Template
```markdown
# Sprint [N] — Green Build Report

## Pipeline Status: ✅ ALL PASSED
| Stage | Status | Details |
|-------|--------|---------|
| SAST (SonarQube) | ✅ Pass | 0 High/Critical, 3 Medium (accepted) |
| DAST (OWASP ZAP) | ✅ Pass | 0 High/Critical |
| Dependency Scan (Snyk) | ✅ Pass | 0 Critical CVEs |
| Container Scan | ✅ Pass | Base image up to date |
| Unit Tests | ✅ Pass | 87% coverage |
| Integration Tests | ✅ Pass | 42/42 passing |

## Security Stories Completed
- [BANK-301] Input validation on transfer API — Done
- [BANK-302] Rate limiting on auth endpoints — Done

## Security Metrics
- Mean Time to Remediate (High): 2.3 days
- False Positive Rate: 12% (down from 18%)
- Security Debt: 5 Medium items in backlog
```
