---
name: test-strategy
description: Designing test strategies, writing test plans, and identifying test scenarios for banking features
---

# Test Strategy Skill

## When to Use
Invoke when planning test coverage for a new feature or reviewing test adequacy.

## Test Pyramid (Banking)
```
        /  E2E  \        ← Few: critical user journeys (login → transfer → verify)
       / Contract \      ← Medium: API contract validation against OpenAPI spec
      / Integration \    ← Medium: real DB (Testcontainers), real HTTP (WireMock)
     /    Unit       \   ← Many: business logic, validators, calculators
```

## Banking Test Scenario Categories
1. **Happy path**: Normal successful operation
2. **Boundary values**: Zero, negative, max amount, empty string
3. **Concurrency**: Simultaneous operations on same resource
4. **Idempotency**: Duplicate submission handling
5. **Timeout**: External service unavailable
6. **Authorization**: Unauthorized access attempts
7. **Data validation**: Invalid formats, SQL injection attempts
8. **Currency**: Multi-currency, rounding, conversion

## Coverage Targets
| Category | Line Coverage | Branch Coverage |
|----------|--------------|-----------------|
| Transaction logic | 95% | 95% |
| Authentication | 95% | 90% |
| API controllers | 80% | 80% |
| Utility classes | 80% | 70% |
| Configuration | 60% | N/A |
