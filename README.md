# Kiro IDE Best Practices: Phase-Based SDLC vs Sprint-Based DevSecOps

Ready-to-use [Kiro IDE](https://kiro.dev) configurations for banking software development teams. Two approaches to the same banking project — one organized by development phases and roles, the other by Scrum Sprints with security shift-left and Agentic AI.

## Which One Should I Use?

```
Do you work in fixed phases (Plan → Design → Build → Test → Deploy)?
  → Use phase-based-sdlc-kiro-best-practices/

Do you work in 2-week Sprints with a Scrum Master and Product Owner?
  → Use sprint-based-devsecops-kiro-best-practices/
```

| Question | SDLC | Scrum + DevSecOps |
|----------|------|-------------------|
| How does work flow? | Linear phases: Requirements → Design → Development → Testing → Deployment | 2-week Sprints: Plan → Code → Scan → Test → Release → Monitor → Feedback (repeat) |
| When does security happen? | Testing phase (near the end) | Every Sprint, every commit (shift-left from Day 1) |
| Who owns security? | Security Engineer team | Everyone — every developer is a "Security Developer" |
| How are teams organized? | By phase: BA team, Dev team, QA team, Ops team | One cross-functional Scrum Team (PO + SM + Developers) |
| How does AI help? | AI assists each role separately | AI acts as "Digital Teammate" — self-healing code, autonomous rollback |
| When do you release? | After all phases complete | At least once per Sprint (Sprint Review is not a gate) |
| How do you improve? | Post-project lessons learned | Every Sprint Retrospective (continuous improvement) |

## Quick Decision Guide

Choose **phase-based-sdlc-kiro-best-practices** if:
- Your team follows a traditional waterfall or phase-gate process
- You have separate teams for development, testing, and operations
- Security review happens before release, not during development
- You're new to Agile and want a familiar structure with Kiro
- Your organization requires formal phase sign-offs

Choose **sprint-based-devsecops-kiro-best-practices** if:
- Your team runs Scrum Sprints (1-4 weeks)
- You have a Product Owner and Scrum Master
- You want security baked into every Sprint (DevSecOps)
- You want AI agents that proactively find and fix vulnerabilities
- Your team is cross-functional (devs do testing, ops, and security)

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

## Getting Started with Kiro IDE

If you're new to Kiro, here's what these configurations give you:

1. **Steering** (`.kiro/steering/`) — Context files that tell Kiro about your project standards. They load automatically based on what you're working on.

2. **Subagents** (`.kiro/agents/`) — Specialized AI teammates with isolated context and tools. Invoke explicitly via slash command or from within a skill's execution flow.

3. **Skills** (`.kiro/skills/`) — Reusable workflows. Type `/threat-modeling` in chat to get the STRIDE threat model template.

4. **Hooks** (`.kiro/hooks/`) — Automated guardrails. A Pre Tool Use hook can block Kiro from writing credentials into your code — 100% deterministic, zero cost.

5. **MCP** (`.kiro/settings/mcp.json`) — External tool integrations (GitHub, Jira). Install Kiro Powers (Snyk, Datadog, Aurora DSQL) from the Powers panel.

## Setup (Either Approach)

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

## Kiro Five-Element Architecture

Both configurations are built on the [Kiro Five-Element Architecture](https://kiro.dev/docs/):

| Element | Purpose | Key Principle |
|---------|---------|--------------|
| Steering | Context and standards | Instructs the AI (soft guidance) |
| Hooks | Enforcement guardrails | Enforces rules (Pre Tool Use Shell = 100% deterministic) |
| Skills | Reusable workflows | Progressive disclosure (loads on demand via `/skill-name`) |
| Subagents | Specialized AI teammates | Isolated context, parallel execution, invoked explicitly or from skill flows |
| MCP/Powers | External tool integration | GitHub, Jira, Snyk, Datadog, Aurora DSQL, Figma |

Core rule: **Steering instructs; Hooks enforce.** If a guardrail must be 100% enforced, it must be a Pre Tool Use Shell Command hook.

## Tested & Validated

These configurations were comprehensively tested with 23 automated shell scripts (934 assertions, 96.47% pass rate), 28 skill activation evals (100% after refinement), 8 negative activation tests (zero false positives), and 4 quality evals (security scan, compliance audit, change request, banking rules). Key findings and all fixes are documented in [Issue #1](https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics/issues/1).

## References

- [Kiro IDE](https://kiro.dev) — Download and documentation
- [Kiro Five-Element Architecture](https://kiro.dev/docs/) — Steering, Hooks, Skills, Subagents, MCP/Powers
- [2020 Scrum Guide](https://scrumguides.org/scrum-guide.html) — Foundation for the Scrum approach
- [Kiro Powers Marketplace](https://kiro.dev/powers/) — 40+ official integrations

## License

MIT — Adapt freely for your organization.
