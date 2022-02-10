let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
      \   'files': 0,
      \   'folder_arrows': 0,
      \   'folders': 0,
      \   'git': 1,
      \ }
let g:nvim_tree_special_files = {
      \   'Makefile': 1,
      \   'README.md': 1,
      \ }

lua <<EOT
require('nvim-tree').setup({
  auto_close = true,
})
EOT
