#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname)" = Darwin ] || exit

brew analytics off
brew bundle --global
