#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off

case "$(hostname -s)" in
  19SGD-MAC11 | 19SGD-MAC11-*)
    export ACCEPT_EULA=Y
    export HOMEBREW_NO_ENV_FILTERING=1 # https://github.com/microsoft/homebrew-mssql-release/pull/26
    ;;
esac
brew bundle --global
