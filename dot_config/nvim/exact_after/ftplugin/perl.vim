setlocal expandtab
setlocal shiftwidth=2
setlocal spell
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< shiftwidth< spell< tabstop<'
else
  let b:undo_ftplugin = 'setlocal expandtab< shiftwidth< spell< tabstop<'
endif
