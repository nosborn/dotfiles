setlocal colorcolumn=80
setlocal commentstring=#\ %s
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn< commentstring< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn< commentstring< expandtab< shiftwidth< tabstop<'
endif

if expand('%:p') == expand('~/src/github.com/nosborn/federation-1999/data/messages.yaml')
  lua <<EOT
local buf = vim.api.nvim_get_current_buf()
require("conform").disable_formatters({"yamlfmt"}, buf)
EOT
endif
