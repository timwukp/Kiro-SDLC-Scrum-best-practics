---
inclusion: fileMatch
fileMatchPattern: ["**/controller/**", "**/api/**", "**/*Controller.java", "**/*Resource.java", "docs/api/**"]
---
## Banking API Standards

### RESTful Conventions
- Base path: /api/v{version}/{resource}
- Use plural nouns: /api/v1/accounts, /api/v1/transactions
- HTTP methods: GET (read), POST (create), PUT (full update), PATCH (partial), DELETE (soft-delete)
- Pagination: ?page=0&size=20&sort=createdAt,desc
- Filtering: ?status=ACTIVE&currency=SGD

### Request/Response Format
- Content-Type: application/json
- Date format: ISO 8601 (2025-07-15T10:30:00+08:00)
- Money fields: { "amount": "1000.00", "currency": "SGD" } — string for amount, never float
- All responses include: requestId, timestamp, status

### Error Response Structure
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

### Security Headers
- X-Request-ID: UUID for tracing
- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY
- Strict-Transport-Security: max-age=31536000; includeSubDomains
- Content-Security-Policy: default-src 'self'

### Rate Limiting
- Customer API: 100 requests/minute per client
- Internal API: 1000 requests/minute per service
- Return 429 with Retry-After header

### Versioning
- URL path versioning: /api/v1/, /api/v2/
- Deprecation: minimum 6 months notice, Sunset header in responses

#[[file:docs/api/openapi-spec.yaml]]
