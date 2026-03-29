#!/bin/bash
# Hook: Block Prod Writes
# Trigger: Pre Tool Use (write)
# Purpose: Prevent agent from writing to production-protected paths
# Exit code: non-zero = BLOCK the write operation

PROTECTED_PATHS=(
  "config/prod/"
  "infra/lib/.*Prod"
  "application-prod.yml"
  "deploy-prod.yml"
  ".github/workflows/deploy-prod"
  "release-.*\\.yml"
)

# Read the tool input from stdin (Kiro passes tool arguments)
TOOL_INPUT=$(cat)

# Extract file path from tool input
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"path"\s*:\s*"[^"]*"' | head -1 | sed 's/"path"\s*:\s*"//;s/"$//')

if [ -z "$FILE_PATH" ]; then
  # No path found in input — allow (not a file write)
  exit 0
fi

for pattern in "${PROTECTED_PATHS[@]}"; do
  if echo "$FILE_PATH" | grep -qE "$pattern"; then
    echo "BLOCKED: Write to protected production path: $FILE_PATH"
    echo "Production changes must go through the prod-change-request skill."
    echo "Use: /prod-change-request to prepare a CAB-approved change request."
    exit 1
  fi
done

# Path is not protected — allow
exit 0
