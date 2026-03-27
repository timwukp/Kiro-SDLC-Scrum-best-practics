---
name: db-migration
description: Creating and reviewing database migration scripts for banking databases using Flyway
---

# Database Migration Skill

## When to Use
Invoke when creating, reviewing, or troubleshooting database migration scripts.

## Flyway Migration Rules
- Versioned: V{NNN}__{description}.sql (e.g., V001__create_accounts.sql)
- Repeatable: R__{description}.sql (for views, functions, seed data)
- Every migration must have a corresponding rollback script
- Test against a copy of production schema before deployment

## Migration Template
```sql
-- V{NNN}__{description}.sql
-- Author: [name]
-- Date: [YYYY-MM-DD]
-- JIRA: [BANK-XXX]
-- Description: [what this migration does]
-- Rollback: V{NNN}__rollback__{description}.sql

BEGIN;

-- Your DDL/DML here

COMMIT;
```

## Safety Rules
- Never DROP TABLE in production — use soft delete (add deleted_at column)
- ALTER TABLE on large tables: use CREATE INDEX CONCURRENTLY
- Add columns as NULLABLE first, backfill, then add NOT NULL constraint
- Partition tables > 10M rows by date before they grow
- Always include EXPLAIN ANALYZE for new queries in comments
