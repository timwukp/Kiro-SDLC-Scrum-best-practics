# Disaster Recovery Testing Documentation

## MAS TRM §7.3.1 Compliance

### DR Testing Schedule
- **Frequency:** Annual (minimum), with tabletop exercises quarterly
- **Next Scheduled Test:** [YYYY-MM-DD]
- **Last Completed Test:** [YYYY-MM-DD]

### DR Test Scope
| System | RTO Target | RPO Target | Test Method |
|--------|-----------|-----------|-------------|
| Transaction API | 4 hours | 1 hour | Full failover to DR region |
| Account API | 4 hours | 1 hour | Full failover to DR region |
| Auth Service | 2 hours | 30 min | Full failover to DR region |
| Database (Aurora) | 4 hours | 1 hour | Cross-region replica promotion |
| Kafka (MSK) | 4 hours | 1 hour | Mirror maker failover |

### DR Test Procedure
1. Notify all stakeholders 72 hours before scheduled test
2. Initiate failover to DR region (ap-southeast-1b)
3. Validate all critical services are operational
4. Run smoke tests against DR environment
5. Verify data integrity (transaction counts, checksums)
6. Measure actual RTO and RPO against targets
7. Failback to primary region
8. Document results and gaps

### DR Test Report Template
```markdown
# DR Test Report — [Date]
- **Test Type:** Full Failover / Tabletop / Partial
- **Duration:** [X hours Y minutes]
- **RTO Achieved:** [X hours] (Target: 4 hours)
- **RPO Achieved:** [X minutes] (Target: 1 hour)
- **Data Loss:** [None / X records]
- **Issues Found:** [List]
- **Action Items:** [List with owners and due dates]
- **Sign-off:** [CISO / VP Engineering]
```
