# Banking Platform — Agent Guidelines

## Critical Rules (Always Enforced)
1. Never write to production paths without CAB approval
2. Never hardcode credentials — use AWS Secrets Manager
3. Never execute destructive SQL outside Flyway migrations
4. Always use BigDecimal for monetary calculations
5. Always include audit logging for state-changing operations
6. Always validate inputs on API endpoints
7. Always use parameterized SQL queries

## Code Review Standards
- Every PR requires at least 1 reviewer
- Security-sensitive changes require Security Engineer review
- Database changes require DBA review
- Infrastructure changes require DevOps review

## Compliance
- MAS TRM 2023 compliance is mandatory
- PCI-DSS v4.0 for payment card handling
- PDPA for personal data protection
- SOX for financial reporting controls

## When in Doubt
- Security question → consult security-policy.md steering
- Architecture question → consult architecture-standards.md steering
- Compliance question → invoke compliance-auditor subagent
- Production change → invoke prod-change-request skill
