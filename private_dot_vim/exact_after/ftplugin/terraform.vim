setlocal commentstring=#%s
if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '|setlocal commentstring<'

let b:ale_fix_on_save = 0
