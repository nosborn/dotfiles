#!/bin/sh

set -o errexit
set -o nounset

pack() {
  [ -d "${HOME}/.vim/pack/${1%/*}/start/${1#*/}/.git" ] || {
    git clone --depth 1 --single-branch --no-tags -- \
      "https://github.com/${1}.git" \
      "${HOME}/.vim/pack/${1%/*}/start/${1#*/}"
  }
  git -C "${HOME}/.vim/pack/${1%/*}/start/${1#*/}" \
    pull --ff-only --no-tags --no-verify
}

# pack JamshedVesuna/vim-markdown-preview
pack Xuyuanp/nerdtree-git-plugin
pack airblade/vim-gitgutter
pack cespare/vim-toml
pack chr4/nginx.vim
pack dag/vim-fish
pack dense-analysis/ale
pack digitaltoad/vim-pug
pack direnv/direnv.vim
pack fatih/vim-go
pack godlygeek/tabular
pack hashivim/vim-terraform
pack itchyny/lightline.vim
# pack juliosueiras/vim-terraform-completion
pack junegunn/fzf.vim
pack maralla/vim-toml-enhance
pack maximbaz/lightline-ale
pack morhetz/gruvbox
pack pangloss/vim-javascript
pack pearofducks/ansible-vim # {'rev': '3.0'})
pack preservim/nerdtree
pack satabin/hocon-vim
pack thaerkh/vim-indentguides
pack tpope/vim-commentary
pack tpope/vim-endwise
pack tpope/vim-fugitive
# pack tpope/vim-markdown
pack tpope/vim-vinegar

# $(brew --prefix)/bin/vim -n -u NORC \
#   +'helptags ALL' \
#   +'quit'

# for add in ~/.vim/spell/*.add; do
#   $(brew --prefix)/bin/vim -n -u NORC \
#     +"mkspell! ${add}" \
#     +'quit'
# done
