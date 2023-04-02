setlocal colorcolumn=

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn<'
endif
