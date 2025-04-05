#!/bin/bash

# Check if the Doxyfile path is provided
if [ -z "$1" ]; then
  echo "Error: No Doxyfile path provided."
  exit 1
fi

DOXYFILE_PATH="$1"
WARNINGS_LOG="doxygen_warnings.log"

# Run Doxygen
doxygen "$DOXYFILE_PATH" > /dev/null

# Check if Doxygen generated warnings
if [ -f "$WARNINGS_LOG" ]; then
  WARNING_COUNT=$(grep -c "warning:" "$WARNINGS_LOG")

  if [ "$WARNING_COUNT" -gt 0 ]; then
    echo "Doxygen documentation issues found:"
    grep "warning:" "$WARNINGS_LOG"
    echo "Total warnings: $WARNING_COUNT"
    exit 1
  else
    echo "All Doxygen comments are well-written."
    exit 0
  fi
else
  echo "Warning log file not found: $WARNINGS_LOG"
  exit 1
fi
