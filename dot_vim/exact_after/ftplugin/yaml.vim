setlocal expandtab
setlocal nospell
setlocal shiftwidth=2
setlocal tabstop=2
let b:undo_ftplugin .= '|setlocal expandtab< shiftwidth< spell< tabstop<'

let b:ale_fix_on_save=1
let b:ale_fixers=['prettier']
