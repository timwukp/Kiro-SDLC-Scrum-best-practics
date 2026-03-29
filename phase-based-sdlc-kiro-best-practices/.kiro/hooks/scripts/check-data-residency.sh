#!/bin/bash
# Hook: Data Residency Guard
# Trigger: Pre Tool Use (write)
# Purpose: Ensure CDK/infra writes use ap-southeast-1 for customer data resources
# MAS TRM: Customer data must remain in Singapore region
# Exit code: non-zero = BLOCK

TOOL_INPUT=$(cat)

# Extract file path from tool input
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"path"\s*:\s*"[^"]*"' | head -1 | sed 's/"path"\s*:\s*"//;s/"$//')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Only check infra/CDK files
if ! echo "$FILE_PATH" | grep -qE "(infra/|cdk/|\.cdk\.|cloudformation)"; then
  exit 0
fi

# Extract file content from tool input
FILE_CONTENT=$(echo "$TOOL_INPUT" | grep -oE '"(text|content)"\s*:\s*"[^"]*"' | head -1)

# Check for non-Singapore regions in data-storing resources
NON_SG_REGIONS=$(echo "$FILE_CONTENT" | grep -oE '(us-east-1|us-west-2|eu-west-1|eu-central-1|ap-northeast-1|ap-south-1)' | head -1)

if [ -n "$NON_SG_REGIONS" ]; then
  # Check if it's a data-storing resource (RDS, DynamoDB, S3, ElastiCache, MSK)
  if echo "$FILE_CONTENT" | grep -qiE "(DatabaseInstance|Table|Bucket|CfnCacheCluster|CfnCluster|aurora|dynamodb|s3\.Bucket|rds\.)"; then
    echo "BLOCKED: Data residency violation detected."
    echo "Region '$NON_SG_REGIONS' found in CDK file: $FILE_PATH"
    echo "MAS TRM requires customer data resources in ap-southeast-1 (Singapore)."
    echo "Cross-border data transfer requires explicit compliance approval."
    exit 1
  fi
fi

exit 0
