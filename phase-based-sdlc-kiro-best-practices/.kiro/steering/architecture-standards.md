---
inclusion: auto
name: architecture-review
description: Architecture decisions, system design, or technical design reviews
---
## Banking Architecture Standards

### Architecture Principles
1. Domain-Driven Design: bounded contexts per banking domain
2. Event-driven: state changes publish domain events to Kafka
3. CQRS for transaction-heavy domains (separate read/write models)
4. API-first: OpenAPI spec before implementation
5. Twelve-Factor App compliance

### Service Boundaries
| Domain | Service | Database | Events Published |
|--------|---------|----------|-----------------|
| Account | account-service | accounts-db | AccountCreated, AccountUpdated, AccountClosed |
| Transaction | transaction-service | transactions-db | TransactionInitiated, TransactionCompleted, TransactionFailed |
| Lending | lending-service | lending-db | LoanApplied, LoanApproved, LoanDisbursed |
| Auth | auth-service | auth-db | UserLoggedIn, UserLockedOut, MFAVerified |
| Notification | notification-service | (stateless) | NotificationSent, NotificationFailed |

### Architecture Decision Records (ADRs)
- All significant decisions documented in docs/architecture/ADR-{NNN}.md
- Format: Context → Decision → Consequences → Status
- Status lifecycle: Proposed → Accepted → Deprecated → Superseded

### Non-Functional Requirements
- Latency: P95 < 200ms for API responses
- Throughput: 10,000 TPS for transaction processing
- Scalability: horizontal scaling via ECS auto-scaling
- Data consistency: eventual consistency between services, strong within service

### Integration Patterns
- Synchronous: REST for queries, gRPC for internal service-to-service
- Asynchronous: Kafka for domain events, SQS for task queues
- External: payment gateway (REST + webhook), KYC provider (REST), SWIFT (MQ)

#[[file:docs/architecture/ADR-001-event-driven.md]]
