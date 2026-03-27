#!/bin/bash
# Hook: DB Write Guard | Trigger: Pre Tool Use (shell, @aurora-dsql)
# Exit code: non-zero = BLOCK

TOOL_INPUT=$(cat)

DANGEROUS_PATTERNS=(
  "\\bINSERT\\b"
  "\\bUPDATE\\b"
  "\\bDELETE\\b"
  "\\bDROP\\b"
  "\\bTRUNCATE\\b"
  "\\bALTER\\b"
  "\\bCREATE\\s+TABLE\\b"
  "\\bGRANT\\b"
  "\\bREVOKE\\b"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$TOOL_INPUT" | grep -qEi "$pattern"; then
    echo "BLOCKED: Dangerous SQL statement detected."
    echo "Database mutations only via Flyway migrations."
    echo "Use /db-migration skill."
    exit 1
  fi
done
exit 0
