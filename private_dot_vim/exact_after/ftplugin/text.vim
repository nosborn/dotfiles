set noexpandtab
set shiftwidth=8
set spell
set tabstop=8

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< shiftwidth< spell< tabstop<'
else
  let b:undo_ftplugin = 'setlocal expandtab< shiftwidth< spell< tabstop<'
endif
