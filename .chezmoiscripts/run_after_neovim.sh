#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix neovim)/bin/nvim" ] || exit 0

"$(brew --prefix neovim)/bin/nvim" -n --headless \
  -c 'helptags ALL' \
  -c 'quit'

"$(brew --prefix neovim)/bin/nvim" -n --headless \
  -c 'TSUpdateSync' \
  -c 'quit'

for add in ~/.config/nvim/spell/*.add; do
  "$(brew --prefix neovim)/bin/nvim" -n --headless --noplugin \
    -c "mkspell! ${add}" \
    -c 'quit'
done

exit 0
