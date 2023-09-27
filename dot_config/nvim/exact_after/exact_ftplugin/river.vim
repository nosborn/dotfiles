setlocal commentstring=//%s
setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal commentstring< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal commentstring< expandtab< shiftwidth< tabstop<'
endif
