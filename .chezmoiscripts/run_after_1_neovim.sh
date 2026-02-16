#!/bin/sh

set -o errexit
set -o nounset

command -v nvim >/dev/null 2>&1 || exit 0

nvim -n --headless -c 'KansoCompile' -c 'quit'
# nvim -n --headless -c 'TSUpdate' -c 'quit'
nvim -n --headless -c 'helptags ALL' -c 'quit'

for add in ~/.config/nvim/spell/*.add; do
  nvim -n --headless --noplugin -c "mkspell! ${add}" -c 'quit'
done

exit 0
