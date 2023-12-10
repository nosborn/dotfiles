#!/bin/sh

set -o errexit
set -o nounset

PREFIX="$(brew --prefix ruby)"
readonly PREFIX

CPPFLAGS="-I${PREFIX:?}/include"
LDFLAGS="-L${PREFIX:?}/lib"
PATH="$("${PREFIX:?}/bin/gem" environment gemdir)/bin:${PREFIX:?}/bin:${PATH}"
PKG_CONFIG_PATH="${PREFIX:?}/lib/pkgconfig"
export CPPFLAGS LDFLAGS PATH PKG_CONFIG_PATH

cd "$(chezmoi source-path)"
bundle install
bundle clean --force

exit 0
