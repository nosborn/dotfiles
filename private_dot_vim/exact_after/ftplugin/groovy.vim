setlocal shiftwidth=4
setlocal tabstop=4

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal shiftwidth< tabstop<'
endif
