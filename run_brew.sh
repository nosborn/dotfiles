#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off

if [ "$(hostname -s)" = 19SGD-MAC11 ]; then
  export ACCEPT_EULA=Y
  export HOMEBREW_NO_ENV_FILTERING=1 # https://github.com/microsoft/homebrew-mssql-release/pull/26
fi
brew bundle --global

for dylib in libcrypto.dylib libssl.dylib; do
  [ -e "$(brew --prefix openssl)/lib/${dylib}" ] || continue
  [ -e "$(brew --prefix)/lib/${dylib}" ] && continue
  ln -s "$(brew --prefix openssl)/lib/${dylib}" "$(brew --prefix)/lib/${dylib}"
done
