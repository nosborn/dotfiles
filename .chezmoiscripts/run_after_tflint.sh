#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix tflint)/bin/tflint" ] || exit 0

tflint --init

exit 0
