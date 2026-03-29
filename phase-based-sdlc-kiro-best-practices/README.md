# Banking Phase-Based SDLC — Kiro Five-Element Best Practices

A complete, ready-to-use [Kiro IDE](https://kiro.dev) configuration for banking teams organized by development phases and specialized roles. Covers 14 roles across 5 linear phases (Planning → Design → Development → Testing → Deployment) with role-specific Steering, Subagents, Skills, Hooks, and MCP/Powers.

This is the **phase-based** approach. If your team runs Scrum Sprints with DevSecOps, see [sprint-based-devsecops-kiro-best-practices/](../sprint-based-devsecops-kiro-best-practices/) instead.

Based on the [Kiro Five-Element Architecture](https://kiro.dev/docs/) — verified against official documentation.

## Project Context

- **Industry:** Banking / Financial Services (Singapore-licensed)
- **Approach:** Phase-based SDLC — work flows linearly through specialized teams
- **Tech Stack:** Java 21, Spring Boot 3.x, React 18 + TypeScript, Aurora PostgreSQL, AWS
- **Compliance:** MAS TRM 2023, PCI-DSS v4.0, SOX, PDPA

### Abbreviations

| Term | Meaning |
|------|---------|
| BA | Business Analyst |
| PO | Product Owner |
| QA | Quality Assurance |
| SRE | Site Reliability Engineer |
| DBA | Database Administrator |
| CISO | Chief Information Security Officer |
| CAB | Change Advisory Board |
| SDLC | Software Development Life Cycle |
| ADR | Architecture Decision Record |
| IaC | Infrastructure as Code |
| CDK | AWS Cloud Development Kit |
| SAST | Static Application Security Testing |
| DAST | Dynamic Application Security Testing |
| STRIDE | Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege |
| OWASP | Open Worldwide Application Security Project |
| CVE | Common Vulnerabilities and Exposures |
| MFA | Multi-Factor Authentication |
| JWT | JSON Web Token |
| RBAC | Role-Based Access Control |
| DDD | Domain-Driven Design |
| DR | Disaster Recovery |
| RTO | Recovery Time Objective |
| RPO | Recovery Point Objective |
| SLO | Service Level Objective |
| MAS TRM | Monetary Authority of Singapore — Technology Risk Management |
| PCI-DSS | Payment Card Industry Data Security Standard |
| PDPA | Personal Data Protection Act (Singapore) |
| SOX | Sarbanes-Oxley Act |

---

## Quick Start (5 Minutes)

### Step 1: Copy `.kiro/` into your project

```bash
# Clone this repo
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git

# Copy the .kiro folder into your banking project workspace
cp -r phase-based-sdlc-kiro-best-practices/.kiro /path/to/your-banking-project/

# Copy AGENTS.md to your project root
cp phase-based-sdlc-kiro-best-practices/AGENTS.md /path/to/your-banking-project/

# Copy reference docs (optional but recommended)
cp -r phase-based-sdlc-kiro-best-practices/docs /path/to/your-banking-project/
cp -r phase-based-sdlc-kiro-best-practices/config /path/to/your-banking-project/
```

### Step 2: Make hook scripts executable

```bash
cd /path/to/your-banking-project
chmod +x .kiro/hooks/scripts/*.sh
```

### Step 3: Configure environment variables

Add these to your Kiro IDE settings → "Mcp Approved Env Vars":
- `GITHUB_TOKEN` — GitHub Personal Access Token
- `JIRA_API_TOKEN`, `JIRA_EMAIL`, `JIRA_DOMAIN` — Jira credentials
- `CONFLUENCE_API_TOKEN`, `CONFLUENCE_EMAIL`, `CONFLUENCE_DOMAIN` — Confluence (disabled by default)

### Step 4: Install recommended Kiro Powers

Open Kiro IDE → Powers panel → Install these official Powers:

| Power | Purpose | Required By |
|-------|---------|-------------|
| **Snyk** | Security vulnerability scanning | Security Engineer, Code Reviewer |
| **Aurora DSQL** | Database read/analytics | DBA, Backend Developer |
| **AWS Observability** | CloudTrail, CloudWatch, X-Ray | SRE, DevOps Engineer |
| **Datadog** | Application monitoring & metrics | SRE |
| **AWS CDK/CloudFormation** | Infrastructure as Code | DevOps Engineer |
| **Figma** | UI/UX design specs | UX Designer, UI Designer, Frontend Developer |
| **Checkmarx** | SAST security scanning (optional) | Security Engineer |
| **IAM Policy Autopilot** | IAM least-privilege (optional) | DevOps Engineer |

### Step 5: Open your project in Kiro

Open your banking project folder in Kiro IDE. The steering files load automatically based on their inclusion modes. You're ready to go.

---

## What's Included

```
.kiro/
├── steering/          ← 13 steering files (always, auto, fileMatch)
├── agents/            ← 14 role-specific subagents
├── skills/            ← 15 skill packages with references
├── hooks/             ← 10 hook configs (.kiro.hook JSON)
│   └── scripts/       ← 8 shell scripts for deterministic enforcement
└── settings/
    └── mcp.json       ← GitHub + Jira + Confluence MCP config
AGENTS.md              ← Always-included agent guidelines
docs/                  ← Reference docs (OpenAPI, ADRs, checklists, runbooks)
config/                ← Protected paths configuration
```

---

## How Each SDLC Role Uses This

### Phase 1: Planning & Requirements

#### Business Analyst
- **Steering loaded:** `product.md` (always), `backlog-standards.md` (auto — activates when discussing stories)
- **Skill:** Type `/requirements-gathering` in chat to get the user story template and banking-specific guidance
- **Subagent:** Ask Kiro to validate requirements — it spawns `requirements-validator` to check completeness, consistency, and regulatory compliance
- **Example prompt:** "Validate the user stories in docs/requirements/sprint-42.md against MAS TRM and PCI-DSS"

#### Product Owner
- **Steering loaded:** `backlog-standards.md` (auto — activates for sprint planning topics)
- **Skill:** Type `/backlog-management` for prioritization framework and Definition of Done
- **Subagent:** Ask Kiro to prioritize the backlog — it spawns `story-prioritizer` which weighs regulatory urgency, customer impact, and technical risk
- **Example prompt:** "Prioritize these 15 backlog items for next sprint, considering the MAS audit deadline in 3 weeks"

#### Project Manager
- **Steering loaded:** `backlog-standards.md` (auto)
- **Skill:** Type `/sprint-planning` for velocity tracking and capacity planning
- **Subagent:** Ask Kiro to assess risks — it spawns `risk-assessor` with the banking risk matrix
- **Hook:** `post-batch-sync` (Agent Stop) — automatically checks for TODO/FIXME markers and uncommitted changes after every agent turn
- **Example prompt:** "Assess the risks for the payment gateway migration planned for Sprint 44"

### Phase 2: Design & Architecture

#### Software Architect
- **Steering loaded:** `architecture-standards.md` (auto — activates for design discussions), `tech.md` (always)
- **Skill:** Type `/architecture-review` for ADR template and review checklist
- **Subagent:** Ask Kiro to review a design — it spawns `architecture-reviewer` which checks scalability, security, resilience, and MAS compliance
- **Example prompt:** "Review the architecture design in docs/architecture/ADR-005-payment-gateway.md"

#### UX Designer
- **Steering loaded:** `frontend-standards.md` (fileMatch — activates when working on .tsx/.jsx files)
- **Skill:** Type `/ux-review` for banking UX principles and WCAG 2.1 AA checklist
- **Power:** Install **Figma** Power to pull design specs directly into Kiro
- **Example prompt:** "Review the transfer flow wireframes against our banking UX standards and accessibility requirements"

#### UI Designer
- **Steering loaded:** `frontend-standards.md` (fileMatch)
- **Skill:** Type `/ui-component-check` for design system compliance and accessibility checks
- **Power:** Install **Figma** Power
- **Example prompt:** "Check if the AccountCard component follows our design system spacing and color tokens"

### Phase 3: Development

#### Frontend Developer
- **Steering loaded:** `frontend-standards.md` (fileMatch — auto-loads when editing .tsx/.ts files), `tech.md` (always)
- **Skill:** Type `/api-contract` when integrating with backend APIs
- **Subagent:** Ask Kiro to build a component — it spawns `frontend-builder` with React/TypeScript/accessibility context
- **Hook:** `coding-standard-guard` (Pre Tool Use) — blocks writes missing license headers or violating naming conventions
- **Example prompt:** "Build the TransactionList component following our design system, with proper money formatting and accessibility"

#### Backend Developer
- **Steering loaded:** `api-standards.md` (fileMatch — activates for controller/API files), `database-standards.md` (fileMatch — activates for SQL/repository files), `tech.md` (always)
- **Skill:** Type `/api-contract` for OpenAPI spec design
- **Subagent:** Ask Kiro to build an API — it spawns `backend-builder` with Java/Spring Boot/DDD context
- **Hooks:**
  - `credential-guard` (Pre Tool Use) — blocks any write containing hardcoded credentials
  - `db-write-guard` (Pre Tool Use) — blocks dangerous SQL mutations
  - `coding-standard-guard` (Pre Tool Use) — enforces Java naming and license headers
- **Example prompt:** "Implement the fund transfer API endpoint with idempotency, audit logging, and BigDecimal amounts"

#### Full-Stack Developer
- Inherits all Frontend + Backend configurations above. Steering auto-switches based on which files you're editing.

### Phase 4: Testing (Quality Assurance)

#### QA Engineer
- **Steering loaded:** `testing-standards.md` (fileMatch — activates when editing test files)
- **Skill:** Type `/test-strategy` for test pyramid and banking-specific test scenarios
- **Subagent:** Ask Kiro to run tests — it spawns `test-runner` which executes unit → integration → contract tests
- **Hook:** `test-coverage-gate` (Post Task Execution) — checks coverage after each spec task completes
- **Example prompt:** "Analyze test coverage for the transaction module and identify gaps in boundary value testing"

#### Security Engineer
- **Steering loaded:** `security-policy.md` (always)
- **Skill:** Type `/security-audit` for OWASP Top 10 checklist and banking-specific security checks
- **Subagent:** Ask Kiro to scan for vulnerabilities — it spawns `security-scanner` with Snyk integration
- **Hooks:**
  - `credential-guard` (Pre Tool Use) — blocks credential leaks
  - `security-audit` (Manual Trigger) — click ▷ in Agent Hooks panel for full codebase audit
- **Power:** Install **Snyk** and optionally **Checkmarx** Powers
- **Example prompt:** "Perform a full security audit focusing on OWASP Top 10 and PCI-DSS compliance"

### Phase 5: Deployment & Maintenance

#### DevOps Engineer
- **Steering loaded:** `deployment-workflow.md` (auto — activates for deployment topics), `tech.md` (always)
- **Skill:** Type `/deployment-checklist` for pre-deployment verification
- **Subagent:** Ask Kiro to build infrastructure — it spawns `infra-builder` with AWS CDK context
- **Hook:** `block-prod-writes` (Pre Tool Use) — blocks any write to production-protected paths
- **Powers:** Install **AWS CDK/CloudFormation**, **AWS Observability**, and optionally **IAM Policy Autopilot**
- **Example prompt:** "Review the CDK diff for the ECS service update and assess deployment risk"

#### Site Reliability Engineer (SRE)
- **Steering loaded:** `sre-runbook.md` (auto — activates for monitoring/incident topics)
- **Skill:** Type `/incident-response` for incident response flow and post-mortem template
- **Subagent:** Ask Kiro to analyze metrics — it spawns `observability-analyst` with SLO targets
- **Powers:** Install **Datadog** and **AWS Observability** Powers
- **Example prompt:** "Analyze the error rate spike on transaction-service from the last 2 hours and correlate with recent deployments"

#### Database Administrator (DBA)
- **Steering loaded:** `database-standards.md` (fileMatch — activates for SQL/migration files)
- **Skill:** Type `/db-migration` for Flyway migration template and safety rules
- **Subagent:** Ask Kiro to analyze the schema — it spawns `db-reader` (read-only, with Aurora DSQL access)
- **Hook:** `db-write-guard` (Pre Tool Use) — blocks INSERT/UPDATE/DELETE/DROP outside migrations
- **Power:** Install **Aurora DSQL** Power
- **Example prompt:** "Review the migration V042__add_transaction_limits.sql for safety and performance impact"

---

## Steering Inclusion Modes Explained

| Mode | When Loaded | Files Using It |
|------|-------------|----------------|
| `always` | Every conversation | product.md, tech.md, structure.md, security-policy.md |
| `auto` | When topic matches description | compliance-mas-trm.md, architecture-standards.md, deployment-workflow.md, sre-runbook.md, backlog-standards.md |
| `fileMatch` | When matching files are in context | api-standards.md, database-standards.md, frontend-standards.md, testing-standards.md |

`auto` and `manual` steering files also appear as slash commands in chat.

---

## Hook Architecture

| Hook | Trigger | Action | Cost | Blocks? |
|------|---------|--------|------|---------|
| Block Prod Writes | Pre Tool Use (write) | Shell Command | Free | Yes |
| Credential Guard | Pre Tool Use (write) | Shell Command | Free | Yes |
| DB Write Guard | Pre Tool Use (shell, @aurora-dsql) | Shell Command | Free | Yes |
| Coding Standard Guard | Pre Tool Use (write) | Shell Command | Free | Yes |
| Compliance Review | File Edited (src/**) | Agent Prompt | Credits | No |
| Post-Batch Sync | Agent Stop | Shell Command | Free | No |
| Security Audit | Manual Trigger | Agent Prompt | Credits | No |
| Test Coverage Gate | Post Task Execution | Shell Command | Free | No |
| Data Residency Guard | Pre Tool Use (write) | Shell Command | Free | Yes |
| Prompt Scope Audit | Agent Stop | Shell Command | Free | No |

**Key principle:** Deterministic enforcement uses Shell Command (free, 100% reliable). LLM-reasoning checks use Agent Prompt (costs credits). Only Pre Tool Use and Prompt Submit hooks can block operations.

---

## Subagent Quick Reference

| Subagent | Invocation | Tools | Use Case |
|----------|-----------|-------|----------|
| `/requirements-validator` | Explicit | read | Validate user stories for completeness and compliance |
| `/story-prioritizer` | Explicit | read | Prioritize backlog by regulatory urgency and business value |
| `/risk-assessor` | Explicit | read | Assess project risks (timeline, technical, regulatory) |
| `/architecture-reviewer` | Explicit | read | Review system designs for scalability and compliance |
| `/frontend-builder` | Explicit | read, write + Powers | Build React components with accessibility |
| `/backend-builder` | Explicit | read, write, shell, @aurora-dsql | Build Java APIs with DDD and audit logging |
| `/test-runner` | Explicit | read, shell | Run test suites and analyze coverage |
| `/security-scanner` | Explicit | read, @snyk | OWASP/CVE scanning |
| `/compliance-auditor` | Explicit | read | MAS TRM / PCI-DSS gap analysis |
| `/infra-builder` | Explicit | read, write, shell + Powers | Build AWS CDK infrastructure |
| `/db-reader` | Explicit | read, @aurora-dsql | Read-only database analysis |
| `/observability-analyst` | Explicit | read + Powers | SLO monitoring and anomaly detection |
| `/code-reviewer` | Explicit | read, @snyk | Code review for correctness and standards |
| `/change-approver` | Explicit | read | CAB risk assessment for production changes |

Kiro subagents are invoked explicitly via slash command or from within a skill's execution flow.

---

## Skill Quick Reference

| Skill | Slash Command | When to Use |
|-------|--------------|-------------|
| requirements-gathering | `/requirements-gathering` | Writing user stories and acceptance criteria |
| backlog-management | `/backlog-management` | Backlog refinement and issue triage |
| sprint-planning | `/sprint-planning` | Velocity tracking and capacity planning |
| architecture-review | `/architecture-review` | Creating ADRs and reviewing designs |
| ux-review | `/ux-review` | Reviewing wireframes and user flows |
| ui-component-check | `/ui-component-check` | Checking design system compliance |
| api-contract | `/api-contract` | Designing OpenAPI specs |
| code-standards | `/code-standards` | Enforcing naming conventions and code quality |
| security-audit | `/security-audit` | OWASP and PCI-DSS security checks |
| test-strategy | `/test-strategy` | Planning test coverage |
| deployment-checklist | `/deployment-checklist` | Pre-deployment verification |
| incident-response | `/incident-response` | Incident handling and post-mortems |
| db-migration | `/db-migration` | Creating Flyway migration scripts |
| prod-change-request | `/prod-change-request` | Preparing CAB approval documents |
| threat-modeling | `/threat-modeling` | STRIDE threat modeling for new features and APIs |

---

## Customization Guide

### Adapting for Your Bank

1. **Update `product.md`** — Replace business domain, stakeholders, and Definition of Done with your bank's specifics
2. **Update `tech.md`** — Adjust tech stack versions and tools to match your environment
3. **Update `structure.md`** — Map to your actual repository layout and service owners
4. **Update `security-policy.md`** — Add your bank's specific protected paths and credential policies
5. **Update `compliance-mas-trm.md`** — Replace with your jurisdiction's regulations (APRA for Australia, FSA for Japan, etc.)
6. **Update `mcp.json`** — Configure your actual GitHub org, Jira project, and Confluence space

### Adding New Roles

Create a new subagent in `.kiro/agents/your-role.md`:
```yaml
---
name: your-role-name
description: One sentence describing what this agent does
tools: ["read"]
model: claude-sonnet-4
---
```

### Adding New Skills

Create `.kiro/skills/your-skill/SKILL.md`:
```yaml
---
name: your-skill
description: One sentence describing when to invoke this skill
---
# Skill content here
```

### Adding New Hooks

Create `.kiro/hooks/your-hook.kiro.hook`:
```json
{
  "enabled": true,
  "name": "Your Hook Name",
  "description": "What this hook does",
  "version": "1",
  "when": {
    "type": "preToolUse",
    "toolTypes": ["write"]
  },
  "then": {
    "type": "runCommand",
    "command": ".kiro/hooks/scripts/your-script.sh"
  }
}
```

---

## Architecture Principles

1. **Steering instructs; Hooks enforce** — Steering provides context (soft guidance); Pre Tool Use Shell hooks provide 100% deterministic enforcement
2. **Hooks fire in main agent only** — Design critical enforcement flows through the main agent, not subagents
3. **Steering + MCP propagate to subagents** — Quality context is inherited automatically without extra configuration
4. **Shell Command = free; Agent Prompt = credits** — Use Shell for deterministic checks, Agent Prompt only when LLM reasoning is needed
5. **Pre Tool Use blocks; Post Tool Use advises** — Only Pre Tool Use and Prompt Submit + non-zero exit code can block operations

---

## Important Notes

- **Hook trigger type names** — This repo uses `fileEdited` for file change hooks. The official trigger types are: Prompt Submit, Agent Stop, Pre Tool Use, Post Tool Use, File Created, File Edited, File Deleted, Pre Task Execution, Post Task Execution, Manual Trigger.
- **Hooks do NOT trigger inside subagents** — This is by design. All enforcement hooks run in the main agent only.
- **Specs are NOT accessible inside subagents** — Confirmed Kiro limitation.
- **GitHub and Jira are NOT official Kiro Powers** — They are configured as generic MCP servers in `mcp.json`.
- **Powers are IDE-only** — CLI support is planned for the future.
- **`auto` steering requires `name` + `description`** — Without both fields, auto-inclusion won't work.
- **`fileMatch` steering requires `fileMatchPattern`** — Must be an array of glob patterns.

---

## References

- [Kiro Official Documentation](https://kiro.dev/docs/)
- [Kiro Steering Docs](https://kiro.dev/docs/steering/)
- [Kiro Hooks Docs](https://kiro.dev/docs/hooks/)
- [Kiro Skills Docs](https://kiro.dev/docs/skills/)
- [Kiro Subagents Docs](https://kiro.dev/docs/chat/subagents/)
- [Kiro MCP Configuration](https://kiro.dev/docs/mcp/configuration/)
- [Kiro Powers Marketplace](https://kiro.dev/powers/)
- [Agent Skills Standard](https://agentskills.io)

## License

MIT — Adapt freely for your organization.
