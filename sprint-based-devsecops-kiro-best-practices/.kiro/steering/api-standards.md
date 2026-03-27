---
inclusion: fileMatch
fileMatchPattern: ["**/controller/**", "**/api/**", "**/*Controller.java", "**/*Resource.java", "docs/api/**"]
---
## Banking API Standards (Secure by Design)

### RESTful Conventions
- Base path: /api/v{version}/{resource}
- Plural nouns: /api/v1/accounts, /api/v1/transactions
- HTTP methods: GET (read), POST (create), PUT (full update), PATCH (partial), DELETE (soft-delete)
- Pagination: ?page=0&size=20&sort=createdAt,desc

### Security-First API Design
- All endpoints require authentication (JWT/OAuth2) — no anonymous access
- Rate limiting: 100 req/min customer, 1000 req/min internal
- Input validation on every endpoint — reject before processing
- Money fields as strings: { "amount": "1000.00", "currency": "SGD" }
- Security headers: X-Request-ID, X-Content-Type-Options, HSTS, CSP

### Error Response (never leak internals)
```json
{
  "requestId": "uuid",
  "timestamp": "ISO-8601",
  "status": 400,
  "error": "BAD_REQUEST",
  "message": "Human-readable message",
  "details": [{ "field": "amount", "reason": "Must be positive" }]
}
```
- Never expose stack traces, SQL errors, or internal paths in responses
- Log detailed errors server-side only

#[[file:docs/api/openapi-spec.yaml]]
