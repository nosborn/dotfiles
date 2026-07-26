setlocal colorcolumn=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn< expandtab< shiftwidth< tabstop<'
endif
