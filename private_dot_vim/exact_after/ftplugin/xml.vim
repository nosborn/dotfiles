setlocal noexpandtab
setlocal shiftwidth=8
setlocal tabstop=8

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< shiftwidth< tabstop<'
else
  let b:undo_ftplugin = 'setlocal expandtab< shiftwidth< tabstop<'
endif

let b:ale_fix_on_save = 1
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
let b:ale_xml_xmllint_optons = '--nonet'
