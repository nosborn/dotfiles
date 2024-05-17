scriptencoding utf-8

set colorcolumn=80
" set foldexpr=lua vim.treesitter.foldexpr()
" set foldmethod=expr
set ignorecase
set laststatus=3
set list
set listchars=nbsp:▿,tab:»·,trail:▿
set mouse=a
set nobackup
set noshowcmd
set noshowmode
set noswapfile
set nowrap
set nowritebackup
set number
" set path=$PWD/**
set relativenumber
set scrolloff=2
" set shada-=!
set shortmess+=I
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smarttab
set spell
set spelllang=en_gb
set spelloptions=camel,noplainbuffer
" set tags./tags;,tags
set termguicolors " not needed in nvim 10
set ttimeout
set updatetime=250
set wildignore+=**/.DS_Store
set wildignore+=**/.git/**
set wildignore+=**/.terraform.d/**
set wildignore+=**/.terraform.lock.hcl
set wildignore+=**/.terraform/**
set wildignore+=**/.terragrunt-cache/**
set wildignore+=**/node_modules/**
set wildignore+=*.class
set wildignore+=*.gz
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.pyc
set wildignore+=*.swp
set wildignore+=*.tar
set wildignore+=*.tar.gz
set wildignore+=*.tgz
set wildignore+=*.tmp
set wildignore+=*.zip
set wildignore+=*~

if executable('rg') " not needed in nvim 10
  set grepformat=%f:%l:%c:%m
  set grepprg=rg\ --smart-case\ --vimgrep
endif

lua <<EOT
require("config/lsp")
EOT

let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = {
      \   '*.conf.j2': 'conf',
      \   '*.ini.j2': 'dosini',
      \   '*.json.j2': 'json',
      \   '*.sh.j2': 'sh',
      \   '*.service.j2': 'systemd',
      \   '*.yaml.j2': 'yaml',
      \   '*.yml.j2': 'yaml',
      \   'Dockerfile.j2': 'dockerfile',
      \   'my.cnf.j2': 'dosini',
      \   'named.conf.j2': 'named',
      \   'nginx.conf.j2': 'nginx',
      \   'smb.conf.j2': 'dosini',
      \   'sshd_config.j2': 'sshdconfig'
      \ }
let g:ansible_unindent_after_newline = 1

let g:bash_is_sh = 1

let g:direnv_auto = 0

let g:highlight_balanced_quotes = 1
let g:highlight_function_names = 1
let g:highlight_sedtabs = 1

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0

let g:markdown_fenced_languages = [
      \   'bash',
      \   'gitconfig',
      \   'hcl',
      \   'json',
      \   'sh',
      \   'terraform',
      \   'yaml',
      \   'zsh'
      \ ]
let g:markdown_syntax_conceal = 0

let g:vim_json_conceal = 0

let g:vimsyn_embed = 'l'

lua <<EOT
vim.diagnostic.config({
  float = {
    border = "single",
    focusable = false,
  },
  severity_sort = true,
  underline = false,
  update_in_insert = true,
})
EOT

" lua <<EOT
" vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
"   border = "single"
" })
"
" vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
"   border = "single",
"   focusable = true,
"   relative = "cursor"
" })
"
" -- Suppress error messages from language servers.
" vim.notify = function(msg, log_level)
"   if msg:match "exit code" then
"     return
"   end
"   if log_level == vim.log.levels.ERROR then
"     vim.api.nvim_err_writeln(msg)
"   else
"     vim.api.nvim_echo({ { msg } }, true, {})
"   end
" end
" EOT

" lua <<EOT
" -- Borders for LspInfo window.
" local win = require "lspconfig.ui.windows"
" local _default_opts = win.default_opts
"
" win.default_opts = function(options)
"   local opts = _default_opts(options)
"   opts.border = "single"
"   return opts
" end
" EOT

sign define DiagnosticSignError text=󰅚 texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignHint text=󰌶 texthl=DiagnosticSignHint linehl= numhl=
sign define DiagnosticSignInfo text=󰋽 texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignWarn text=󰀪 texthl=DiagnosticSignWarn linehl= numhl=

nnoremap <silent> [d <Cmd>lua vim.diagnostic.goto_prev({float = false})<CR> " not needed in nvim 10
nnoremap <silent> ]d <Cmd>lua vim.diagnostic.goto_next({float = false})<CR> " not needed in nvim 10

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

lua require("config/autocmds")

" " Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

map Q <Nop>

" inoremap <C-U> <C-G>u<C-U>
"
" if !exists(':DiffOrig')
"   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
"          \ | wincmd p | diffthis
" endif
"
" set wildcharm=<C-Z>
" cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
" cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
" cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
" cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

highlight Comment cterm=italic gui=italic
