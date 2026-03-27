---
inclusion: always
---
## Banking Platform — Product Context (DevSecOps + Scrum)

### Business Domain
- Core Banking System: Account management, transactions, payments, lending
- Customer channels: Web portal (React), Mobile API, Branch systems
- Regulatory jurisdiction: MAS (Singapore), PCI-DSS, SOX, PDPA

### DevSecOps Philosophy — Agentic AI as Digital Teammate
- Security is shift-left — baked into every Sprint from Day 1
- Every developer is a "Security Developer" — not a separate team's problem
- Kiro AI agents act as "Digital Teammates" embedded in the Scrum process:
  - Planning: AI performs automated threat modeling on every user story
  - Design: AI auto-audits IaC (CDK/Terraform) for Zero Trust before human review
  - Development: AI detects vulnerabilities and suggests self-healing fixes in real-time
  - Testing: AI runs proactive security testing ("chaos hacking") against Sprint output
  - Deployment: AI monitors canary releases and triggers autonomous rollback on security anomaly
- Automated security gates in CI/CD pipeline — SAST, DAST, container scanning
- Definition of Done includes security — no feature is "Done" without passing scans

### Scrum Framework (2020 Scrum Guide)
- 2-week Sprints, single Product Backlog, single Product Owner
- Sprint Goal drives coherence — not a list of tickets
- Empiricism: Transparency → Inspection → Adaptation
- Five Scrum Values: Courage, Focus, Commitment, Respect, Openness
- Three Accountabilities (not "roles"): Product Owner, Scrum Master, Developers
- Product Goal: the long-term objective the Scrum Team plans against
- Sprint Goal: single objective for the Sprint — outcome-oriented, not a task list
- Definition of Done evolves as the team matures (see DoD Evolution below)

### DoD Evolution Path
| Maturity | DoD Additions |
|----------|--------------|
| New team | Code compiles, basic tests, peer review |
| Growing | Automated tests (unit + integration), CI pipeline green |
| Mature | SAST/DAST scanning, performance testing, deployed to staging |
| Advanced (current) | Security regression tests, chaos testing, canary deployment, observability |

### Business Rules
- All monetary calculations use BigDecimal — never floating point
- Transaction amounts validated: positive, non-zero, within account limits
- All customer-facing operations require audit trail logging
- Data retention: 7 years minimum for financial records
- Multi-currency support: SGD, USD, HKD, JPY, AUD

### Definition of Done (DevSecOps)
- [ ] Code peer-reviewed by at least one Developer
- [ ] Unit tests passing (≥ 80% coverage, critical paths ≥ 95%)
- [ ] Integration tests passing
- [ ] SAST scan passed (no High/Critical findings)
- [ ] DAST scan passed (no High/Critical findings)
- [ ] Dependency scan passed (no known Critical CVEs)
- [ ] No hardcoded credentials or PII exposure
- [ ] Compliance checklist signed off (if regulated feature)
- [ ] API documentation updated
- [ ] Deployed to staging and verified
