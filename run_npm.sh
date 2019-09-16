#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit

for p in markdownlint-cli neovim; do
  npm list --global "${p}" >/dev/null && continue
  npm install --global --no-optional --no-package-lock --no-update-notifier --only=production "${p}"
done
