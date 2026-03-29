---
name: pipeline-design
description: Design and optimize DevSecOps CI/CD pipelines with security gates, SAST, DAST, and container scanning
---

# Pipeline Design Skill

## When to Use
Invoke when designing, reviewing, or optimizing the CI/CD DevSecOps pipeline.

## Pipeline Architecture
```
Developer Commit
  → Pre-commit hooks (git-secrets)
  → Build (Gradle/Vite)
  → SAST (SonarQube + Snyk Code)
  → Unit Tests (JUnit 5 / Vitest)
  → Integration Tests (Testcontainers)
  → Dependency Scan (Snyk Open Source)
  → Container Build + Scan (Snyk Container)
  → Deploy to Staging
  → DAST (OWASP ZAP against staging)
  → Smoke Tests
  → Manual Approval (prod only)
  → Deploy to Production (Blue/Green)
  → Post-deploy monitoring
```

## Optimization Targets
- Total pipeline time: < 30 minutes
- SAST scan: < 5 minutes
- DAST scan: < 10 minutes
- False positive rate: < 15%
- Parallelization: run SAST + unit tests concurrently

## GitHub Actions Template Structure
```yaml
jobs:
  build-and-scan:
    steps: [checkout, build, sast, unit-test]
  integration-test:
    needs: build-and-scan
    steps: [integration-test, dependency-scan]
  deploy-staging:
    needs: integration-test
    steps: [container-build, container-scan, deploy-staging, dast]
  deploy-prod:
    needs: deploy-staging
    if: github.ref == 'refs/heads/main'
    steps: [manual-approval, blue-green-deploy, smoke-test]
```
