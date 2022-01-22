#!/bin/sh

set -o errexit
set -o nounset

command -v yarn >/dev/null 2>&1 || exit 0

readonly packages="
  vim-language-server
"

"$(brew --prefix yarn)/bin/yarn" global add ${packages} \
  --ignore-engines \
  --latest \
  --mutex file \
  --no-lock-file \
  --no-node-version-check \
  --non-interactive \
  --prefix "${HOME}/.local" \
  --production

exit 0
