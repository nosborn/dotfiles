#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix vale)/bin/vale" ] || exit 0

vale sync

exit 0
