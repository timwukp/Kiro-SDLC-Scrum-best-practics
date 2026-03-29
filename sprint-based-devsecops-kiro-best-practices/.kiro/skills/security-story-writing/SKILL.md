---
name: security-story-writing
description: Write security user stories, acceptance criteria, and security-aware requirements for banking features
---

# Security Story Writing Skill

## When to Use
Invoke when writing security stories, adding security considerations to feature stories, or creating security-aware requirements.

## Security Story Template
```markdown
### [JIRA-ID] Security Story Title

**As a** [security role / system],
**I want to** [security control],
**So that** [risk is mitigated].

**Threat:** [STRIDE category from threat model]
**Compliance:** [MAS TRM / PCI-DSS / PDPA reference]

#### Acceptance Criteria
- **Given** [precondition], **When** [attack vector], **Then** [system prevents/detects]
- **Given** [precondition], **When** [normal operation], **Then** [security control active]

#### Security Regression Test
- Test that [vulnerability] cannot be exploited after fix
```

## Feature Story with Security Consideration
```markdown
### [JIRA-ID] Feature Title

**As a** [banking customer],
**I want to** [action],
**So that** [business value].

**Security Consideration:** [What could go wrong? STRIDE reference]

#### Acceptance Criteria
- [Functional criteria]
- **Security:** [Security-specific acceptance criterion]
```

## Examples
- "As the auth service, I want to lock accounts after 5 failed login attempts, so that brute force attacks are prevented."
- "As a developer, I want all API inputs validated against a whitelist, so that injection attacks are blocked."
