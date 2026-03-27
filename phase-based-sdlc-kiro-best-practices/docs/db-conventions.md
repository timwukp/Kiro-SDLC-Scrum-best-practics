# Database Conventions

## Table Design
- Primary key: `id UUID DEFAULT gen_random_uuid()`
- Audit columns: `created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()`, `updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()`
- Soft delete: `deleted_at TIMESTAMPTZ` (nullable, null = active)
- Optimistic locking: `version INTEGER NOT NULL DEFAULT 0`

## Money Columns
- Type: `NUMERIC(19,4)` for amounts (supports up to 999,999,999,999,999.9999)
- Currency: `VARCHAR(3)` ISO 4217 code (SGD, USD, etc.)
- Always store amount + currency together

## Example: Accounts Table
```sql
CREATE TABLE accounts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID NOT NULL REFERENCES customers(id),
    account_number VARCHAR(20) NOT NULL UNIQUE,
    account_type VARCHAR(20) NOT NULL CHECK (account_type IN ('SAVINGS', 'CURRENT', 'FIXED_DEPOSIT')),
    currency VARCHAR(3) NOT NULL DEFAULT 'SGD',
    balance NUMERIC(19,4) NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'FROZEN', 'CLOSED')),
    daily_transfer_limit NUMERIC(19,4) NOT NULL DEFAULT 50000,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    version INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX idx_accounts_customer_id ON accounts(customer_id);
CREATE INDEX idx_accounts_status ON accounts(status) WHERE deleted_at IS NULL;
```

## Index Naming
- Single column: `idx_{table}_{column}`
- Composite: `idx_{table}_{col1}_{col2}`
- Unique: `uq_{table}_{column}`
- Partial: append `_active` or condition hint
