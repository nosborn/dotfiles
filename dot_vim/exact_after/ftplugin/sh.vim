setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
let b:undo_ftplugin .= '|setlocal expandtab< shiftwidth< tabstop<'

let b:ale_fix_on_save = 1
let b:ale_fixers = ['shfmt']
