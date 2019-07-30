#!/bin/sh

[ "$(uname)" = Darwin ] || exit

brew analytics off
brew bundle --global || exit
brew bundle --global cleanup
