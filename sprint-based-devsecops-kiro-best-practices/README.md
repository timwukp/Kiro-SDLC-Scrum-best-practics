# Banking Sprint-Based DevSecOps — Kiro Five-Element Best Practices

A complete [Kiro IDE](https://kiro.dev) configuration for banking teams running Scrum Sprints with security shift-left. Every Sprint, every commit — security is baked in from Day 1, not a final gate.

Kiro AI agents act as **Digital Teammates** embedded in the Scrum process — performing automated threat modeling, self-healing code vulnerabilities, chaos security testing, and autonomous canary rollback.

This is the **Sprint-based DevSecOps** approach. If your team follows linear development phases with specialized roles, see [phase-based-sdlc-kiro-best-practices/](../phase-based-sdlc-kiro-best-practices/) instead.

Based on the [Kiro Five-Element Architecture](https://kiro.dev/docs/) and the [2020 Scrum Guide](https://scrumguides.org).

## Agentic AI as Digital Teammate

| Sprint Phase | AI Agent Behavior |
|-------------|-------------------|
| Planning (PO/BA) | Automated threat modeling on every user story. Calculates Security Debt vs Feature Value ratio. |
| Design (Architect) | Auto-audits IaC (CDK/Terraform) for Zero Trust compliance before human review. |
| Development (Team) | Detects vulnerabilities and provides self-healing fixes. Generates security regression tests. |
| Testing (QA/Security) | Runs chaos security testing — proactively "hacks" the Sprint output and reports to Daily Scrum. |
| Deployment (DevOps/SRE) | Monitors canary deployment. Autonomously rolls back on security anomaly and notifies team. |

## Key Difference from Phase-Based SDLC

| Traditional SDLC | DevSecOps + Scrum |
|-------------------|-------------------|
| Security is a final gate | Security is shift-left, every Sprint |
| Siloed handovers | Shared responsibility |
| Linear: Plan → Build → Test → Deploy | Cyclical: Plan → Code → Scan → Test → Release → Monitor → Feedback |
| Security team blocks releases | Security team provides tooling |
| Manual security reviews | Automated SAST/DAST/dependency scanning in CI/CD |

## Project Context

- **Industry:** Banking / Financial Services (Singapore-licensed)
- **Framework:** Scrum (2-week Sprints) + DevSecOps
- **Tech Stack:** Java 21, Spring Boot 3.x, React 18 + TypeScript, Aurora PostgreSQL, AWS
- **Compliance:** MAS TRM 2023, PCI-DSS v4.0, SOX, PDPA
- **Pipeline:** GitHub Actions + SonarQube + Snyk + OWASP ZAP

---

## Quick Start (5 Minutes)

### Step 1: Copy `.kiro/` into your project
```bash
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git
cp -r sprint-based-devsecops-kiro-best-practices/.kiro /path/to/your-project/
cp sprint-based-devsecops-kiro-best-practices/AGENTS.md /path/to/your-project/
cp -r sprint-based-devsecops-kiro-best-practices/docs /path/to/your-project/
```

### Step 2: Make hook scripts executable
```bash
chmod +x .kiro/hooks/scripts/*.sh
```

### Step 3: Configure environment variables
Add to Kiro IDE settings → "Mcp Approved Env Vars":
- `GITHUB_TOKEN`, `JIRA_API_TOKEN`, `JIRA_EMAIL`, `JIRA_DOMAIN`

### Step 4: Install recommended Kiro Powers

| Power | Purpose | Used By |
|-------|---------|---------|
| **Snyk** | SAST + dependency + container scanning | Security Engineer, Pipeline |
| **Aurora DSQL** | Database read/analytics | DBA, Backend Developer |
| **AWS Observability** | CloudTrail, CloudWatch, X-Ray | SRE, DevOps |
| **Datadog** | Application + security monitoring | SRE |
| **AWS CDK/CloudFormation** | Infrastructure as Code | DevOps Engineer |
| **Figma** | UI/UX design specs | UX/UI Designer |
| **Checkmarx** | Additional SAST (optional) | Security Engineer |

---

## What's Included

```
.kiro/
├── steering/          ← 17 steering files (always/auto/fileMatch)
├── agents/            ← 15 role-specific subagents
├── skills/            ← 14 skill packages (incl. chaos security testing)
├── hooks/             ← 8 hook configs (.kiro.hook JSON)
│   └── scripts/       ← 5 shell scripts for enforcement
└── settings/
    └── mcp.json       ← GitHub + Jira MCP config
AGENTS.md              ← Always-included DevSecOps agent guidelines
docs/                  ← Threat model templates, compliance checklists, runbooks
```

---

## DevSecOps Roles & How They Use Kiro

### Core Scrum Roles (Re-imagined)

#### Product Owner — "Secure Value"
- **Steering:** `product.md` (always), `backlog-standards.md` (auto)
- **Skill:** `/backlog-management` — risk-weighted prioritization balancing feature velocity vs security debt
- **Subagent:** `story-prioritizer` — weighs security vulnerabilities, regulatory deadlines, and business value
- **Example:** "Prioritize these backlog items — we have 3 Critical CVEs and a MAS audit in 2 weeks"

#### Scrum Master — DevSecOps Process Facilitator
- **Steering:** `scrum-devsecops.md` (always) — Sprint cadence with security integration
- **Skill:** `/retro-pipeline-review` — Sprint Retrospective focused on pipeline optimization
- **Hook:** `sprint-status-sync` (Agent Stop) — checks for TODO/SECURITY-TODO markers
- **Example:** "Prepare the Sprint Retrospective agenda focusing on our DAST scan performance"

#### Security Champion
- **Steering:** `security-policy.md` (always), `scrum-devsecops.md` (always)
- **Skill:** `/threat-modeling` — STRIDE analysis during Sprint Planning
- **Subagent:** `security-champion` — threat modeling, scan triage, security mentoring
- **Example:** "Perform STRIDE threat modeling for the new payment API we're building this Sprint"

### Development Team — "Security-First Coders"

#### Backend Developer
- **Steering:** `api-standards.md` (fileMatch), `database-standards.md` (fileMatch)
- **Subagent:** `backend-builder` — Java/Spring Boot with shift-left security
- **Hooks:** `credential-guard` + `db-write-guard` (Pre Tool Use — blocks)
- **Example:** "Implement the transfer API with input validation, audit logging, and idempotency"

#### Frontend Developer
- **Steering:** `frontend-standards.md` (fileMatch)
- **Subagent:** `frontend-builder` — React with Security UX patterns
- **Example:** "Build the MFA enrollment flow — make it frictionless so users don't bypass it"

### Specialized DevSecOps Roles

#### DevSecOps / Platform Engineer — "Pipeline Architect"
- **Steering:** `pipeline-standards.md` (auto)
- **Skill:** `/pipeline-design` — CI/CD pipeline architecture with security gates
- **Subagent:** `pipeline-builder` — builds automated SAST/DAST/container scanning pipeline
- **Example:** "Optimize the pipeline — DAST scan is taking 15 minutes, target is under 10"

#### QA Engineer — "Automated Quality Engineer"
- **Steering:** `testing-standards.md` (fileMatch)
- **Subagent:** `test-runner` — includes security regression testing
- **Skill:** `/chaos-security-testing` — AI proactively "hacks" the Sprint output (IDOR, injection, auth bypass)
- **Hook:** `test-coverage-gate` (Post Task) — checks coverage thresholds
- **Example:** "Run chaos security tests against the new payment API — try IDOR, injection, and auth bypass attacks"

#### Security Engineer — "Tooling Provider"
- **Skill:** `/security-audit` — OWASP Top 10 + PCI-DSS checks
- **Skill:** `/chaos-security-testing` — proactive chaos hacking of Sprint output
- **Subagent:** `security-scanner` — SAST/DAST/dependency scanning with Snyk
- **Hook:** `security-audit-manual` (Manual Trigger ▷) — full codebase audit
- **Hook:** `security-self-heal-check` (Post Tool Use) — AI detects vulns and suggests fixes in real-time
- **Example:** "Run a full security audit and produce a findings report for the Sprint Review"

#### SRE — "Resilience & Observability"
- **Steering:** `sre-runbook.md` (auto)
- **Skill:** `/incident-response` — security incident handling + post-mortem
- **Subagent:** `observability-analyst` — SLO monitoring + security anomaly detection
- **Example:** "Analyze the anomalous login pattern detected by Datadog Security Monitoring"

#### DBA — "Data Privacy Guardian"
- **Steering:** `database-standards.md` (fileMatch)
- **Skill:** `/db-migration` — Flyway migrations with data privacy rules
- **Subagent:** `db-reader` — read-only analysis with PII encryption verification
- **Hook:** `db-write-guard` (Pre Tool Use — blocks dangerous SQL)
- **Example:** "Review V042 migration — verify PII columns use pgcrypto and non-prod masking is applied"

#### Software Architect — "Secure by Design"
- **Steering:** `architecture-standards.md` (auto)
- **Skill:** `/architecture-review` — Zero Trust review checklist + ADR template
- **Subagent:** `architecture-reviewer` — Zero Trust, defense in depth, compliance review
- **Example:** "Review the payment gateway integration architecture for Zero Trust compliance"

---

## 2-Week Sprint Security Integration

| Day | Activity | Security Integration |
|-----|----------|---------------------|
| Mon W1 | Sprint Planning (4 hrs) | Threat modeling for new features, security stories in backlog |
| Tue-Thu W1 | Development + Daily Scrum | Devs report scan results: "SonarQube flagged X, fixing today" |
| Fri W1 | Mid-sprint check | Pipeline health, scan trend review |
| Mon-Wed W2 | Development + Daily Scrum | Complete Sprint Goal, fix remaining scan findings |
| Thu W2 | Sprint Review (2 hrs) | Demo features + Green Build report (all scans passed) |
| Thu W2 | Retrospective (1.5 hrs) | "How to optimize security pipeline for next Sprint?" |
| Fri W2 | Deployment + monitoring | Canary release, security monitoring active |

---

## Hook Architecture

| Hook | Trigger | Action | Cost | Blocks? |
|------|---------|--------|------|---------|
| Block Prod Writes | Pre Tool Use (write) | Shell | Free | Yes |
| Credential Guard | Pre Tool Use (write) | Shell | Free | Yes |
| DB Write Guard | Pre Tool Use (shell, @aurora-dsql) | Shell | Free | Yes |
| Security Self-Heal Check | Post Tool Use (write) | Agent Prompt | Credits | No |
| Compliance Review | File Save (src/**) | Agent Prompt | Credits | No |
| Security Audit | Manual Trigger | Agent Prompt | Credits | No |
| Test Coverage Gate | Post Task Execution | Shell | Free | No |
| Sprint Status Sync | Agent Stop | Shell | Free | No |

---

## Architecture Principles

1. **Agentic AI as Digital Teammate** — AI agents are proactive participants, not passive tools
2. **Security is shift-left** — automated scanning on every commit, not just before release
3. **Self-healing development** — AI detects vulnerabilities and provides corrected code before peer review
4. **Autonomous deployment** — AI monitors canary releases and rolls back on security anomaly
5. **Steering instructs; Hooks enforce** — Pre Tool Use and Prompt Submit Shell hooks provide 100% deterministic enforcement
6. **Hooks fire in main agent only** — critical enforcement flows through the main agent
7. **Steering + MCP propagate to subagents** — security context inherited automatically
8. **Shell Command = free; Agent Prompt = credits** — use Shell for deterministic checks
9. **Every developer is a Security Developer** — not a separate team's problem

---

## Important Notes

- **Hook trigger type names** — This repo uses `fileSaved` which matches the official Kiro docs (kiro.dev/docs/hooks/types). The official trigger types are: Prompt Submit, Agent Stop, Pre Tool Use, Post Tool Use, File Create, File Save, File Delete, Pre Task Execution, Post Task Execution, Manual Trigger.
- **Hooks do NOT trigger inside subagents** — This is by design. All enforcement hooks run in the main agent only.
- **Post Tool Use hooks are advisory, not blocking** — The Security Self-Heal Check hook suggests fixes but cannot block the write operation. Only Pre Tool Use and Prompt Submit hooks can block.
- **GitHub and Jira are NOT official Kiro Powers** — They are configured as generic MCP servers. The npm package `@modelcontextprotocol/server-github` is the standard MCP GitHub server. Kiro's MCP server directory may show alternative URL-based configs.

---

## References

- [Kiro Official Documentation](https://kiro.dev/docs/)
- [2020 Scrum Guide](https://scrumguides.org/scrum-guide.html)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [STRIDE Threat Modeling](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool)
- [Kiro Powers Marketplace](https://kiro.dev/powers/)

## License

MIT — Adapt freely for your organization.
