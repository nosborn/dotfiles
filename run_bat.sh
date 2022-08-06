#!/bin/sh

set -o errexit
set -o nounset

command -v bat >/dev/null 2>&1 || exit 0

bat cache --build

exit 0
