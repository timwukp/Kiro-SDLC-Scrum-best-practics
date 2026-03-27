#!/bin/bash
# Hook: Sprint Status Sync | Trigger: Agent Stop
# Checks for incomplete work markers and uncommitted changes

echo "Sprint status sync..."

INCOMPLETE=$(grep -rn "TODO\|FIXME\|HACK\|XXX\|SECURITY-TODO" src/ --include="*.java" --include="*.ts" --include="*.tsx" 2>/dev/null | wc -l)

if [ "$INCOMPLETE" -gt 0 ]; then
  echo "WARNING: Found $INCOMPLETE TODO/FIXME/SECURITY-TODO markers."
  grep -rn "TODO\|FIXME\|SECURITY-TODO" src/ --include="*.java" --include="*.ts" --include="*.tsx" 2>/dev/null | head -10
fi

if command -v git &> /dev/null; then
  CHANGES=$(git status --porcelain 2>/dev/null | wc -l)
  if [ "$CHANGES" -gt 0 ]; then
    echo "INFO: $CHANGES uncommitted file(s). Commit before marking Sprint items Done."
  fi
fi

echo "Status sync complete."
exit 0
