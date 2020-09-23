#!/bin/bash

set -eu

INPUT="$1"

TOTAL="$(grep '^PASS\|^FAIL' "$INPUT" | wc -l)"
PASS="$(grep '^PASS' "$INPUT" | wc -l)"
FAIL="$(grep '^FAIL' "$INPUT" | wc -l)"
FAIL_RATE="$(echo "scale=0; 100 * $FAIL / $TOTAL" | bc)%"
ERRORS="$(grep '^line' "$INPUT" | sed -E 's/^line [0-9]+:[0-9]+ //' | sort | uniq -c | sort -nr)"

echo "Total: $TOTAL"
echo "Pass:  $PASS"
echo "Fail:  $FAIL ($FAIL_RATE)"
if [ ! -z "$ERRORS" ]; then
    echo
    echo 'Errors:'
    echo "$ERRORS"
fi