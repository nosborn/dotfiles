#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  export ACCEPT_EULA=Y
fi
brew bundle --global
