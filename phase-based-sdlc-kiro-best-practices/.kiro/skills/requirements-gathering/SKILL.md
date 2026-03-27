---
name: requirements-gathering
description: Gathering, documenting, and validating business requirements for banking features
---

# Requirements Gathering Skill

## When to Use
Invoke this skill when writing user stories, acceptance criteria, or requirements documents for banking features.

## Process
1. **Elicit**: Ask clarifying questions about the business need
2. **Document**: Write user stories in standard format (As a... I want... So that...)
3. **Acceptance Criteria**: Define Given/When/Then scenarios (minimum 3 per story)
4. **Regulatory Check**: Flag any requirement touching regulated areas (payments, PII, authentication)
5. **Dependencies**: Identify cross-service and external system dependencies
6. **Validate**: Run requirements-validator subagent for completeness check

## User Story Template
```markdown
### [JIRA-ID] Story Title

**As a** [banking role / customer type],
**I want to** [action],
**So that** [business value].

#### Acceptance Criteria
- **Given** [precondition], **When** [action], **Then** [expected outcome]
- **Given** [precondition], **When** [action], **Then** [expected outcome]
- **Given** [precondition], **When** [action], **Then** [expected outcome]

#### Non-Functional Requirements
- Performance: [latency/throughput target]
- Security: [authentication/authorization requirements]
- Compliance: [regulatory references]

#### Dependencies
- [Service/team dependencies]

#### Out of Scope
- [Explicitly excluded items]
```

## Banking-Specific Considerations
- Any feature handling money must specify currency and rounding rules
- PII handling features require PDPA impact assessment
- Payment features require PCI-DSS scope assessment
- Authentication changes require MAS TRM review
