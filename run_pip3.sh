#!/bin/sh

set -o errexit
set -o nounset

"$(brew --prefix python3)/bin/python3" -m pip install \
  --disable-pip-version-check \
  --no-deps \
  --requirement "$(chezmoi source-path)/requirements.txt" \
  --upgrade

exit 0
