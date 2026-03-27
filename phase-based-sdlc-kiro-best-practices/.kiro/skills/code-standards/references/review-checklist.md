# Code Review Checklist

## Correctness
- [ ] Logic handles all edge cases (null, empty, boundary values)
- [ ] Error handling is comprehensive (try-catch, error responses)
- [ ] Concurrency handled correctly (thread safety, optimistic locking)
- [ ] Idempotency implemented for state-changing operations

## Security
- [ ] Input validation on all external inputs
- [ ] SQL uses parameterized queries only
- [ ] No hardcoded credentials or secrets
- [ ] Authentication/authorization checks present
- [ ] PII properly encrypted/masked

## Performance
- [ ] No N+1 query patterns
- [ ] Database queries have appropriate indexes
- [ ] Pagination implemented for list endpoints
- [ ] No unnecessary object creation in loops

## Banking Domain
- [ ] Money calculations use BigDecimal
- [ ] Currency handling is explicit (no implicit defaults)
- [ ] Audit logging for all state changes
- [ ] Transaction boundaries are correct

## Standards
- [ ] Naming conventions followed
- [ ] License header present
- [ ] Javadoc/JSDoc on public APIs
- [ ] Import ordering correct
- [ ] No TODO/FIXME without JIRA reference
