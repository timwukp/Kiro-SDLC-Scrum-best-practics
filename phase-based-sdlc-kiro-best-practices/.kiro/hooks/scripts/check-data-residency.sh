#!/bin/bash
# Hook: Data Residency Guard
# Trigger: Pre Tool Use (write)
# Purpose: Block infrastructure writes targeting non-Singapore regions.
# Ensures customer data remains in ap-southeast-1 per MAS TRM requirements.
# Exit code: non-zero = BLOCK the write operation

# Read stdin
INPUT=""
if [ ! -t 0 ]; then
  INPUT=$(cat)
fi

# Graceful handling of empty input
if [ -z "$INPUT" ]; then
  exit 0
fi

# Extract file path from JSON input
FILE_PATH=$(echo "$INPUT" | grep -oE '"path"\s*:\s*"[^"]*"' | head -1 | sed 's/"path"\s*:\s*"//;s/"$//')

# Only check infrastructure files
if ! echo "$FILE_PATH" | grep -qiE '(^infra/|/infra/|\.cdk\.|cdk\.json)'; then
  exit 0
fi

# Check for non-compliant regions in data storage contexts
if echo "$INPUT" | grep -qiE '(us-east-1|us-west-2|eu-west-1|eu-central-1|ap-northeast-1|ap-south-1)'; then
  echo "BLOCKED: Infrastructure file references non-Singapore region."
  echo "Customer data must remain in ap-southeast-1 per MAS TRM."
  echo "File: $FILE_PATH"
  exit 1
fi

exit 0
