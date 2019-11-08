#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

for p in markdownlint-cli@0.18 neovim; do
  npm list --global "${p}" >/dev/null && continue
  npm install --global --no-optional --no-package-lock --no-update-notifier --only=production "${p}"
done
