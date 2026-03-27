---
inclusion: fileMatch
fileMatchPattern: ["**/*.test.*", "**/*.spec.*", "**/*Test.java", "**/*IT.java", "test/**"]
---
## Banking Testing Standards

### Coverage Requirements
- Unit test coverage: ≥ 80% line coverage
- Critical paths (transactions, auth): ≥ 95% branch coverage
- Integration tests for all API endpoints
- No deployment without passing full test suite

### Test Naming
- Java: methodName_givenCondition_expectedResult (e.g., transfer_givenInsufficientBalance_throwsException)
- TypeScript: describe("ComponentName") → it("should do X when Y")

### Test Categories
- Unit tests: @Tag("unit") — fast, no external dependencies, mock everything
- Integration tests: @Tag("integration") — real DB (Testcontainers), real HTTP
- Contract tests: @Tag("contract") — API contract validation against OpenAPI spec
- Performance tests: @Tag("performance") — response time < 200ms for P95

### Banking-Specific Test Scenarios
- Boundary values: zero amount, negative amount, max amount (999,999,999.99)
- Currency edge cases: multi-currency transfers, rounding rules
- Concurrency: simultaneous transfers from same account (optimistic locking)
- Idempotency: duplicate transaction submission must not double-process
- Timeout: external service timeout handling (payment gateway, KYC provider)

### Test Data
- Use factories/builders — never hardcode test data inline
- PII in tests must use obviously fake data: "John Doe", "S1234567A"
- Financial test data: use known calculation results for verification

### Mocking Rules
- Mock external services (payment gateway, KYC, email)
- Never mock the repository layer in integration tests
- Use WireMock for HTTP service simulation
- Use Testcontainers for database integration tests
