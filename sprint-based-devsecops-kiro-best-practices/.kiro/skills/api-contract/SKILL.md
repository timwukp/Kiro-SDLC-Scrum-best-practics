---
name: api-contract
description: Design secure API contracts with OpenAPI specifications and security-first patterns
---

# API Contract Skill (Secure by Design)

## When to Use
Invoke when designing new APIs or reviewing API contracts.

## Security-First API Design
1. All endpoints require authentication (bearerAuth)
2. Rate limiting defined per endpoint
3. Input validation schemas in OpenAPI spec
4. Money fields as strings (not numbers)
5. PII fields marked with x-pii: true extension
6. Error responses never expose internal details

## OpenAPI Security Template
```yaml
security:
  - bearerAuth: []
paths:
  /api/v1/accounts:
    get:
      security:
        - bearerAuth: [read:accounts]
      parameters:
        - name: page
          in: query
          schema: { type: integer, minimum: 0 }
      responses:
        '401': { $ref: '#/components/responses/Unauthorized' }
        '429': { $ref: '#/components/responses/RateLimited' }
```
