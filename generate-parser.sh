#!/bin/bash

set -eu

# Java parser
# use with grun
java -jar ~/.m2/repository/org/antlr/antlr4/4.7.3-SNAPSHOT/antlr4-4.7.3-SNAPSHOT-complete.jar \
    -no-listener \
    -Dlanguage=Java \
    Express.g4

javac -cp .:$HOME/.m2/repository/org/antlr/antlr4/4.7.3-SNAPSHOT/antlr4-4.7.3-SNAPSHOT-complete.jar \
    *.java
