---
inclusion: auto
name: flow-metrics
description: Kanban flow metrics, WIP limits, cycle time, throughput, or sprint velocity analysis
---
## Scrum with Kanban — Flow Optimization

Kanban enhances Scrum without changing the framework. Nothing in the Scrum Guide changes.

### 4 Flow Metrics (Track Every Sprint)
| Metric | Definition | Action |
|--------|-----------|--------|
| Work in Progress (WIP) | Items started but not finished | Limit WIP to improve flow — fewer items = faster completion |
| Cycle Time | Time from start to finish per item | If too long, first action: lower WIP |
| Work Item Age | Time since an in-progress item started | Aging items signal problems — swarm or escalate |
| Throughput | Items finished per Sprint | Use historical throughput for Sprint Planning capacity |

### WIP Limits (Pull System)
- Team WIP limit: [number of Developers × 1.5] items max in progress
- Creates a pull system — new work starts only when capacity is clear
- Prevents context-switching and improves focus (Scrum Value: Focus)
- If WIP limit is broken, team discusses at Daily Scrum before pulling new work

### Service Level Expectation (SLE)
- "85% of work items should be finished in 8 days or less"
- Based on historical Cycle Time data
- Items exceeding SLE get immediate attention at Daily Scrum

### Flow-Enhanced Scrum Events
| Event | Flow Enhancement |
|-------|-----------------|
| Sprint Planning | Use historical throughput to forecast capacity |
| Daily Scrum | Focus on flow: What's blocked? What's aging? WIP limit broken? |
| Sprint Review | Inspect flow metrics alongside feature demos |
| Retrospective | Use cumulative flow diagram to visualize WIP, Cycle Time, Throughput |

### DORA Metrics (DevSecOps Flow)
| Metric | Target | Measured In |
|--------|--------|-------------|
| Lead Time for Changes | < 1 day | Pipeline standards |
| Deployment Frequency | Multiple per Sprint | Pipeline standards |
| Change Failure Rate | < 5% | Pipeline standards |
| Mean Time to Recovery | < 1 hour | SRE runbook |

### Key Insight
"Teams must deliver value at least once per Sprint." — Kanban Guide for Scrum Teams.
Sprint Review is never a gate to releasing value. Multiple Increments per Sprint is the goal.
