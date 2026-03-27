# Banking Platform — Agent Guidelines (DevSecOps + Scrum)

## Core Principle: Agentic AI as Digital Teammate
Kiro AI agents are embedded in the Scrum process as Digital Teammates — not passive tools, but proactive participants that enforce security and quality automatically:
- **Planning**: AI performs automated threat modeling on every user story
- **Design**: AI auto-audits IaC for Zero Trust compliance before human review
- **Development**: AI detects vulnerabilities and provides self-healing fixes in real-time
- **Testing**: AI runs chaos security testing — proactively "hacking" the Sprint output
- **Deployment**: AI monitors canary releases and triggers autonomous rollback on security anomaly

Every developer is a "Security Developer." Security is shift-left — baked into every Sprint from Day 1.

## Critical Rules (Always Enforced)
1. Never write to production paths without CAB approval
2. Never hardcode credentials — use AWS Secrets Manager
3. Never execute destructive SQL outside Flyway migrations
4. Always use BigDecimal for monetary calculations
5. Always include audit logging for state-changing operations
6. Always validate inputs on API endpoints
7. Always use parameterized SQL queries
8. Always check SAST/DAST scan results before marking work as Done

## DevSecOps Definition of Done
A feature is NOT "Done" until:
- Code peer-reviewed
- SAST/DAST scans passed (no High/Critical)
- No Critical CVEs in dependencies
- Security regression tests passing
- Compliance documentation updated (if applicable)

## Scrum Ceremonies — Security Integration
- Sprint Planning: include threat modeling for new features
- Daily Scrum: report scan results alongside progress
- Sprint Review: demo Green Build report alongside features
- Retrospective: review pipeline performance and security feedback loop

## When in Doubt
- Security question → consult security-policy.md steering
- Threat modeling → invoke /threat-modeling skill
- Architecture → consult architecture-standards.md steering
- Compliance → invoke compliance-auditor subagent
- Production change → invoke /prod-change-request skill
