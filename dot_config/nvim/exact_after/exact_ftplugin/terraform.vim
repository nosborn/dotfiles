setlocal commentstring=#%s
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal commentstring< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal commentstring< expandtab< shiftwidth< tabstop<'
endif

lua <<EOT
vim.lsp.start({
  name = 'tflint',
  cmd = {'tflint', '--langserver'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
})
EOT
