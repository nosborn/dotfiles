#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off

brew bundle install --global
brew bundle cleanup --global --force

chmod g-w "$(brew --prefix)/opt/homebrew/share"

exit 0
