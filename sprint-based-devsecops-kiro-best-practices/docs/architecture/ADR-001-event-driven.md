# ADR-001: Event-Driven Architecture for Domain Events

## Status
Accepted

## Context
The banking platform needs data consistency across multiple services while supporting real-time notifications, audit logging, and analytics. Synchronous inter-service calls create tight coupling and cascading failure risks.

## Decision
Adopt event-driven architecture using Amazon MSK (Kafka) for domain events. Each service publishes domain events when state changes occur.

## Consequences
- Positive: Loose coupling, natural audit trail, resilient to temporary outages
- Negative: Eventual consistency, increased operational complexity
- Risks: Message ordering (use partition keys), duplicate processing (idempotency keys)

## Compliance Impact
- MAS TRM §6.1: Event log provides complete audit trail
- Data residency: Kafka cluster in ap-southeast-1 only
