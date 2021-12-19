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
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ︎'
" let g:ale_sign_priority = 10
let g:ale_sign_warning = '⚠︎'
let g:ale_virtualtext_cursor = 1
let b:ale_xml_xmllint_optons = '--nonet'

nmap [A :ALEFirst<CR>
nmap ]A :ALELast<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]a :ALENextWrap<CR>
