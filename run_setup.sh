#!/bin/sh

set -o errexit
set -o nounset

if [ "$(uname)" = Darwin ]; then
  export HOMEBREW_CASK_OPTS=--require-sha
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_INSECURE_REDIRECT=1

  brew analytics off
  brew bundle --global

  if [ -d ~/bin ]; then
    SetFile -a V ~/bin
  fi
fi

for p in markdownlint-cli; do
  npm list --global "${p}" >/dev/null && continue
  npm install --global --no-optional --no-package-lock --no-update-notifier --only=production "${p}"
done

pip3 install --upgrade --no-warn-script-location --quiet --disable-pip-version-check \
  vim-vint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  pip3 install --upgrade --no-warn-script-location --quiet --disable-pip-version-check \
    azure
fi
