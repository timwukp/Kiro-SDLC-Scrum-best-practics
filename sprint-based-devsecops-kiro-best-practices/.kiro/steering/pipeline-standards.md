---
inclusion: auto
name: pipeline-standards
description: CI/CD pipeline configuration, deployment automation, or DevSecOps pipeline design
---
## DevSecOps Pipeline Standards (The Automated Highway)

### Pipeline Stages
```
Commit → Build → SAST → Unit Test → Integration Test → DAST → Container Scan → Deploy Staging → Smoke Test → Deploy Prod
```

### Stage Details
| Stage | Tool | Gate | Failure Action |
|-------|------|------|---------------|
| Pre-commit | git-secrets | Block commit | Developer fixes locally |
| Build | Gradle/Vite | Compilation | Fix build errors |
| SAST | SonarQube + Snyk Code | No High/Critical | Developer fixes in Sprint |
| Unit Test | JUnit 5 / Vitest | ≥ 80% coverage | Add missing tests |
| Integration Test | Testcontainers + WireMock | All passing | Fix integration issues |
| Dependency Scan | Snyk Open Source | No Critical CVEs | Update dependency or apply workaround |
| DAST | OWASP ZAP | No High/Critical | Developer fixes in Sprint |
| Container Scan | Snyk Container + ECR | No Critical | Update base image |
| Deploy Staging | AWS CDK + ECS | Health check pass | Rollback |
| Deploy Prod | Blue/Green via ECS | Health check + canary | Autonomous AI rollback |

### Autonomous Canary Deployment (AI-Managed)
The AI agent manages canary releases as a Digital Teammate:
1. Deploy to 10% of traffic (canary)
2. AI monitors for 15 minutes: error rate, latency P95, security anomalies
3. If anomaly detected (error rate > 1%, latency > 500ms, security alert):
   - AI autonomously rolls back to previous version
   - AI notifies team via Slack/PagerDuty with rollback reason
   - AI preserves logs and metrics for post-mortem
4. If healthy: promote to 50% → 100% with continued monitoring
5. Post-deployment: AI monitors for 1 hour for delayed security anomalies

### Pipeline Metrics (Track in Sprint Retro)
- Lead Time for Changes: commit → production
- Deployment Frequency: deploys per Sprint
- Change Failure Rate: % deployments causing incidents
- Mean Time to Recovery: incident → resolution
- Security Scan Time: total pipeline security overhead
- False Positive Rate: % scan findings that are not real issues

### Pipeline Rules
- Every commit triggers the full pipeline — no exceptions
- Security scan failures block the pipeline (High/Critical)
- Pipeline must complete in < 30 minutes for fast feedback
- Developers own pipeline failures — fix immediately, don't defer
- Pipeline config is version-controlled alongside application code
