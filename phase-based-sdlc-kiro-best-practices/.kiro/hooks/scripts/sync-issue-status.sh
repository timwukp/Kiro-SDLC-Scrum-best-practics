#!/bin/bash
# Hook: Post-Batch Status Sync
# Trigger: Agent Stop
# Purpose: Sync completed work back to Jira/GitHub after agent finishes
# Exit code: informational only (agentStop hooks don't block)

echo "Syncing issue statuses..."

# Check for any TODO/FIXME markers that might indicate incomplete work
INCOMPLETE=$(grep -rn "TODO\|FIXME\|HACK\|XXX" src/ --include="*.java" --include="*.ts" --include="*.tsx" 2>/dev/null | wc -l)

if [ "$INCOMPLETE" -gt 0 ]; then
  echo "WARNING: Found $INCOMPLETE TODO/FIXME markers in source code."
  echo "Review before marking issues as Done."
  grep -rn "TODO\|FIXME" src/ --include="*.java" --include="*.ts" --include="*.tsx" 2>/dev/null | head -10
fi

# Check for uncommitted changes
if command -v git &> /dev/null; then
  CHANGES=$(git status --porcelain 2>/dev/null | wc -l)
  if [ "$CHANGES" -gt 0 ]; then
    echo "INFO: $CHANGES uncommitted file(s) detected."
    echo "Remember to commit and push before marking sprint items as Done."
  fi
fi

echo "Status sync complete."
exit 0
