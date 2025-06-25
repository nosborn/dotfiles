#!/bin/sh

set -o errexit
set -o nounset

command -v tflint >/dev/null 2>&1 || exit 0

tflint --init

exit 0
