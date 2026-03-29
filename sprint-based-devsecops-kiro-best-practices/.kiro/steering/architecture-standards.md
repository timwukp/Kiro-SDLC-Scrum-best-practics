---
inclusion: auto
name: architecture-standards
description: Architecture standards, decisions, system design, Zero Trust architecture, or threat modeling
---
## Banking Architecture Standards (Secure by Design)

### Architecture Principles
1. Zero Trust: never trust, always verify — even internal services
2. Domain-Driven Design: bounded contexts per banking domain
3. Event-driven: state changes publish domain events to Kafka
4. API-first: OpenAPI spec before implementation
5. Defense in depth: multiple security layers, not single perimeter
6. Twelve-Factor App compliance

### Zero Trust Architecture
- Service-to-service: mTLS for all internal communication
- API Gateway: JWT validation + rate limiting at edge
- Database: application accounts are read-only, write via migrations
- Secrets: rotated automatically via AWS Secrets Manager
- Network: private subnets, no direct internet access for services

### Service Boundaries
| Domain | Service | Events Published |
|--------|---------|-----------------|
| Account | account-service | AccountCreated, AccountUpdated, AccountClosed |
| Transaction | transaction-service | TransactionInitiated, TransactionCompleted, TransactionFailed |
| Lending | lending-service | LoanApplied, LoanApproved, LoanDisbursed |
| Auth | auth-service | UserLoggedIn, UserLockedOut, MFAVerified |
| Notification | notification-service | NotificationSent, NotificationFailed |

### Non-Functional Requirements
- Latency: P95 < 200ms for API responses
- Throughput: 10,000 TPS for transaction processing
- Availability: 99.99% for transaction API
- Data consistency: eventual between services, strong within service

#[[file:docs/architecture/ADR-001-event-driven.md]]
