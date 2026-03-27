# Banking User Story Examples

## Account Management
### BANK-101: View Account Balance
**As a** retail banking customer,
**I want to** view my current account balance on the dashboard,
**So that** I can monitor my finances in real-time.

#### Acceptance Criteria
- **Given** I am logged in, **When** I navigate to the dashboard, **Then** I see all my accounts with current balances in SGD
- **Given** I have multi-currency accounts, **When** I view balances, **Then** each account shows its native currency and SGD equivalent
- **Given** the balance service is unavailable, **When** I view the dashboard, **Then** I see the last known balance with a "Last updated" timestamp

## Transaction Processing
### BANK-201: Fund Transfer
**As a** retail banking customer,
**I want to** transfer funds between my accounts,
**So that** I can manage my money across accounts.

#### Acceptance Criteria
- **Given** I have sufficient balance, **When** I submit a transfer, **Then** the amount is debited from source and credited to destination atomically
- **Given** I submit a duplicate transfer (same idempotency key), **When** processed, **Then** only one transfer executes
- **Given** the transfer amount is zero or negative, **When** I submit, **Then** I receive a validation error
- **Given** the transfer exceeds my daily limit, **When** I submit, **Then** I receive a limit exceeded error with the remaining limit

#### Non-Functional Requirements
- Latency: P95 < 200ms
- Idempotency: duplicate submissions within 24 hours must be detected
- Audit: full audit trail with before/after balances
