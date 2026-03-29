---
name: retro-pipeline-review
description: Facilitate Sprint Retrospective focused on DevSecOps pipeline optimization, security feedback loops, and scan performance
---

# Retrospective Pipeline Review Skill

## When to Use
Invoke during Sprint Retrospective to review DevSecOps pipeline performance.

## Pipeline Retro Template
```markdown
# Sprint [N] — Pipeline Retrospective

## Pipeline Metrics This Sprint
- Total pipeline time: [X min] (target: < 30 min)
- SAST scan time: [X min]
- DAST scan time: [X min]
- False positive rate: [X%] (target: < 15%)
- Pipeline failures: [X] (root causes: [list])

## What Went Well
- [e.g., "SAST caught SQL injection before code review"]

## What Needs Improvement
- [e.g., "DAST scan taking 15 min, slowing feedback"]

## Action Items for Next Sprint
| # | Action | Owner | Expected Impact |
|---|--------|-------|----------------|
| 1 | [Action] | [Name] | [Impact] |

## Security Knowledge Gaps Identified
- [e.g., "Team needs training on secure deserialization"]
```

## Discussion Prompts
- "Are security scans slowing us down? How can we optimize?"
- "What security findings surprised us this Sprint?"
- "Is our false positive rate acceptable? How to reduce it?"
- "Do we need to update our Definition of Done?"
