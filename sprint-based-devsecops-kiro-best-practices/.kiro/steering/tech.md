---
inclusion: always
---
## Banking Platform — Technology Standards

### Backend
- Java 21 LTS, Spring Boot 3.x, Spring Security 6
- Build: Gradle 8.x with Kotlin DSL
- ORM: Spring Data JPA with Hibernate 6
- Database: Aurora PostgreSQL 15 (primary), Aurora DSQL (analytics)
- Messaging: Amazon MSK (Kafka) for event-driven architecture
- Cache: ElastiCache Redis for session and rate limiting

### Frontend
- React 18 with TypeScript 5.x (strict mode)
- State management: Zustand
- UI framework: Internal design system based on Radix UI
- Build: Vite 5
- Testing: Vitest + React Testing Library

### Infrastructure & DevSecOps Pipeline
- AWS CDK (TypeScript) for IaC
- ECS Fargate for container orchestration
- GitHub Actions for CI/CD pipeline
- SAST: SonarQube + Snyk Code
- DAST: OWASP ZAP (automated in pipeline)
- Container scanning: Snyk Container + ECR scanning
- Dependency scanning: Snyk Open Source
- Secrets detection: git-secrets + Snyk
- Secrets Manager for all credentials
- CloudTrail + Datadog for observability

### Code Standards
- Java: Google Java Style Guide
- TypeScript: ESLint + Prettier (project config)
- Commit messages: Conventional Commits (feat/fix/chore/security/docs)
- Branch naming: feature/{JIRA-ID}-short-description

### Security Baseline (Shift-Left)
- TLS 1.3 for all transit encryption
- AES-256 for data at rest
- OWASP Top 10 compliance mandatory
- No hardcoded credentials — ever
- Input validation on all API endpoints
- SQL parameterized queries only — no string concatenation
- Security scanning runs on every commit, not just before release
