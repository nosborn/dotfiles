scriptencoding utf-8

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'json': ['jq'],
      \   'python': ['black'],
      \   'sh': ['shfmt'],
      \   'terraform': ['terraform'],
      \   'xml': ['xmllint'],
      \   'zsh': ['shfmt'],
      \   '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:ale_json_jq_options = '-S'
let g:ale_set_balloons = 1
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_info = ''
" let g:ale_sign_priority = 10
let g:ale_sign_warning = ''
let b:ale_xml_xmllint_optons = '--nonet'

nmap [D :ALEFirst<CR>
nmap ]D :ALELast<CR>
nmap [d :ALEPreviousWrap<CR>
nmap ]d :ALENextWrap<CR>
