scriptencoding utf-8

lua <<EOF
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  sync_install = false,
})
EOF
