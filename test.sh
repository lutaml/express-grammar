#!/bin/bash

set -eu

cd ../stepmod-utils
FILES="$(bundle exec ./exe/stepmod-find-express-files ../iso-10303-stepmod)"
cd -

echo "$FILES" | \
    tr '\n' '\0' | \
    xargs -0 -n1 -P2 ./test-one.sh