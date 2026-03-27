---
name: api-contract
description: Designing, reviewing, and validating API contracts and OpenAPI specifications for banking services
---

# API Contract Skill

## When to Use
Invoke when designing new APIs, reviewing API contracts, or validating OpenAPI specs.

## API Design Process
1. Define resource model (nouns, not verbs)
2. Write OpenAPI 3.1 spec
3. Review with frontend and consuming teams
4. Generate server stubs and client SDKs
5. Implement and validate against spec (contract tests)

## Banking API Template (OpenAPI 3.1)
```yaml
openapi: 3.1.0
info:
  title: Account Service API
  version: 1.0.0
  description: Banking account management API
paths:
  /api/v1/accounts:
    get:
      summary: List customer accounts
      operationId: listAccounts
      security:
        - bearerAuth: []
      parameters:
        - name: page
          in: query
          schema: { type: integer, default: 0 }
        - name: size
          in: query
          schema: { type: integer, default: 20, maximum: 100 }
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/AccountListResponse'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '429':
          $ref: '#/components/responses/RateLimited'
```

## Validation Rules
- All endpoints require security scheme
- All responses include requestId and timestamp
- Error responses follow standard error schema
- Money fields use string type (not number)
- PII fields documented with x-pii: true extension
- Rate limiting headers documented
