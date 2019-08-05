setlocal noexpandtab
setlocal shiftwidth=8
setlocal tabstop=8
let b:undo_ftplugin .= '|setlocal expandtab< shiftwidth< tabstop<'

let b:ale_fix_on_save = 1
let b:ale_fixers = ['gofmt']
