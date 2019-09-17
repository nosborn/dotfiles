setlocal commentstring=#%s
setlocal expandtab
setlocal shiftwidth=2
setlocal spell
setlocal tabstop=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal commentstring< expandtab< shiftwidth< spell< tabstop<'
else
  let b:undo_ftplugin = 'setlocal commentstring< expandtab< shiftwidth< spell< tabstop<'
endif

if get(g:, 'terraform_fmt_on_save', 0) == 0
  let b:ale_fix_on_save = 1
  let b:ale_fixers = ['terraform']
endif
let b:ale_linters = ['fmt'] " https://github.com/dense-analysis/ale/issues/2762
