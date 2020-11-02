#!/bin/sh

set -o errexit
set -o nounset

if [ ! -d ~/.config/base16-shell ]; then
  git clone --template=/usr/local/share/git-core/templates/hooks --no-tags \
    https://github.com/chriskempson/base16-shell.git \
    ~/.config/base16-shell
else
  cd ~/.config/base16-shell
  git pull --ff-only --no-tags
fi
