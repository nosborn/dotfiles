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

if expand('%:p') =~# '/corda-network/terraform/.\+\.rules\.tf$'
  let b:ale_fix_on_save = 0
  let b:ale_linters = []
  let b:terraform_fmt_on_save = 0
else
  if get(g:, 'terraform_fmt_on_save', 0) == 0
    let b:ale_fix_on_save = 1
    let b:ale_fixers = ['terraform']
  endif
endif
