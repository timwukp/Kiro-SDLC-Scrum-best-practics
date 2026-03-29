---
name: db-migration
description: Write safe database migration scripts with data privacy considerations using Flyway
---

# Database Migration Skill (Data Privacy Guardian)

## When to Use
Invoke when creating, reviewing, or troubleshooting database migrations.

## Migration Template
```sql
-- V{NNN}__{description}.sql
-- Author: [name] | Date: [YYYY-MM-DD] | JIRA: [BANK-XXX]
-- Description: [what this migration does]
-- Rollback: V{NNN}__rollback__{description}.sql
-- Privacy Impact: [Does this add/modify PII columns?]

BEGIN;
-- DDL/DML here
COMMIT;
```

## Data Privacy Rules
- New PII columns MUST use pgcrypto encryption
- Add data classification comment: -- CLASSIFICATION: CONFIDENTIAL
- Non-production environments: add masking function for new PII columns
- Never store full credit card numbers — tokenize

## Safety Rules
- Never DROP TABLE — use soft delete (add deleted_at column)
- ALTER on large tables: use CREATE INDEX CONCURRENTLY
- Add columns as NULLABLE first, backfill, then add NOT NULL
