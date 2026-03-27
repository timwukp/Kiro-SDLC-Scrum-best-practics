---
inclusion: always
---
## Banking Platform — Project Structure

### Repository Layout
```
src/
├── main/java/com/bank/
│   ├── account/          ← Account domain (CRUD, balance, statements)
│   ├── transaction/      ← Transaction processing (transfers, payments)
│   ├── lending/          ← Loan origination and management
│   ├── auth/             ← Authentication & authorization (OAuth2/OIDC)
│   ├── notification/     ← Email, SMS, push notifications
│   ├── audit/            ← Audit trail logging
│   ├── common/           ← Shared utilities, exceptions, DTOs
│   └── config/           ← Spring configuration classes
├── main/resources/
│   ├── db/migration/     ← Flyway migration scripts (V{n}__{desc}.sql)
│   └── application.yml   ← Spring Boot config (profiles: dev, staging, prod)
├── test/java/com/bank/   ← Unit + integration tests (mirrors src/main)
frontend/
├── src/
│   ├── components/       ← Reusable UI components
│   ├── pages/            ← Route-level page components
│   ├── hooks/            ← Custom React hooks
│   ├── services/         ← API client layer
│   ├── store/            ← Zustand state stores
│   └── types/            ← TypeScript type definitions
infra/
├── lib/                  ← CDK stack definitions
├── bin/                  ← CDK app entry point
config/
├── dev/                  ← Development environment configs
├── staging/              ← Staging environment configs
└── prod/                 ← Production environment configs (PROTECTED)
docs/
├── api/                  ← OpenAPI specs
├── architecture/         ← Architecture Decision Records (ADRs)
├── compliance/           ← Regulatory checklists
└── runbooks/             ← Operational runbooks
```

### Service Owners
| Service | Team | On-call |
|---------|------|---------|
| Account | Core Banking | @core-banking-oncall |
| Transaction | Payments | @payments-oncall |
| Lending | Credit | @credit-oncall |
| Auth | Platform | @platform-oncall |
| Infrastructure | DevOps | @devops-oncall |

### Protected Paths (agent must NOT write directly)
- `config/prod/**`
- `infra/lib/*Prod*`
- `src/main/resources/application-prod.yml`
- `.github/workflows/deploy-prod.yml`
