---
inclusion: always
---
## Scrum + DevSecOps Sprint Framework

### Three Pillars of Empiricism (Foundation)
| Pillar | Description | DevSecOps Application |
|--------|-------------|----------------------|
| Transparency | Process and work visible to all | Security scan results visible in Daily Scrum, Green Build in Sprint Review |
| Inspection | Artifacts inspected frequently | SAST/DAST results inspected every commit, Sprint Review inspects security posture |
| Adaptation | Adjust when deviations detected | Pipeline optimized in Retro, DoD evolves with team maturity |

### Sprint Planning — Three Topics (per Scrum Guide)
| Topic | Question | DevSecOps Integration |
|-------|----------|----------------------|
| Why | Why is this Sprint valuable? | Sprint Goal includes security outcomes when relevant |
| What | What can be Done this Sprint? | PO + team select PBIs including security stories from threat modeling |
| How | How will the work get done? | Developers decompose into ≤ 1 day tasks, include security tasks |

### 2-Week Sprint Cadence

#### Week 1
| Day | Ceremony / Activity | Security Integration |
|-----|--------------------|--------------------|
| Mon | Sprint Planning (≤ 4 hrs) | Threat modeling for new features, security stories in Sprint Backlog |
| Mon | Backlog refinement (1 hr) | Security Champion reviews upcoming PBIs for risk |
| Tue-Thu | Development + Daily Scrum (15 min) | Devs report scan results: "SonarQube flagged X, refactoring today" |
| Fri | Mid-sprint review (informal) | Pipeline health check, scan result trends |

#### Week 2
| Day | Ceremony / Activity | Security Integration |
|-----|--------------------|--------------------|
| Mon-Wed | Development + Daily Scrum | Focus on completing Sprint Goal, fixing scan findings |
| Thu | Sprint Review (≤ 2 hrs) | Demo feature + show Green Build report (all scans passed) |
| Thu | Sprint Retrospective (≤ 1.5 hrs) | "How can we optimize the security pipeline for next Sprint?" |
| Fri | Deployment + monitoring | Canary release, security monitoring active |

### Sprint Planning — Security Integration
1. PO presents prioritized backlog (includes security stories)
2. Security Champion leads 15-min threat model for new features
3. Team asks: "What are the security risks of this new API?"
4. Security tasks added to Sprint Backlog alongside feature work
5. Sprint Goal includes security outcomes when relevant

### Daily Scrum — Security Awareness
- Developers mention scan results: "SAST flagged SQL injection risk, fixing today"
- Security Champion flags any new CVEs affecting dependencies
- Blocked items due to security findings get immediate attention

### Sprint Review — Security Transparency
- Demo new features to stakeholders
- Show Green Build report: all SAST/DAST/dependency scans passed
- Present security metrics: findings resolved, mean time to remediate
- Stakeholders see security as part of delivered value

### Sprint Retrospective — Pipeline Optimization
- Review security pipeline performance (scan times, false positive rate)
- Discuss: "Are security scans slowing us down? How to optimize?"
- Identify security knowledge gaps for team training
- Update Definition of Done if security practices evolved

### Definition of Done (DevSecOps)
A feature is NOT "Done" until:
- [ ] Code written and peer-reviewed
- [ ] Automated security scans (SAST/DAST) passed
- [ ] No High or Critical vulnerabilities open
- [ ] Dependency scan clean (no Critical CVEs)
- [ ] Compliance documentation updated (if applicable)
- [ ] Deployed to staging and verified
