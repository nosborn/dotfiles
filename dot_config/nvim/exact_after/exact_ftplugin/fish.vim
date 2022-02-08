setlocal commentstring=#%s
setlocal expandtab
setlocal shiftwidth=4
setlocal spell
setlocal tabstop=4

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal commentstring< expandtab< shiftwidth< spell< tabstop<'
else
  let b:undo_ftplugin = 'setlocal commentstring< expandtab< shiftwidth< spell< tabstop<'
endif
