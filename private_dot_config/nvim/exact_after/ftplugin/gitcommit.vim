setlocal colorcolumn=73
setlocal spell
setlocal textwidth=72
let b:undo_ftplugin .= '|setlocal colorcolumn< spell< textwidth<'

" warning if first line too long
match ErrorMsg /\%1l.\%>51v/
