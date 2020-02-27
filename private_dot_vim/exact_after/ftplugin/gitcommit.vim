setlocal colorcolumn=73
setlocal spell
setlocal textwidth=72

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn< spell< textwidth<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn< spell< textwidth<'
endif

" Warning if first line is too long.
match ErrorMsg /\%1l.\%>51v/
