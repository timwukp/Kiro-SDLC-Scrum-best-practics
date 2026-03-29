# Kiro IDE Best Practices: Phase-Based SDLC vs Sprint-Based DevSecOps

Ready-to-use [Kiro IDE](https://kiro.dev) configurations for banking software development teams. [Kiro](https://kiro.dev) is an AI-powered IDE that uses steering files, hooks, skills, subagents, and MCP integrations to embed project standards directly into your development workflow.

Two approaches to the same banking project — pick the one that matches how your team works:

| | Phase-Based SDLC | Sprint-Based DevSecOps |
|---|---|---|
| **Best for** | Teams with linear phases and specialized roles | Scrum teams with cross-functional developers |
| **Work flow** | Requirements → Design → Development → Testing → Deployment | 2-week Sprints: Plan → Code → Scan → Test → Release → Monitor |
| **Security** | Testing phase (near the end) | Every Sprint, every commit (shift-left) |
| **Who owns security** | Security Engineer team | Everyone — every developer is a "Security Developer" |
| **AI approach** | AI assists each role separately | AI as "Digital Teammate" — self-healing code, autonomous rollback |
| **Release cadence** | After all phases complete | At least once per Sprint |
| **Folder** | [`phase-based-sdlc-kiro-best-practices/`](./phase-based-sdlc-kiro-best-practices/) | [`sprint-based-devsecops-kiro-best-practices/`](./sprint-based-devsecops-kiro-best-practices/) |

## Prerequisites

- [Kiro IDE](https://kiro.dev) installed
- Git
- Node.js 18+ (for `npx` — used by MCP servers)
- A project to apply the configuration to (or try standalone — see Setup below)

## What's Inside Each

### [phase-based-sdlc-kiro-best-practices/](./phase-based-sdlc-kiro-best-practices/)
Phase-based SDLC approach organized by 14 roles across 5 phases.

| Element | Count | Highlights |
|---------|-------|-----------|
| Steering | 13 | Role-based: BA, Architect, Frontend, Backend, QA, DevOps, SRE, DBA |
| Subagents | 14 | One per SDLC role (requirements-validator, backend-builder, test-runner, etc.) |
| Skills | 15 | requirements-gathering, sprint-planning, code-standards, threat-modeling, deployment-checklist |
| Hooks | 10 | Credential guard, prod write lock, DB write guard, coding standards, data residency guard, scope audit |
| Scripts | 8 | Shell scripts for deterministic enforcement |
| Compliance Docs | 7 | DR plan, pen testing, vendor risk register, board reporting, SIEM, threat modeling process |

### [sprint-based-devsecops-kiro-best-practices/](./sprint-based-devsecops-kiro-best-practices/)
DevSecOps + Scrum approach with Agentic AI as Digital Teammate.

| Element | Count | Highlights |
|---------|-------|-----------|
| Steering | 17 | Scrum Guide principles + DevSecOps: Three Pillars, Sprint Goal crafting, INVEST, Kanban flow metrics, Scrum Master 6 stances, Zombie Scrum anti-patterns, UX dual-track |
| Subagents | 15 | Scrum-specific: security-champion, threat-modeler, pipeline-builder + self-healing code-reviewer |
| Skills | 14 | threat-modeling, security-story-writing, chaos-security-testing, sprint-security-review, retro-pipeline-review |
| Hooks | 10 | Same enforcement + Security Self-Heal Check, data residency guard, scope audit |
| Scripts | 7 | Shell scripts for deterministic enforcement |
| Compliance Docs | 6 | DR plan, pen testing, vendor risk register, board reporting, SIEM integration |

## What They Share (Same Banking Context)

Both configurations use the same banking domain:
- Java 21, Spring Boot 3.x, React 18 + TypeScript, Aurora PostgreSQL, AWS
- MAS TRM 2023, PCI-DSS v4.0, SOX, PDPA compliance
- Production path protection (CAB approval required)
- Credential leak prevention (AWS Secrets Manager enforced)
- Database mutation guard (Flyway migrations only)
- BigDecimal for money, audit logging, input validation

## Kiro Five-Element Architecture

Both configurations are built on the [Kiro Five-Element Architecture](https://kiro.dev/docs/):

| Element | What It Does | Key Principle |
|---------|-------------|--------------|
| **Steering** (`.kiro/steering/`) | Context files that tell Kiro about your project standards. Load automatically based on what you're working on. | Soft guidance — instructs the AI |
| **Hooks** (`.kiro/hooks/`) | Automated guardrails. Pre Tool Use hooks can block operations (e.g., credential writes). | Hard enforcement — Shell Command hooks are 100% deterministic, zero cost |
| **Skills** (`.kiro/skills/`) | Reusable workflows. Type `/threat-modeling` in chat to get the STRIDE template. | Progressive disclosure — loads on demand |
| **Subagents** (`.kiro/agents/`) | Specialized AI teammates with isolated context and tools. Invoke explicitly or from within skill flows. | Isolated context, parallel execution |
| **MCP/Powers** (`.kiro/settings/mcp.json`) | External tool integrations (GitHub, Jira, Snyk, Datadog). | Extends Kiro with external capabilities |

Core rule: **Steering instructs; Hooks enforce.** If a guardrail must be 100% enforced, it must be a Pre Tool Use Shell Command hook.

## Setup

### Option A: Apply to your existing project

```bash
# 1. Clone this repo
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git

# 2. Pick your approach and copy into your project
cp -r phase-based-sdlc-kiro-best-practices/.kiro /path/to/your-project/
# OR
cp -r sprint-based-devsecops-kiro-best-practices/.kiro /path/to/your-project/

# 3. Copy AGENTS.md to your project root
cp phase-based-sdlc-kiro-best-practices/AGENTS.md /path/to/your-project/
# OR
cp sprint-based-devsecops-kiro-best-practices/AGENTS.md /path/to/your-project/

# 4. Copy reference docs and config (recommended)
cp -r phase-based-sdlc-kiro-best-practices/docs /path/to/your-project/
cp -r phase-based-sdlc-kiro-best-practices/config /path/to/your-project/

# 5. Make hook scripts executable
chmod +x /path/to/your-project/.kiro/hooks/scripts/*.sh

# 6. Open your project in Kiro IDE — steering loads automatically
```

### Option B: Explore standalone (no existing project needed)

```bash
# Clone and open directly in Kiro to explore the configuration
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git
cd Kiro-SDLC-Scrum-best-practics/sprint-based-devsecops-kiro-best-practices
chmod +x .kiro/hooks/scripts/*.sh

# Open this folder in Kiro IDE
# Try: "/threat-modeling" or "/security-audit" in chat
```

## Abbreviations

| Term | Meaning |
|------|---------|
| PO | Product Owner (Scrum accountability) |
| SM | Scrum Master (Scrum accountability) |
| BA | Business Analyst |
| QA | Quality Assurance |
| SRE | Site Reliability Engineer |
| DBA | Database Administrator |
| CISO | Chief Information Security Officer |
| CAB | Change Advisory Board |
| SDLC | Software Development Life Cycle |
| ADR | Architecture Decision Record |
| IaC | Infrastructure as Code |
| CDK | AWS Cloud Development Kit |
| MCP | Model Context Protocol |
| SAST | Static Application Security Testing |
| DAST | Dynamic Application Security Testing |
| STRIDE | Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege |
| OWASP | Open Worldwide Application Security Project |
| CVE | Common Vulnerabilities and Exposures |
| MFA | Multi-Factor Authentication |
| JWT | JSON Web Token |
| DR | Disaster Recovery |
| RTO / RPO | Recovery Time Objective / Recovery Point Objective |
| SLO / SLI | Service Level Objective / Service Level Indicator |
| DORA | DevOps Research and Assessment (metrics) |
| MAS TRM | Monetary Authority of Singapore — Technology Risk Management |
| PCI-DSS | Payment Card Industry Data Security Standard |
| PDPA | Personal Data Protection Act (Singapore) |
| SOX | Sarbanes-Oxley Act |

## Tested & Validated

These configurations were comprehensively tested with 23 automated shell scripts (934 assertions, 96.47% pass rate), 28 skill activation evals (100% after refinement), 8 negative activation tests (zero false positives), and 4 quality evals (security scan, compliance audit, change request, banking rules). Key findings and all fixes are documented in [Issue #1](https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics/issues/1).

## References

- [Kiro IDE](https://kiro.dev) — Download and documentation
- [Kiro Five-Element Architecture](https://kiro.dev/docs/) — Steering, Hooks, Skills, Subagents, MCP/Powers
- [2020 Scrum Guide](https://scrumguides.org/scrum-guide.html) — Foundation for the Scrum approach
- [Kiro Powers Marketplace](https://kiro.dev/powers/) — 40+ official integrations

## License

MIT — Adapt freely for your organization.
