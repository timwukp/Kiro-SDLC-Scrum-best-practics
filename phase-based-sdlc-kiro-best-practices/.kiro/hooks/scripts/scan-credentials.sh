#!/bin/bash
# Hook: Credential Guard
# Trigger: Pre Tool Use (write)
# Purpose: Block writes containing hardcoded credentials
# Exit code: non-zero = BLOCK the write operation

TOOL_INPUT=$(cat)

# Extract content being written
CONTENT=$(echo "$TOOL_INPUT" | grep -oE '"text"\s*:\s*"[^"]*"' | head -1)
if [ -z "$CONTENT" ]; then
  CONTENT=$(echo "$TOOL_INPUT" | grep -oE '"content"\s*:\s*"[^"]*"' | head -1)
fi

# Patterns that indicate hardcoded credentials
PATTERNS=(
  "AKIA[A-Z0-9]{16}"
  "password\s*=\s*['\"][^'\"]+['\"]"
  "secret_key\s*=\s*['\"][^'\"]+['\"]"
  "-----BEGIN RSA"
  "-----BEGIN PRIVATE"
  "-----BEGIN EC PRIVATE"
  "api_key\s*=\s*['\"][^'\"]+['\"]"
  "jdbc:.*password="
  "mongodb://.*:.*@"
)

for pattern in "${PATTERNS[@]}"; do
  if echo "$TOOL_INPUT" | grep -qEi -- "$pattern"; then
    echo "BLOCKED: Potential hardcoded credential detected."
    echo "Pattern matched: $pattern"
    echo "Use AWS Secrets Manager for all credentials."
    echo "Reference: .kiro/steering/security-policy.md"
    exit 1
  fi
done

exit 0
