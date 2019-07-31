#!/bin/sh

[ "$(uname)" = Darwin ] || exit

brew analytics off
brew bundle --global
