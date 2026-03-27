#!/bin/bash
# Hook: Coverage Gate
# Trigger: Post Task Execution
# Purpose: Verify test coverage meets minimum thresholds after task completion
# Exit code: non-zero = warn (Post Task cannot block, but logs warning)

echo "Running test coverage check..."

# Run tests with coverage (adjust command for your build tool)
if [ -f "gradlew" ]; then
  ./gradlew test jacocoTestReport 2>&1
  
  # Parse JaCoCo report for coverage percentage
  COVERAGE_FILE="build/reports/jacoco/test/jacocoTestReport.xml"
  if [ -f "$COVERAGE_FILE" ]; then
    LINE_MISSED=$(grep -oP 'type="LINE".*?missed="\K[0-9]+' "$COVERAGE_FILE" | head -1)
    LINE_COVERED=$(grep -oP 'type="LINE".*?covered="\K[0-9]+' "$COVERAGE_FILE" | head -1)
    
    if [ -n "$LINE_MISSED" ] && [ -n "$LINE_COVERED" ]; then
      TOTAL=$((LINE_MISSED + LINE_COVERED))
      if [ "$TOTAL" -gt 0 ]; then
        PERCENT=$((LINE_COVERED * 100 / TOTAL))
        echo "Line coverage: ${PERCENT}%"
        
        if [ "$PERCENT" -lt 80 ]; then
          echo "WARNING: Coverage ${PERCENT}% is below 80% threshold"
          exit 1
        fi
      fi
    fi
  fi
elif [ -f "package.json" ]; then
  npx vitest run --coverage 2>&1
fi

echo "Coverage check complete."
exit 0
