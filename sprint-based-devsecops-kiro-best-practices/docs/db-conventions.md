# Database Conventions

## Table Design
- Primary key: `id UUID DEFAULT gen_random_uuid()`
- Audit columns: `created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()`, `updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()`
- Soft delete: `deleted_at TIMESTAMPTZ` (nullable)
- Optimistic locking: `version INTEGER NOT NULL DEFAULT 0`

## Money Columns
- Type: `NUMERIC(19,4)` for amounts
- Currency: `VARCHAR(3)` ISO 4217 code
- Always store amount + currency together

## Data Privacy
- PII columns: use pgcrypto encryption, add comment `-- CLASSIFICATION: CONFIDENTIAL`
- Non-production: apply masking functions to PII columns
- Credit card: store only last 4 digits + tokenized reference
