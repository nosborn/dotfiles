#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit

export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

brew analytics off
brew bundle --global
