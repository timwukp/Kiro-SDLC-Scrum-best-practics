---
inclusion: always
---
## Banking Platform — Project Structure

### Repository Layout
```
src/
├── main/java/com/bank/
│   ├── account/          ← Account domain
│   ├── transaction/      ← Transaction processing
│   ├── lending/          ← Loan origination
│   ├── auth/             ← Authentication (OAuth2/OIDC)
│   ├── notification/     ← Notifications
│   ├── audit/            ← Audit trail logging
│   ├── common/           ← Shared utilities, DTOs
│   └── config/           ← Spring configuration
├── main/resources/
│   ├── db/migration/     ← Flyway migrations
│   └── application.yml   ← Spring Boot config
├── test/java/com/bank/   ← Unit + integration tests
frontend/
├── src/
│   ├── components/       ← Reusable UI components
│   ├── pages/            ← Route-level pages
│   ├── hooks/            ← Custom React hooks
│   ├── services/         ← API client layer
│   ├── store/            ← Zustand state stores
│   └── types/            ← TypeScript types
infra/
├── lib/                  ← CDK stack definitions
├── pipeline/             ← CI/CD pipeline definitions
config/
├── dev/                  ← Dev environment configs
├── staging/              ← Staging configs
└── prod/                 ← Production configs (PROTECTED)
docs/
├── api/                  ← OpenAPI specs
├── architecture/         ← ADRs
├── compliance/           ← Regulatory checklists
├── threat-models/        ← Threat modeling documents
├── runbooks/             ← Operational runbooks
└── sprint/               ← Sprint-specific docs
```

### Scrum Team Structure (Accountabilities per 2020 Scrum Guide)
| Accountability | Person | Responsibility |
|----------------|--------|---------------|
| Product Owner | 1 person (not a committee) | Maximizing product value, backlog ordering, secure value prioritization |
| Scrum Master | 1 person | Establishing Scrum, DevSecOps process facilitation, impediment removal |
| Developers | 5-7 people (cross-functional) | Creating usable Increments each Sprint (frontend, backend, infra, security) |

### Additional DevSecOps Accountability
| Role | Person | Responsibility |
|------|--------|---------------|
| Security Champion | 1 senior dev (from Developers) | Bridge to central security team, threat modeling, scan triage |

### Protected Paths (agent must NOT write directly)
- `config/prod/**`
- `infra/lib/*Prod*`
- `src/main/resources/application-prod.yml`
- `.github/workflows/deploy-prod.yml`
