---
inclusion: fileMatch
fileMatchPattern: ["**/*.sql", "**/db/**", "**/migration/**", "**/repository/**", "**/*Repository.java"]
---
## Banking Database Standards (Data Privacy Guardian)

### General Rules
- No DDL outside Flyway migration scripts
- Parameterized queries only — no string concatenation
- SELECT queries must include LIMIT (max 1000 batch, 100 API)
- All tables require: id (UUID), created_at, updated_at, version

### Naming Conventions
- Tables: snake_case, plural (accounts, transactions, audit_logs)
- Columns: snake_case (account_id, created_at)
- Indexes: idx_{table}_{columns}
- Foreign keys: fk_{table}_{referenced_table}

### Data Privacy (DBA as Privacy Guardian)
- PII columns use pgcrypto encryption at rest
- Credit card numbers: store only last 4 digits + tokenized reference
- Non-production environments use masked/synthetic data only
- Database migrations automated — no manual DDL in production
- Access: read-only for app accounts, write via migrations only

### Migration Rules (Flyway)
- Naming: V{NNN}__{description}.sql
- Every migration must be reversible
- Test against production schema copy before deployment

#[[file:docs/db-conventions.md]]
