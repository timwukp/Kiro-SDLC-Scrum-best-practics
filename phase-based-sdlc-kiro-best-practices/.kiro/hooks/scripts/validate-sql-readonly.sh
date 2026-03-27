#!/bin/bash
# Hook: DB Write Guard
# Trigger: Pre Tool Use (shell, @aurora-dsql)
# Purpose: Block dangerous SQL mutation statements
# Exit code: non-zero = BLOCK the operation

TOOL_INPUT=$(cat)

# Dangerous SQL patterns (case-insensitive)
DANGEROUS_PATTERNS=(
  "\\bINSERT\\b"
  "\\bUPDATE\\b"
  "\\bDELETE\\b"
  "\\bDROP\\b"
  "\\bTRUNCATE\\b"
  "\\bALTER\\b"
  "\\bCREATE\\s+TABLE\\b"
  "\\bCREATE\\s+DATABASE\\b"
  "\\bGRANT\\b"
  "\\bREVOKE\\b"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$TOOL_INPUT" | grep -qEi "$pattern"; then
    echo "BLOCKED: Dangerous SQL statement detected."
    echo "Pattern: $pattern"
    echo "Database mutations are only allowed via Flyway migration scripts."
    echo "Use the db-migration skill: /db-migration"
    exit 1
  fi
done

exit 0
