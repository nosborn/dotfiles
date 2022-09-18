#!/bin/sh

set -o errexit
set -o nounset

_pack() {
  [ -d "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}/.git" ] || {
    git clone --depth 1 --single-branch -- \
      "${1}" "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}"
  }
  (
    cd "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}" || exit
    git pull --force
  )
}

pack() {
  _pack "https://github.com/${1}.git" "${1%/*}" "${2:-${1#*/}}"
}

[ -e "$(brew --prefix nvim)/bin/nvim" ] || exit 0

pack catppuccin/nvim catppuccin &
# pack cuducos/yaml.nvim &
pack direnv/direnv.vim &
pack ellisonleao/glow.nvim &
pack fatih/vim-go &
pack folke/trouble.nvim &
pack godlygeek/tabular &
pack jose-elias-alvarez/null-ls.nvim &
pack jvirtanen/vim-hcl &
pack kyazdani42/nvim-web-devicons &
pack lewis6991/gitsigns.nvim &
pack lewis6991/spellsitter.nvim &
pack lukas-reineke/indent-blankline.nvim &
pack numToStr/Comment.nvim &
pack nvim-lua/plenary.nvim & # common dependency
pack nvim-lualine/lualine.nvim &
pack nvim-telescope/telescope.nvim &
pack nvim-treesitter/nvim-treesitter &
# pack nvim-treesitter/nvim-treesitter-context &
pack nvim-treesitter/nvim-treesitter-textobjects &
pack pangloss/vim-javascript &
pack pearofducks/ansible-vim &
pack tpope/vim-endwise &
wait

"$(brew --prefix neovim)/bin/nvim" -n --headless \
  -c 'helptags ALL' \
  -c 'quit'

"$(brew --prefix neovim)/bin/nvim" -n --headless \
  -c 'TSUpdateSync' \
  -c 'quit'

"$(brew --prefix neovim)/bin/nvim" -n --headless \
  -c 'CatppuccinCompile' \
  -c 'quit'

for add in ~/.config/nvim/spell/*.add; do
  "$(brew --prefix neovim)/bin/nvim" -n --headless --noplugin \
    -c "mkspell! ${add}" \
    -c 'quit'
done

exit 0
