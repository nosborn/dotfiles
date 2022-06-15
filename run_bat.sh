#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix bat)/bin/bat" ] || exit 0

bat cache --build

exit 0
