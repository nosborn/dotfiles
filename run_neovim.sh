#!/bin/sh

set -o errexit
set -o nounset

pack() {
  [ -d "${HOME}/.config/nvim/pack/${1%/*}/start/${1#*/}/.git" ] || {
    git clone --depth 1 --single-branch --no-tags -- \
      "https://github.com/${1}.git" \
      "${HOME}/.config/nvim/pack/${1%/*}/start/${1#*/}"
  }
  git -C "${HOME}/.config/nvim/pack/${1%/*}/start/${1#*/}" \
    pull --ff-only --no-tags --no-verify
}

pack JamshedVesuna/vim-markdown-preview
pack airblade/vim-gitgutter
pack cespare/vim-toml
pack dag/vim-fish
pack dense-analysis/ale
pack digitaltoad/vim-pug
pack direnv/direnv.vim
pack godlygeek/tabular
pack hashivim/vim-terraform
pack itchyny/lightline.vim
pack juliosueiras/vim-terraform-completion
pack maralla/vim-toml-enhance
pack maximbaz/lightline-ale
pack morhetz/gruvbox
pack neomake/neomake
pack nvim-treesitter/nvim-treesitter # {'do': 'TSUpdate'})
pack pangloss/vim-javascript
pack pearofducks/ansible-vim # {'rev': '3.0'})
pack satabin/hocon-vim
pack sbdchd/neoformat
pack thaerkh/vim-indentguides
pack tpope/vim-commentary
pack tpope/vim-endwise
pack tpope/vim-fugitive
# pack tpope/vim-markdown

command nvim -n -u NORC \
  +'helptags ALL' \
  +'quit'

for add in ~/.config/nvim/spell/*.add; do
  command nvim -n -u NORC \
    +"mkspell! ${add}" \
    +'quit'
done
