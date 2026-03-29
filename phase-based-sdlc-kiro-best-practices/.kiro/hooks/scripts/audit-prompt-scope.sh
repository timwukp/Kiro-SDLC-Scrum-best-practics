#!/bin/bash
# Hook: Prompt Scope Audit
# Trigger: agentStop
# Purpose: Log prompt topics for scope compliance auditing
# Non-blocking — audit only, does not prevent execution

AUDIT_LOG=".kiro/hooks/logs/scope-audit.log"
mkdir -p "$(dirname "$AUDIT_LOG")"

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Read agent output from stdin
AGENT_OUTPUT=$(cat)

# Extract a brief topic summary (first 200 chars)
TOPIC=$(echo "$AGENT_OUTPUT" | head -c 200 | tr '\n' ' ')

# Log the entry
echo "[$TIMESTAMP] $TOPIC" >> "$AUDIT_LOG"

# Always exit 0 — this is audit-only, never blocks
exit 0
