# Board Technology Risk Reporting

> Reference: MAS TRM 2023 Section 9.2.1

## Purpose

This document defines the cadence, format, and distribution requirements for technology risk reporting to the Board Risk Committee and senior management.

## Reporting Cadence

| Report | Audience | Frequency | Deadline |
|--------|----------|-----------|----------|
| Technology Risk Report | Board Risk Committee | Quarterly | 10 business days after quarter end |
| Security Posture Update | CTO / CISO | Monthly | 5 business days after month end |
| Incident Flash Report | Board Risk Committee | As needed | Within 24 hours of SEV1 incident |

## Board Report Template

### 1. Executive Summary

- Overall risk posture: **Green** / **Amber** / **Red**
- Key changes since last report
- Items requiring Board attention or decision

### 2. Key Risk Indicators (KRIs)

| Indicator | Target | Current | Trend | Status |
|-----------|--------|---------|-------|--------|
| System availability vs SLO | >= 99.99% (Txn), >= 99.95% (Account) | | | |
| Security incidents (SEV1/SEV2) | 0 SEV1, <= 2 SEV2 per quarter | | | |
| Open critical vulnerabilities | 0 Critical, <= 5 High | | | |
| Mean Time to Recovery (MTTR) | < 1 hour | | | |
| Patch compliance (critical CVEs) | 100% within SLA | | | |

### 3. Security Posture

| Area | Status | Details |
|------|--------|---------|
| SAST scan results | | Summary of SonarQube / Snyk Code findings |
| DAST scan results | | Summary of OWASP ZAP findings |
| Dependency vulnerability trends | | Month-over-month Critical/High CVE count |
| Penetration test status | | Last test date, open findings, remediation progress |
| Container image scan results | | Snyk Container / ECR scan summary |

### 4. Regulatory Compliance

| Framework | Compliance % | Gap Count | Key Gaps |
|-----------|-------------|-----------|----------|
| MAS TRM 2023 | | | |
| PCI-DSS | | | |
| PDPA | | | |

### 5. Incident Summary

| Metric | This Quarter | Previous Quarter | Trend |
|--------|-------------|-----------------|-------|
| SEV1 incidents | | | |
| SEV2 incidents | | | |
| Top root causes | | | |
| Average resolution time | | | |
| Customer impact events | | | |

### 6. DORA Metrics

| Metric | Target | Current | Trend |
|--------|--------|---------|-------|
| Deployment frequency | Multiple per sprint | | |
| Lead time for changes | < 1 day | | |
| Change failure rate | < 5% | | |
| Mean time to recovery | < 1 hour | | |

### 7. Emerging Threats

- Industry threat landscape updates relevant to banking
- New CVEs affecting platform technologies
- Regulatory changes on the horizon

### 8. Action Items

| ID | Action | Owner | Due Date | Status |
|----|--------|-------|----------|--------|
| | | | | |

## Distribution and Classification

- **Classification**: CONFIDENTIAL -- secure distribution only
- **Distribution**: Board Risk Committee members, CTO, CISO, VP Engineering
- **Format**: Presentation deck with supporting data appendix
- **Storage**: Encrypted SharePoint / Board portal with access controls
- **Archive**: 7 years per MAS TRM audit requirements

## Document Control

| Field | Value |
|-------|-------|
| Owner | CISO / VP Engineering |
| Review Frequency | Quarterly (aligned with Board reporting cycle) |
| Retention | 7 years (MAS TRM audit requirement) |
| Classification | CONFIDENTIAL |
