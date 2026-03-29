# Board Technology Risk Reporting Template

## MAS TRM §9.2.1 Compliance

### Reporting Cadence
- **Quarterly:** Board Technology Risk Report
- **Ad-hoc:** Material incident reports within 24 hours
- **Annual:** Comprehensive technology risk assessment

### Quarterly Report Template

```markdown
# Technology Risk Report — Q[N] [YYYY]
**Prepared by:** CISO / CTO
**Date:** [YYYY-MM-DD]
**Classification:** CONFIDENTIAL

## Executive Summary
[2-3 sentence overview of technology risk posture]

## Key Risk Indicators (KRIs)
| KRI | Current | Target | Trend | Status |
|-----|---------|--------|-------|--------|
| Open Critical/High vulnerabilities | [N] | 0 | ↑↓→ | 🟢🟡🔴 |
| Mean Time to Remediate (Critical) | [N days] | 7 days | ↑↓→ | 🟢🟡🔴 |
| System availability (Transaction API) | [N%] | 99.99% | ↑↓→ | 🟢🟡🔴 |
| Unpatched Critical CVEs | [N] | 0 | ↑↓→ | 🟢🟡🔴 |
| Failed security scans (pipeline) | [N%] | <5% | ↑↓→ | 🟢🟡🔴 |
| Overdue vendor assessments | [N] | 0 | ↑↓→ | 🟢🟡🔴 |

## Incidents This Quarter
| Date | Severity | Description | Resolution | Customer Impact |
|------|----------|-------------|------------|-----------------|
| [Date] | SEV[N] | [Brief] | [Status] | [Yes/No, details] |

## Compliance Status
| Framework | Status | Next Audit | Gaps |
|-----------|--------|------------|------|
| MAS TRM | [Compliant/Gaps] | [Date] | [N open items] |
| PCI-DSS | [Compliant/Gaps] | [Date] | [N open items] |
| SOX | [Compliant/Gaps] | [Date] | [N open items] |

## Top Risks & Mitigations
| # | Risk | Likelihood | Impact | Mitigation | Owner | Due |
|---|------|-----------|--------|------------|-------|-----|
| 1 | [Risk] | H/M/L | H/M/L | [Action] | [Name] | [Date] |

## Recommendations for Board Action
1. [Recommendation requiring board decision]
```
