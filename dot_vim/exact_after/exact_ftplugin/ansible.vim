setlocal colorcolumn=80
setlocal commentstring=#\ %s
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal colorcolumn< commentstring< expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal colorcolumn< commentstring< expandtab< shiftwidth< tabstop<'
endif

" let b:ale_linters = [
"       \   'language_server'
"       \ ]
