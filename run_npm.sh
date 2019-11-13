#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

packages="
  bash-language-server
  dockerfile-language-server-nodejs
  markdownlint-cli@0.18
  neovim
  yaml-language-server
"

for p in ${packages}; do
  npm list --global "${p}" >/dev/null || {
    npm install \
      --global \
      --no-optional \
      --no-package-lock \
      --no-update-notifier \
      --only=production \
      "${p}"
  }
done
