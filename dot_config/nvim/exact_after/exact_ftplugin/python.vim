setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal textwidth=88

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< shiftwidth< tabstop< textwidth<'
else
  let b:undo_ftplugin = 'setlocal expandtab< shiftwidth< tabstop< textwidth<'
endif
