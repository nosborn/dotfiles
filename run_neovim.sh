#!/bin/sh

set -o errexit
set -o nounset

pack() {
  [ -d "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}/.git" ] || {
    git clone --depth 1 --no-tags --single-branch -- \
      "https://github.com/${1}.git" \
      "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}"
  }
  (
    cd "${HOME}/.local/share/nvim/site/pack/${1%/*}/start/${1#*/}" || exit
    git pull --ff-only --no-tags --prune
  )
}

[ -e "$(brew --prefix nvim)/bin/nvim" ] || exit 0

pack cespare/vim-toml &
pack chr4/nginx.vim &
pack direnv/direnv.vim &
pack ellisonleao/glow.nvim &
pack fatih/vim-go &
pack godlygeek/tabular &
pack hashivim/vim-terraform &
pack jose-elias-alvarez/null-ls.nvim &
pack kyazdani42/nvim-web-devicons &
pack lewis6991/gitsigns.nvim &
pack lukas-reineke/indent-blankline.nvim &
pack maralla/vim-toml-enhance &
pack morhetz/gruvbox &
pack nvim-lua/plenary.nvim & # common dependency
pack nvim-lualine/lualine.nvim &
pack nvim-telescope/telescope.nvim &
pack nvim-treesitter/nvim-treesitter &
pack pangloss/vim-javascript &
pack pearofducks/ansible-vim &
pack tpope/vim-commentary &
pack tpope/vim-endwise &
pack tpope/vim-fugitive &
# pack tpope/vim-markdown &
# pack tpope/vim-vinegar &
wait

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
