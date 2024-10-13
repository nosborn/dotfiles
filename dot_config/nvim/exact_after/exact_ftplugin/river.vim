setlocal commentstring=//%s
setlocal noexpandtab
setlocal shiftwidth=0
setlocal tabstop=8

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal commentstring< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal commentstring< expandtab< shiftwidth< tabstop<'
endif
