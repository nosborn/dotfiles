let b:miniindentscope_disable = v:true

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | unlet! b:miniindentscope_disable'
else
  let b:undo_ftplugin = 'unlet! b:miniindentscope_disable'
endif
