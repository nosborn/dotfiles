#!/bin/sh

set -o errexit
set -o nounset

command -v nvim >/dev/null 2>&1 || exit 0

nvim -n --headless -c 'KansoCompile' -c 'quit'
nvim -n --headless \
  -c 'lua require("nvim-treesitter.install").ensure_installed_sync(require("nvim-treesitter.configs").get_ensure_installed_parsers())' \
  -c 'TSUpdateSync' \
  -c 'quit'
nvim -n --headless -c 'helptags ALL' -c 'quit'

for add in ~/.config/nvim/spell/*.add; do
  nvim -n --headless --noplugin -c "mkspell! ${add}" -c 'quit'
done

exit 0
