set encoding=utf-8
scriptencoding=utf-8

if &shell =~# 'fish$'
  set shell=sh
endif

filetype plugin indent on
syntax on

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

map Q <Nop>

" set fillchars=vert:│,fold:·
set ignorecase
set list
set listchars=tab:»·,trail:▿,nbsp:▿
set mouse=a
set nobackup
set noshowmode
set nospell
set nostartofline
set noswapfile
set nowrap
set nowritebackup
set number
set path=$PWD/**
set relativenumber
set scrolloff=2
set sessionoptions-=options
set shortmess+=I
set showmatch
set sidescrolloff=5
set signcolumn=yes
set spelllang=en_gb
set ttimeout
set updatetime=100
set viewoptions=unix,slash
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,**/.DS_Store,**/.git/**,**/.terraform/**,**/node_modules/**

inoremap <C-U> <C-G>u<C-U>

if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'json': ['prettier'],
      \   'python': ['black'],
      \   'sh': ['shfmt'],
      \   'terraform': ['terraform'],
      \   'xml': ['xmllint'],
      \   'zsh': ['shfmt'],
      \   '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:ale_set_balloons = 1
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ︎'
" let g:ale_sign_priority = 10
let g:ale_sign_warning = '⚠︎'
let b:ale_xml_xmllint_optons = '--nonet'

let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = {
      \   '*.cnf.j2':               'dosini',
      \   '*.ini.j2':               'dosini',
      \   '*.json.j2':              'json',
      \   '*.lua.j2':               'lua',
      \   '*.pl.j2':                'perl',
      \   '*.properties.j2':        'jproperties',
      \   '*.py.j2':                'python',
      \   '*.sh.j2':                'sh',
      \   '*.toml.j2':              'toml',
      \   '*.xml.j2':               'xml',
      \   '*.ya?ml.j2':             'yaml',
      \   'Dockerfile.j2':          'dockerfile',
      \   'bash{_profile,rc}.j2':   'sh',
      \   'gemrc.j2':               'yaml',
      \   'pf.conf.j2':             'pf',
      \   'resolv.conf(.tail)?.j2': 'resolv',
      \   'sshd_config.j2':         'sshdconfig',
      \ }
let g:ansible_unindent_after_newline = 1

let g:bash_is_sh = 1

let g:direnv_cmd = '/usr/local/bin/direnv'

let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 9

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_sign_column = 'bg1'

let g:highlight_balanced_quotes = 1
let g:highlight_function_names = 1
let g:highlight_sedtabs = 1

let g:indentguides_ignorelist = [
      \   'text'
      \ ]
let g:indentguides_spacechar = '┊'
let g:indentguides_tabchar = '┋'

function! LightlineReadOnly()
  return &readonly && &filetype !=# 'help' ? "\uE0A2" : ''
endfunction

let g:lightline = {
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['gitbranch', 'readonly', 'filename', 'modified'],
      \     ],
      \     'right': [
      \       ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
      \       ['lineinfo'],
      \       ['wordcount'],
      \       ['percent'],
      \       ['fileformat', 'fileencoding', 'filetype'],
      \     ]
      \   },
      \   'colorscheme': 'gruvbox',
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead',
      \     'readonly': 'LightlineReadOnly',
      \     'wordcount': 'lightline#wordcount#words',
      \   },
      \   'subseparator': {
      \     'left': '│',
      \     'right': '│',
      \   }
      \ }
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_ok': 'lightline#ale#ok',
      \   'linter_warnings': 'lightline#ale#warnings',
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'right',
      \   'linter_errors': 'error',
      \   'linter_infos': 'right',
      \   'linter_ok': 'right',
      \   'linter_warnings': 'warning',
      \ }
let g:lightline#ale#indicator_checking = '⋯' " "\uf110"
let g:lightline#ale#indicator_ok = '✓'

"let g:lightline#ale#indicator_checking = "\uf110"
"let g:lightline#ale#indicator_infos = "\uf129"
"let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"
"let g:lightline#ale#indicator_ok = "\uf00c"

let g:loaded_node_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0

let g:markdown_fenced_languages = [
      \   'bash=sh',
      \   'gitconfig',
      \   'json',
      \   'sh',
      \   'terraform',
      \   'yaml',
      \   'zsh=sh',
      \ ]
let g:markdown_syntax_conceal = 0

let g:neomake_open_list = 2

let g:netrw_banner = 0
let g:netrw_bufsettings = 'relativenumber,number'
let g:netrw_list_hide = netrw_gitignore#Hide() . '\.git$'
let g:netrw_liststyle = 3

let g:python3_host_prog = '/usr/local/bin/python3'

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

let g:vim_json_conceal = 0

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

let g:vim_markdown_preview_browser = 'Chromium'
let g:vim_markdown_preview_github = 1

let g:vimsyn_embed = 'l'

colorscheme gruvbox

if $TERM_PROGRAM ==# 'Apple_Terminal'
  set mouse=a
  let &t_ZH = "\e[3m"
  let &t_ZR = "\e[23m"
endif

function AnsibleVaultDecrypt()
  let s:header = split(getline(1), ';')
  let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
  silent %!ansible-vault decrypt
endfunction

function AnsibleVaultEncrypt()
  execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
endfunction

augroup ansible-vault
  autocmd!
  autocmd BufReadPre,FileReadPre */ansible/**/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */vars/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml call AnsibleVaultDecrypt()
  autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml call AnsibleVaultDecrypt()
  autocmd BufReadPost,FileReadPost */vars/vault.yml call AnsibleVaultDecrypt()
  autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePre,FileWritePre */vars/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePost,FileWritePost */ansible/**/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */vars/vault.yml silent undo
augroup END

" augroup git-blame
"   autocmd!
"   autocmd BufEnter * EnableBlameLine
" augroup END

nmap [A :ALEFirst<CR>
nmap ]A :ALELast<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]a :ALENextWrap<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

nnoremap <silent> <leader>b :Buffers<CR>

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
