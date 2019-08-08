setlocal commentstring=#%s
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
if !exists('b:undo_ftplugin')
  let b:undo_ftplugin=''
endif
let b:undo_ftplugin.='|setlocal commentstring< expandtab< shiftwidth< tabstop<'

let b:ale_fix_on_save=1
