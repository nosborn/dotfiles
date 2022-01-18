#!/bin/sh

set -o errexit
set -o nounset

CPPFLAGS="-I$(brew --prefix ruby)/include"
LDFLAGS="-L$(brew --prefix ruby)/lib"
PATH="$($(brew --prefix ruby)/bin/gem env gemdir)/bin:$(brew --prefix ruby)/bin:${PATH}"
PKG_CONFIG_PATH="$(brew --prefix ruby)/lib/pkgconfig"
export CPPFLAGS LDFLAGS PATH PKG_CONFIG_PATH

if [ -z "$(gem info --quiet github-linguist)" ]; then
  gem install github-linguist
fi

if [ -z "$(gem info --quiet rubocop)" ]; then
  gem install rubocop
fi

exit 0
