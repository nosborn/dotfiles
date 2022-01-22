#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

npm install \
  --fund=false \
  --global \
  --prefix="${HOME}/.local"

exit 0
