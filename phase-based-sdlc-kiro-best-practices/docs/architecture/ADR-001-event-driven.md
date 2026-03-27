# ADR-001: Event-Driven Architecture for Domain Events

## Status
Accepted

## Context
The banking platform needs to maintain data consistency across multiple services (Account, Transaction, Lending) while supporting real-time notifications, audit logging, and analytics. Synchronous inter-service calls create tight coupling and cascading failure risks.

## Decision
Adopt event-driven architecture using Amazon MSK (Kafka) for domain events. Each service publishes domain events when state changes occur. Consuming services subscribe to relevant topics.

## Consequences

### Positive
- Loose coupling between services
- Natural audit trail (events are the audit log)
- Supports CQRS for read-heavy analytics
- Resilient to temporary service outages (events buffered in Kafka)

### Negative
- Eventual consistency between services (not immediate)
- Increased operational complexity (Kafka cluster management)
- Event schema evolution requires careful versioning

### Risks
- Message ordering: use partition keys (account_id) for ordering guarantees
- Duplicate processing: implement idempotency keys in all consumers
- Schema drift: use Avro with Schema Registry for backward compatibility

## Compliance Impact
- MAS TRM §6.1: Event log provides complete audit trail
- Data residency: Kafka cluster in ap-southeast-1 only
