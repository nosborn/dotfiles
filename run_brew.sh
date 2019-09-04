#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit

export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off

if [ "$(hostname -s)" = 19SGD-MAC11 ]; then
  export ACCEPT_EULA=Y
  export HOMEBREW_NO_ENV_FILTERING=1 # https://github.com/microsoft/homebrew-mssql-release/pull/26
fi
brew bundle --global
