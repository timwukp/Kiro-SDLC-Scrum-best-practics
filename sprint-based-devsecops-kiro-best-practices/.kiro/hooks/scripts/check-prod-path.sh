#!/bin/bash
# Hook: Block Prod Writes | Trigger: Pre Tool Use (write)
# Exit code: non-zero = BLOCK

PROTECTED_PATHS=(
  "config/prod/"
  "infra/lib/.*Prod"
  "application-prod.yml"
  "deploy-prod.yml"
  ".github/workflows/deploy-prod"
  "release-.*\\.yml"
)

TOOL_INPUT=$(cat)
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"path"\s*:\s*"[^"]*"' | head -1 | sed 's/"path"\s*:\s*"//;s/"$//')

if [ -z "$FILE_PATH" ]; then exit 0; fi

for pattern in "${PROTECTED_PATHS[@]}"; do
  if echo "$FILE_PATH" | grep -qE "$pattern"; then
    echo "BLOCKED: Write to protected path: $FILE_PATH"
    echo "Use /prod-change-request for CAB approval."
    exit 1
  fi
done
exit 0
