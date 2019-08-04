#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi


