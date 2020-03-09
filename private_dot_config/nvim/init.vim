scriptencoding=utf-8

if empty(glob('~/.config/nvim/pack/minpac/opt/minpac/plugin/minpac.vim'))
  silent !git clone -- https://github.com/k-takata/minpac.git
        \ ~/.config/nvim/pack/minpac/opt/minpac
endif

packadd minpac
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()
command! PackUpdate call minpac#update('', {'do': 'helptags ALL'})

call minpac#init()
call minpac#add('airblade/vim-gitgutter')
call minpac#add('cespare/vim-toml')
call minpac#add('dense-analysis/ale')
call minpac#add('digitaltoad/vim-pug')
call minpac#add('direnv/direnv.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('hashivim/vim-terraform')
call minpac#add('iamcco/markdown-preview.nvim', {
      \   'do': {hooktype, name ->
      \     system('yarn install --cwd '.minpac#getpluginfo(a:name)['dir'].'/app')
      \   }
      \ })
call minpac#add('itchyny/lightline.vim')
" call minpac#add('juliosueiras/vim-terraform-completion')
call minpac#add('junegunn/fzf.vim')
call minpac#add('k-takata/minpac', {
      \   'type': 'opt'
      \ })
" call minpac#add('lifepillar/vim-mucomplete')
" call minpac#add('majutsushi/tagbar')
call minpac#add('maximbaz/lightline-ale')
call minpac#add('morhetz/gruvbox')
call minpac#add('pangloss/vim-javascript')
call minpac#add('pearofducks/ansible-vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-markdown')

syntax on

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg("<C-L>", 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

map Q <Nop>

set completeopt+=menuone,noinsert
set cursorline
set ignorecase
set list
set listchars=tab:»·,trail:▿,nbsp:▿
set mouse=a
set nobackup
set noerrorbells
set nolangremap
set noshowcmd
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
set shortmess+=I
set showmatch
set sidescrolloff=5
set spelllang=en_gb
set tags^=./.git/tags;
set ttimeout
set updatetime=100
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,**/.DS_Store,**/.git/**,**/.terraform/**,**/node_modules/**

inoremap <C-U> <C-G>u<C-U>

if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if executable('fzf')
  set runtimepath+=/usr/local/opt/fzf
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

function! MyColorSchemeHighlights() abort
  " highlight Comment cterm=italic gui=italic
  highlight SpellBad cterm=undercurl
endfunction

augroup MyColorScheme
  autocmd!
  autocmd ColorScheme * call MyColorSchemeHighlights()
augroup END

let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = 1
" let g:gruvbox_italicize_strings = 1
colorscheme gruvbox

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
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ'
let g:ale_sign_warning = '‼'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '❯ '
let b:ale_xml_xmllint_optons = '--nonet'

let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = {
      \   '*.ini.j2':               'dosini',
      \   '*.sh.j2':                'sh',
      \   '*.ya?ml.j2':             'yaml',
      \   'pf.conf.j2':             'pf',
      \   'resolv.conf(.tail)?.j2': 'resolv',
      \   'sshd_config.j2':         'sshdconfig',
      \ }

let g:bash_is_sh = 1

let g:direnv_cmd = '/usr/local/bin/direnv'

let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1

let g:highlight_balanced_quotes = 1
let g:highlight_function_names = 1
let g:highlight_sedtabs = 1

let g:lightline = {
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['gitbranch', 'readonly', 'filename', 'modified']
      \     ],
      \     'right': [
      \       ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
      \       ['lineinfo'],
      \       ['percent'],
      \       ['fileformat', 'fileencoding', 'filetype'],
      \     ]
      \   },
      \   'colorscheme': 'gruvbox',
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead'
      \   },
      \   'subseparator': {
      \     'left': '│',
      \     'right': '│'
      \   }
      \ }
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_errors = 'E:'
let g:lightline#ale#indicator_infos = 'I:'
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline#ale#indicator_warnings = 'W:'

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

" let g:mkdp_auto_start = 1
let g:mkdp_browser = 'Chromium'
" let g:mkdp_markdown_css = ''

let g:mucomplete#completion_delay = 1
let g:mucomplete#enable_auto_at_startup = 1

let g:netrw_banner = 0
let g:netrw_bufsettings = 'relativenumber,number'
" let g:netrw_keepdir = 0
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_liststyle = 3

let g:python3_host_prog = '/usr/local/bin/python3'

let g:vim_json_syntax_conceal = 0

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

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

" vim: ft=vim
