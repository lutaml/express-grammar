#!/bin/bash

set -eu

INPUT="$1"

OUTPUT="$(cat "$INPUT" | java -cp .:$HOME/.m2/repository/org/antlr/antlr4/4.7.3-SNAPSHOT/antlr4-4.7.3-SNAPSHOT-complete.jar org.antlr.v4.gui.TestRig Express syntax 2>&1)"

if [ ! -z "$OUTPUT" ]; then
    echo "FAIL $INPUT"
else
    echo "PASS $INPUT"
fi

if [ ! -z "$OUTPUT" ]; then
    echo "$OUTPUT"
fi