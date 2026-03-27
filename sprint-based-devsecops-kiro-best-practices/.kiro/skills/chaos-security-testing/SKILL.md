---
name: chaos-security-testing
description: Proactive security chaos engineering — AI agent attempts to hack the Sprint output and reports findings to the team
---

# Chaos Security Testing Skill

## When to Use
Invoke during or after Sprint development to proactively test the Sprint's output for security weaknesses. The AI agent acts as a "friendly hacker" trying to break the system.

## Chaos Security Test Categories

### 1. Authentication Chaos
- Attempt to access endpoints without valid JWT
- Try expired/malformed tokens
- Test session fixation and hijacking scenarios
- Brute force login with rate limiting verification

### 2. Authorization Chaos
- Attempt IDOR: access another user's account by changing IDs
- Try privilege escalation: regular user accessing admin endpoints
- Test horizontal access: user A accessing user B's transactions

### 3. Input Chaos
- SQL injection payloads on all input fields
- XSS payloads in text fields, headers, query params
- Command injection via file upload names
- Oversized payloads to test input validation limits
- Unicode/encoding attacks

### 4. Data Exposure Chaos
- Check error responses for stack traces or internal paths
- Verify PII is masked in logs and responses
- Test for information leakage in HTTP headers
- Check if debug endpoints are exposed

### 5. Resilience Chaos
- Simulate external service timeout (payment gateway, KYC)
- Test circuit breaker behavior under load
- Verify graceful degradation when database is slow
- Test rate limiting under burst traffic

## Output Format (for Daily Scrum / Sprint Review)
```markdown
# Chaos Security Test Report — Sprint [N]

## Tests Executed: [X]
## Vulnerabilities Found: [Y]

| # | Test | Category | Result | Severity | Details |
|---|------|----------|--------|----------|---------|
| 1 | IDOR on /accounts/{id} | AuthZ | FAIL | Critical | Can access other users' accounts |
| 2 | SQL injection on /search | Input | PASS | - | Parameterized queries working |
| 3 | Expired JWT access | AuthN | PASS | - | Returns 401 correctly |

## Recommended Sprint Backlog Items
- [ ] BANK-SEC-XXX: Fix IDOR on account endpoints (P0)
```
