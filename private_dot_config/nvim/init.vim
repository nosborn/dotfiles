if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fL -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " vint: next-line -ProhibitAutocmdWithNoGroup
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'direnv/direnv.vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

map Q <Nop>

scriptencoding=utf-8

set cursorline
set ignorecase
set list
set listchars=tab:»·,trail:▿,nbsp:▿
set nobackup
set noerrorbells
set noshowcmd
set noshowmode
set nospell
set noswapfile
set nowrap
set nowritebackup
set number
set scrolloff=2
set shortmess+=I
set showmatch
set sidescrolloff=5
set smartindent
set spelllang=en_gb
set tags^=./.git/tags;
set updatetime=100
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,.CFUserTextEncoding,.DS_Store,.git/*,.idea/*,.terraform/*,bundle/*,node_modules/*,vendor/*

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

function! MyColorSchemeHighlights() abort
  highlight Comment cterm=italic gui=italic
  highlight SpellBad cterm=undercurl
endfunction

augroup MyColorScheme
  autocmd!
  autocmd ColorScheme * call MyColorSchemeHighlights()
augroup END

if $TERM ==# 'xterm-kitty'
  let g:base16colorspace = 256
endif
colorscheme base16-pop

let g:airline#extensions#ale#checking_symbol = '…'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#show_line_numbers = 0
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline_skip_empty_sections = 1
let g:airline_theme = 'base16_pop'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ'
let g:ale_sign_warning = '‼'
let g:ale_virtualtext_cursor = 1
" let g:ale_virtualtext_delay = 100
let g:ale_virtualtext_prefix = '❯ '
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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

let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1

let g:highlight_balanced_quotes = 1
let g:highlight_function_names = 1
let g:highlight_sedtabs = 1

let g:loaded_node_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0

" let g:mkdp_auto_start = 1

let g:netrw_banner = 0
let g:netrw_bufsettings = 'relativenumber,number'
" let g:netrw_keepdir = 0
let g:netrw_liststyle = 1

let g:python3_host_prog = '/usr/local/bin/python3'

let g:terraform_fmt_on_save = 1

let g:vim_json_syntax_conceal = 0

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

if $TERM_PROGRAM ==# 'Apple_Terminal'
  set mouse=a
  let &t_ZH = "\e[3m"
  let &t_ZR = "\e[23m"
endif

if $TERM ==# 'xterm-kitty'
  set mouse=a
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
  let &t_ut = '' " https://sw.kovidgoyal.net/kitty/faq.html#id3
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

nmap [A :ALEFirst<CR>
nmap ]A :ALELast<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]a :ALENextWrap<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

let g:height = float2nr(&lines * 0.9)
let g:width = float2nr(&columns * 0.95)
let g:preview_width = float2nr(&columns * 0.7)
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi' --preview-window right:" . g:preview_width
let g:fzf_layout = {
  \   'window': 'call FloatingFZF(' . g:width . ',' . g:height . ')'
  \ }

function! FloatingFZF(width, height)
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  " let height = float2nr(10)
  " let width = float2nr(80)
  let horizontal = float2nr((&columns - a:width) / 2)
  let vertical = 1

  let opts = {
        \   'relative': 'editor',
        \   'row': vertical,
        \   'col': horizontal,
        \   'width': a:width,
        \   'height': a:height,
        \   'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader>b :Buffers<CR>
