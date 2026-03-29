# Disaster Recovery Plan

> Reference: MAS TRM 2023 Section 7.3.1, PCI-DSS Requirement 12.10

## Scope

This plan covers disaster recovery for all critical banking systems including Account Service, Transaction Service, Auth Service, Lending Service, and supporting infrastructure (Aurora PostgreSQL, Amazon MSK, ElastiCache Redis, ECS Fargate).

## Recovery Objectives

| Objective | Target | Regulatory Basis |
|-----------|--------|-----------------|
| Recovery Time Objective (RTO) | <= 4 hours | MAS TRM 2023 |
| Recovery Point Objective (RPO) | <= 1 hour | MAS TRM 2023 |
| System Availability | >= 99.9% | MAS TRM 2023 |
| Data Residency | ap-southeast-1 (Singapore) | PDPA, MAS TRM |

## Annual DR Test Schedule

| Quarter | Test Type | Scope | Duration |
|---------|-----------|-------|----------|
| Q1 | Tabletop exercise | All teams review procedures and roles | 1 day |
| Q2 | Full DR simulation | Complete failover of all critical systems | 2 days |
| Q3 | Targeted test: Database failover | Aurora PostgreSQL primary/replica switchover | 4 hours |
| Q4 | Targeted test: Cross-region switchover | Service recovery in secondary region | 1 day |

## DR Test Procedures

### 1. Database Failover

1. Initiate Aurora PostgreSQL planned failover to read replica.
2. Verify all services reconnect within connection pool timeout (30 seconds).
3. Validate data integrity: compare row counts and checksums on critical tables.
4. Confirm RPO met: verify last committed transaction is present on new primary.
5. Test write operations on new primary.
6. Restore original primary and re-establish replication.

### 2. Service Recovery (ECS Fargate)

1. Simulate service failure by terminating all tasks in target service.
2. Verify ECS auto-recovery launches replacement tasks within 2 minutes.
3. Confirm health checks pass on all replacement tasks.
4. Validate end-to-end transaction flow through recovered service.
5. Verify no duplicate transaction processing (idempotency check).

### 3. Cross-Region Switchover

1. Simulate primary region (ap-southeast-1) unavailability.
2. Execute Route 53 failover to secondary region.
3. Activate Aurora Global Database secondary cluster as primary.
4. Deploy services to secondary region ECS cluster.
5. Verify all API endpoints respond within RTO target.
6. Validate data consistency between regions.
7. Confirm data residency compliance in failover region.

### 4. Data Integrity Validation

1. Run checksum comparison on all financial tables (accounts, transactions, ledger).
2. Verify audit log continuity: no gaps in sequence numbers.
3. Confirm encryption at rest (AES-256) is active on restored databases.
4. Validate backup integrity by restoring a point-in-time snapshot.

## Roles and Responsibilities

| Role | Responsibility | Contact |
|------|---------------|---------|
| DR Coordinator | Oversees DR test execution, reports to management | On-call Engineering Manager |
| Database Lead | Executes database failover procedures | @core-banking-oncall |
| Infrastructure Lead | Manages ECS, networking, and DNS failover | @devops-oncall |
| Security Champion | Validates encryption, access controls post-recovery | Security Champion |
| QA Lead | Executes data integrity validation scripts | QA Team Lead |

## Communication Plan

| Event | Channel | Audience | Timing |
|-------|---------|----------|--------|
| DR test start | Slack #incident-channel + email | All engineering | 48 hours before |
| Status updates | Slack #incident-channel | All engineering | Every 30 minutes during test |
| DR test completion | Email + Confluence report | Engineering + Management | Within 24 hours |
| MAS notification (if real event) | Regulatory filing | MAS | Within 1 hour if customer data impacted |

## Post-Test Review

- Conduct within **2 weeks** of each DR test.
- Document: actual RTO/RPO achieved, deviations from plan, issues encountered.
- Update DR procedures based on lessons learned.
- Track remediation items in Jira with due dates.

## Success Criteria

| Criterion | Target |
|-----------|--------|
| RTO achieved | <= 4 hours |
| RPO achieved | <= 1 hour |
| Data integrity validated | Zero data loss on financial tables |
| All critical services recovered | 100% of services operational |
| Communication plan executed | All stakeholders notified per schedule |
| No customer data exposure | Zero security incidents during test |

## Document Control

| Field | Value |
|-------|-------|
| Owner | DR Coordinator / Engineering Manager |
| Review Frequency | Annual, or after each DR test |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | CONFIDENTIAL |
