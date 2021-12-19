#!/bin/sh

set -o errexit
set -o nounset

pack() {
  [ -d "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}/.git" ] || {
    git clone --depth 1 --single-branch -- \
      "https://github.com/${1}.git" \
      "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}"
  }
  (
    cd "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}" || exit
    git pull --ff-only --no-verify
  )
}

NVIM="$(brew --prefix nvim)/bin/nvim"
readonly NVIM
[ -e "${NVIM}" ] || exit 0

# pack JamshedVesuna/vim-markdown-preview &
pack cespare/vim-toml &
pack chr4/nginx.vim &
pack dense-analysis/ale &
pack direnv/direnv.vim &
pack fatih/vim-go &
pack godlygeek/tabular &
pack hashivim/vim-terraform &
# pack juliosueiras/vim-terraform-completion &
pack junegunn/fzf.vim &
pack lewis6991/gitsigns.nvim &
pack maralla/vim-toml-enhance &
pack morhetz/gruvbox &
pack nvim-lua/plenary.nvim & # required by lewis6991/gitsigns.nvim
pack nvim-lualine/lualine.nvim &
pack pangloss/vim-javascript &
pack pearofducks/ansible-vim &
pack satabin/hocon-vim &
pack thaerkh/vim-indentguides &
pack tpope/vim-commentary &
pack tpope/vim-endwise &
pack tpope/vim-fugitive &
# pack tpope/vim-markdown &
pack tpope/vim-vinegar &
pack wgwoods/vim-systemd-syntax &
wait

"${NVIM}" --headless \
  +'helptags ALL' \
  +'quit'

for add in ~/.config/nvim/spell/*.add; do
  "${NVIM}" --headless \
    "+mkspell! ${add}" \
    '+quit'
done

exit 0
