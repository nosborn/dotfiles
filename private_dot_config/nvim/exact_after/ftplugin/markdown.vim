setlocal expandtab
" setlocal filetype=markdown.pandoc
setlocal linebreak
setlocal shiftwidth=2
setlocal spell
setlocal tabstop=2
setlocal wrap

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< filetype< linebreak< shiftwidth< spell< tabstop< wrap<'
else
  let b:undo_ftplugin = 'setlocal expandtab< filetype< linebreak< shiftwidth< spell< tabstop< wrap<'
endif

<<<<<<< Updated upstream:private_dot_config/nvim/exact_after/ftplugin/markdown.vim.tmpl
{{ if .work }}
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
{{ end }}

" vim: ft=vim
=======
let b:ale_fix_on_save = 1
>>>>>>> Stashed changes:private_dot_config/nvim/exact_after/ftplugin/markdown.vim
