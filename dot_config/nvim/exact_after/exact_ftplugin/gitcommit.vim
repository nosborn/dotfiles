setlocal colorcolumn=73
setlocal textwidth=72

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn< textwidth<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn< textwidth<'
endif

" Warning if first line is too long.
match ErrorMsg /\%1l.\%>51v/
