#!/bin/bash
# Hook: Credential Guard | Trigger: Pre Tool Use (write)
# Exit code: non-zero = BLOCK

TOOL_INPUT=$(cat)

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
  if echo "$TOOL_INPUT" | grep -qEi "$pattern"; then
    echo "BLOCKED: Potential hardcoded credential detected."
    echo "Pattern matched: $pattern"
    echo "Use AWS Secrets Manager for all credentials."
    exit 1
  fi
done
exit 0
