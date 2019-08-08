if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" ----

set encoding=utf-8
scriptencoding=utf-8

" Turn off backups and swap file.
set nobackup
set nowritebackup
set noswapfile

" Better '/'
set hlsearch
set ignorecase

" Line numbers
set number
" set relativenumber

" " Convert tabs to spaces
" set expandtab
" set tabstop=2
" set shiftwidth=2

" Display tabs, and trailing and non-breaking spaces visually.
set list
set listchars=tab:»·,trail:▿,nbsp:▿

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout
set timeoutlen=1000

" Don't show intro
set shortmess+=I

" Highlight the current line
" set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,.CFUserTextEncoding,DS_Store,.git/*,.idea/*,bundle/*,node_modules/*,vendor/*

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Do not wrap long lines
set nowrap

" Redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

set autoindent
set smartindent

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('sift')
  set grepprg=sift\ -nMs\ --no-color\ --binary-skip\ --column\ --no-group\ --git\ --follow
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore=\"**.min.js\"
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

colorscheme github
set background=light
highlight Comment cterm=italic gui=italic

let g:ale_set_balloons=1
let g:ale_sign_column_always=1
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ansible_name_highlight='d'
let g:ansible_template_syntaxes = {
      \   '*.ini.j2':               'dosini',
      \   '*.sh.j2':                'sh',
      \   '*.ya?ml.j2':             'yaml',
      \   'pf.conf.j2':             'pf',
      \   'resolv.conf(.tail)?.j2': 'resolv',
      \   'sshd_config.j2':         'sshdconfig',
      \ }

" let g:autopep8_ignore="E226,E24,W6"
" let g:autopep8_max_line_length=79

" let g:gitgutter_sign_added='+'
" let g:gitgutter_sign_modified='~'
" let g:gitgutter_sign_modified_removed='~_'
" let g:gitgutter_sign_removed='_'
" let g:gitgutter_sign_removed_first_line='‾'

let g:indentLine_char='┆'
let g:indentLine_noConcealCursor=''

" ⎇
let g:lightline={
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'readonly', 'gitbranch', 'filename' ]
      \     ],
      \     'right': [
      \       [ 'ale' ],
      \       [ 'lineinfo' ],
      \       [ 'percent' ],
      \       [ 'fileformat', 'fileencoding', 'filetype' ]
      \     ]
      \   },
      \   'colorscheme': 'github',
      \   'component_expand': {
      \     'linter_errors': 'LightlineLinterErrors',
      \     'linter_ok': 'LightlineLinterOK',
      \     'linter_warnings': 'LightlineLinterWarnings'
      \   },
      \   'component_function': {
      \     'ale': 'ale#statusline#Status',
      \     'filename': 'LightlineFilename',
      \     'gitbranch': 'LightlineGitBranch',
      \     'readonly': 'LightlineReadonly'
      \   },
      \   'subseparator': {
      \     'left': '│',
      \     'right': '│'
      \   }
      \ }

function! LightlineFilename()
  let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let l:modified = &modified ? ' 𝌡' : ''
  return l:filename . l:modified
endfunction

function! LightlineGitBranch()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" autocmd User ALELint call lightline#update()

let g:netrw_banner=0
let g:netrw_bufsettings='relativenumber,number'
" let g:netrw_keepdir=0
let g:netrw_liststyle=1

let g:vim_json_syntax_conceal=0

let g:vim_markdown_conceal=0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1

" autocmd BufRead,BufNewFile *.Jenkinsfile                 setlocal ft=groovy
" autocmd BufRead,BufNewFile *.ini.erb                     setlocal ft=dosini.eruby
" autocmd BufRead,BufNewFile *.ini.j2                      setlocal ft=dosini.jinja2
" autocmd BufRead,BufNewFile *.json.erb                    setlocal ft=json.eruby
" autocmd BufRead,BufNewFile *.json.j2                     setlocal ft=json.jinja2
" autocmd BufRead,BufNewFile *.lua.erb                     setlocal ft=lua.eruby
" autocmd BufRead,BufNewFile *.lua.j2                      setlocal ft=lua.jinja2
" autocmd BufRead,BufNewFile *.pl.erb                      setlocal ft=perl.eruby
" autocmd BufRead,BufNewFile *.pl.j2                       setlocal ft=perl.jinja2
" autocmd BufRead,BufNewFile *.properties.erb              setlocal ft=jproperties.eruby
" autocmd BufRead,BufNewFile *.properties.j2               setlocal ft=jproperties.jinja2
" autocmd BufRead,BufNewFile *.py.erb                      setlocal ft=python.eruby
" autocmd BufRead,BufNewFile *.py.j2                       setlocal ft=python.jinja2
" autocmd BufRead,BufNewFile *.sh.erb                      setlocal ft=sh.eruby
" autocmd BufRead,BufNewFile *.sh.j2                       setlocal ft=sh.jinja2
" autocmd BufRead,BufNewFile */ansible{,-*}/**/tasks/*.yml setlocal ft=ansible
" autocmd BufRead,BufNewFile */ansible{,-*}/*.yml          setlocal ft=ansible
" autocmd BufRead,BufNewFile *_Jenkinsfile                 setlocal ft=groovy
" autocmd BufRead,BufNewFile .babelrc                      setlocal ft=json
" autocmd BufRead,BufNewFile .envrc                        setlocal ft=sh
" autocmd BufRead,BufNewFile Jenkinsfile                   setlocal ft=groovy
" autocmd BufRead,BufNewFile Vagrantfile                   setlocal ft=ruby
" autocmd BufRead,BufNewFile acme-client.conf.j2           setlocal sw=8 ts=8
" autocmd BufRead,BufNewFile bash_profile.j2               setlocal ft=sh.jinja2
" autocmd BufRead,BufNewFile bashrc.j2                     setlocal ft=sh.jinja2
" autocmd BufRead,BufNewFile core_config.php.j2            setlocal ft=php.jinja2 noet sw=8 ts=8
" autocmd BufRead,BufNewFile dhcpd.conf.j2                 setlocal noet sw=8 ts=8
" autocmd BufRead,BufNewFile gemrc.j2                      setlocal ft=yaml.jinja2
" autocmd BufRead,BufNewFile gvimrc.j2                     setlocal ft=vim
" autocmd BufRead,BufNewFile liquidpromptrc.j2             setlocal ft=sh.jinja2
" autocmd BufRead,BufNewFile nsd.conf.j2                   setlocal noet sw=8 ts=8
" autocmd BufRead,BufNewFile pf.conf.j2                    setlocal ft=jinja2.pf
" autocmd BufRead,BufNewFile squid.conf.j2                 setlocal ft=squid.jinja2
" autocmd BufRead,BufNewFile unbound.conf.j2               setlocal noet sw=8 ts=8
" autocmd BufRead,BufNewFile vimrc.j2                      setlocal ft=vim

autocmd FileType c setlocal noet sw=8 ts=8

" -------------------

" Basic
"""""""

set noshowmode

"set hidden                      " Allow un-saved buffers in background
set noerrorbells                " don't beep
set belloff=all

""""""

"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

"" :h g:incsearch#auto_nohlsearch
"let g:incsearch#auto_nohlsearch=1
"map #  <Plug>(incsearch-nohl-#)
"map *  <Plug>(incsearch-nohl-*)
"map N  <Plug>(incsearch-nohl-N)
"map g# <Plug>(incsearch-nohl-g#)
"map g* <Plug>(incsearch-nohl-g*)
"map n  <Plug>(incsearch-nohl-n)

"nnoremap <C-p> :FuzzyOpen<CR>

" -- FORMATTING ----------------------------------------------------------------

"set textwidth=79
"set wrap
"set showbreak=+

"set smartindent

" Sed
let g:highlight_sedtabs=1

" Shell
""let bash_is_sh=1                " highlight bash syntax
let g:highlight_balanced_quotes=1 " highlight single quotes inside double
let g:highlight_function_names=1

" -----------------------------------------------------------------------------

set nospell
set spelllang=en_gb

"hi clear SpellBad
"hi SpellBad cterm=underline
"hi SpellBad cterm=undercurl

" -----------------------------------------------------------------------------

if $TERM_PROGRAM ==# 'Apple_Terminal'
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
  set mouse=a
endif

if $TERM ==# 'xterm-kitty'
  let &t_Cs="\e[4:3m"
  let &t_Ce="\e[4:0m"
  highlight SpellBad cterm=undercurl
  set mouse=a
endif

"" $ANSIBLE_VAULT;1.1;AES256
augroup ansible-vault
  autocmd!
  autocmd BufReadPre,FileReadPre */ansible/**/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */vars/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml silent %!ansible-vault decrypt
  autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml silent %!ansible-vault decrypt
  autocmd BufReadPost,FileReadPost */vars/vault.yml silent %!ansible-vault decrypt
  autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml silent %!ansible-vault encrypt
  autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml silent %!ansible-vault encrypt
  autocmd BufWritePre,FileWritePre */vars/vault.yml silent %!ansible-vault encrypt
  autocmd BufWritePost,FileWritePost */ansible/**/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */vars/vault.yml silent undo
augroup END

" function! ChezmoiEdit()
"   let file = expand('%')
"   silent! let repo = systemlist('chezmoi source-path')[0]
"   silent! let repo_file = systemlist('chezmoi source-path ' . fnameescape(file))[0]
"   if filereadable(repo_file)
"     let file = fnameescape(repo_file)
"   endif
"   execute 'edit' file
"   execute 'doautocmd BufReadPost' file
" endfunction

" augroup chezmoi-edit
"   autocmd!
"   autocmd BufReadCmd * call ChezmoiEdit()
" augroup END

if filereadable($MYVIMRC . '.local')
  execute 'source ' . $MYVIMRC . '.local'
endif
