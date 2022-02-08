scriptencoding utf-8

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

map Q <Nop>

set ignorecase
set list
set listchars=tab:»·,trail:▿,nbsp:▿
set mouse=a
set nobackup
set noshowmode
set nospell
set noswapfile
set nowrap
set nowritebackup
set number
set path=$PWD/**
set relativenumber
set scrolloff=2
set shortmess+=I
set showcmd
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smarttab
set spelllang=en_gb
set tags=./tags;,tags
set ttimeout
set viminfo-=!
set updatetime=250
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,**/.DS_Store,**/.git/**,**/.terraform/**,**/node_modules/**
set wildoptions=tagfile

inoremap <C-U> <C-G>u<C-U>

if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = {
  \   '*.conf.j2':      'conf',
  \   '*.ini.j2':       'dosini',
  \   '*.json.j2':      'json',
  \   '*.php.j2':       'php',
  \   '*.sh.j2':        'sh',
  \   '*.service.j2':   'systemd',
  \   '*.yaml.j2':      'yaml',
  \   '*.yml.j2':       'yaml',
  \   'Dockerfile.j2':  'dockerfile',
  \   'my.cnf.j2':      'dosini',
  \   'named.conf.j2':  'named',
  \   'nginx.conf.j2':  'nginx',
  \   'smb.conf.j2':    'dosini',
  \   'sshd_config.j2': 'sshdconfig',
  \ }
let g:ansible_unindent_after_newline = 1

let g:bash_is_sh = 1

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

let g:highlight_balanced_quotes = 1
let g:highlight_function_names = 1
let g:highlight_sedtabs = 1

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0

let g:markdown_fenced_languages = [
      \   'bash',
      \   'gitconfig',
      \   'json',
      \   'sh',
      \   'terraform',
      \   'yaml',
      \   'zsh',
      \ ]
let g:markdown_syntax_conceal = 0

let g:vim_json_conceal = 0

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

nnoremap <silent> <leader>b :Buffers<CR>

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

" augroup diagnostics-float
"   autocmd!
"   autocmd CursorHold * lua vim.diagnostic.open_float()
" augroup END

lua <<EOT
vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
    spacing = 1,
  },
  float = {
    focusable = false,
  },
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '[a', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']a', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
EOT
