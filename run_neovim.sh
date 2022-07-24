#!/bin/sh

set -o errexit
set -o nounset

_pack() {
  [ -d "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}/.git" ] || {
    git clone --depth 1 --no-tags --single-branch -- \
      "${1}" "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}"
  }
  (
    cd "${HOME}/.local/share/nvim/site/pack/${2}/start/${3}" || exit
    git pull --no-tags --prune
  )
}

pack() {
  _pack "https://github.com/${1}.git" "${1%/*}" "${2:-${1#*/}}"
}

[ -e "$(brew --prefix nvim)/bin/nvim" ] || exit 0

_pack https://git.sr.ht/~whynothugo/lsp_lines.nvim whynothugo lsp_lines.nvim &
# pack cuducos/yaml.nvim &
pack direnv/direnv.vim &
pack ellisonleao/glow.nvim &
pack fatih/vim-go &
pack godlygeek/tabular &
pack gruvbox-community/gruvbox &
pack jose-elias-alvarez/null-ls.nvim &
pack jvirtanen/vim-hcl &
pack kyazdani42/nvim-web-devicons &
pack lewis6991/gitsigns.nvim &
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

for add in ~/.config/nvim/spell/*.add; do
  "$(brew --prefix neovim)/bin/nvim" -n --headless --noplugin \
    -c "mkspell! ${add}" \
    -c 'quit'
done

exit 0
