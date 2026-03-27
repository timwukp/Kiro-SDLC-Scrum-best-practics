---
inclusion: fileMatch
fileMatchPattern: ["**/*.test.*", "**/*.spec.*", "**/*Test.java", "**/*IT.java", "test/**"]
---
## Banking Testing Standards (Automated Quality Engineering)

### Coverage Requirements
- Unit test coverage: ≥ 80% line coverage
- Critical paths (transactions, auth): ≥ 95% branch coverage
- Security regression tests: every fixed vulnerability gets a test
- No deployment without full test suite + security scans passing

### Test Categories
- Unit: @Tag("unit") — fast, no external deps, mock everything
- Integration: @Tag("integration") — real DB (Testcontainers), real HTTP
- Contract: @Tag("contract") — API validation against OpenAPI spec
- Security: @Tag("security") — OWASP test cases, injection attempts
- Performance: @Tag("performance") — P95 < 200ms

### Security Regression Testing
- Every fixed vulnerability gets a regression test
- Test that the fix holds across future Sprints
- Include in CI pipeline — runs on every commit
- Categories: injection, auth bypass, data exposure, XSS

### Banking-Specific Test Scenarios
- Boundary values: zero, negative, max amount (999,999,999.99)
- Currency edge cases: multi-currency transfers, rounding
- Concurrency: simultaneous transfers (optimistic locking)
- Idempotency: duplicate submission must not double-process
- Timeout: external service timeout handling

### Test Data
- Use factories/builders — never hardcode inline
- PII in tests: obviously fake data ("John Doe", "S1234567A")
- Non-production databases use masked/synthetic data
