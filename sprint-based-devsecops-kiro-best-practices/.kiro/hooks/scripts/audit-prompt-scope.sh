#!/bin/bash
# Hook: Project Scope Audit
# Trigger: agentStop
# Purpose: Audit-only hook that logs agent session scope for credit usage tracking.
# Always exits 0 — never blocks agent execution.

AUDIT_LOG="${AUDIT_LOG:-/tmp/kiro-scope-audit.log}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Read stdin (agent context) if available
CONTEXT=""
if [ ! -t 0 ]; then
  CONTEXT=$(cat)
fi

# Log the session end event
echo "${TIMESTAMP} | agent_stop | context_length=${#CONTEXT}" >> "$AUDIT_LOG"

# Always allow — this is audit-only
exit 0
