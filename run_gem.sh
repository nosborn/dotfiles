#!/bin/sh

set -o errexit
set -o nounset

export CPPFLAGS="-I$(brew --prefix ruby)/include"
export LDFLAGS="-L$(brew --prefix ruby)/lib"
export PATH="$($(brew --prefix ruby)/bin/gem env gemdir)/bin:$(brew --prefix ruby)/bin:$PATH"
export PKG_CONFIG_PATH="$(brew --prefix ruby)/lib/pkgconfig"

if [ -z "$(gem info --quiet github-linguist)" ]; then
  gem install github-linguist
fi
