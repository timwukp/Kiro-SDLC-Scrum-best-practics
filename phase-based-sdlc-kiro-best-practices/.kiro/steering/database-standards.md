---
inclusion: fileMatch
fileMatchPattern: ["**/*.sql", "**/db/**", "**/migration/**", "**/repository/**", "**/*Repository.java"]
---
## Banking Database Standards

### General Rules
- No DDL (CREATE/DROP/ALTER) outside Flyway migration scripts
- All queries must use parameterized statements — no string concatenation
- SELECT queries must include LIMIT clause (max 1000 for batch, 100 for API)
- All tables require: id (UUID), created_at, updated_at, version (optimistic locking)

### Naming Conventions
- Tables: snake_case, plural (accounts, transactions, audit_logs)
- Columns: snake_case (account_id, created_at, transaction_amount)
- Indexes: idx_{table}_{columns} (idx_transactions_account_id_created_at)
- Foreign keys: fk_{table}_{referenced_table} (fk_transactions_accounts)

### Migration Rules (Flyway)
- File naming: V{version}__{description}.sql (e.g., V001__create_accounts_table.sql)
- Every migration must be reversible — include rollback script
- No data manipulation in schema migrations — use separate R__ (repeatable) scripts
- Test migrations against a copy of production schema before deployment

### Performance
- Index all foreign key columns
- Use EXPLAIN ANALYZE for queries touching > 10K rows
- Partition large tables by date (transactions, audit_logs)
- Connection pool: HikariCP, max 20 connections per service instance

### Sensitive Data
- PII columns must use pgcrypto encryption
- Credit card numbers: store only last 4 digits + tokenized reference
- Mask PII in non-production environments

#[[file:docs/db-conventions.md]]
