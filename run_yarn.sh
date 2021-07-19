#!/bin/sh

set -o errexit
set -o nounset

command -v yarn >/dev/null 2>&1 || exit 0

packages="
  markdownlint-cli
"

yarn global add ${packages} \
  --ignore-engines \
  --latest \
  --mutex file \
  --non-interactive \
  --prefix "${HOME}/.local" \
  --production
