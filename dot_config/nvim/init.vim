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
set termguicolors
set ttimeout
set updatetime=250
set wildignore=*~,*.class,*.o,*.obj,*.pyc,*.swp,*.tar.gz,*.tgz,*.tmp,*.zip,**/.DS_Store,**/.git/**,**/.terraform/**,**/.terraform.d/**,**/.terraform.lock.hcl,**/.terragrunt-cache/**,**/node_modules/**

if executable('rg')
  set grepformat=%f:%l:%c:%m
  set grepprg=rg\ --smart-case\ --vimgrep
endif

let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
" let g:ansible_template_syntaxes = {
"   ["*.conf.j2"] = "conf",
"   ["*.ini.j2"] = "dosini",
"   ["*.json.j2"] = "json",
"   ["*.sh.j2"] = "sh",
"   ["*.service.j2"] = "systemd",
"   ["*.yaml.j2"] = "yaml",
"   ["*.yml.j2"] = "yaml",
"   ["Dockerfile.j2"] = "dockerfile",
"   ["my.cnf.j2"] = "dosini",
"   ["named.conf.j2"] = "named",
"   ["nginx.conf.j2"] = "nginx",
"   ["smb.conf.j2"] = "dosini",
"   ["sshd_config.j2"] = "sshdconfig",
" }
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
      \   'terraform=hcl',
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
"
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

nnoremap <Leader>fb <Cmd>Telescope buffers<CR>
nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>
nnoremap <Leader>gp <Cmd>Gitsigns preview_hunk<CR>
nnoremap <silent> [d <Cmd>lua vim.diagnostic.goto_prev({float = false})<CR>
nnoremap <silent> ]d <Cmd>lua vim.diagnostic.goto_next({float = false})<CR>
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

augroup AnsibleVault
  autocmd!
  autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile viminfo=
  autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile viminfo=
  autocmd BufReadPre,FileReadPre */vars/*/vault.yml setlocal nobackup noswapfile noundofile viminfo=
  autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml call ansible#vault#decrypt()
  autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml call ansible#vault#decrypt()
  autocmd BufReadPost,FileReadPost */vars/*/vault.yml, call ansible#vault#decrypt()
  autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml call ansible#vault#encrypt()
  autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml call ansible#vault#encrypt()
  autocmd BufWritePre,FileWritePre */vars/*/vault.yml call ansible#vault#encrypt()
  autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */vars/*/vault.yml silent undo
augroup END

" -- local open_diagnostic_float_group = vim.api.nvim_create_augroup("OpenDiagnosticFloat", { clear = true })
" -- vim.api.nvim_create_autocmd(
" --   "CursorHold",
" --   { pattern = "*", command = "lua vim.diagnostic.open_float()", group = open_diagnostic_float_group }
" -- )

" local open_folds_group = vim.api.nvim_create_augroup("OpenFolds", { clear = true })
" vim.api.nvim_create_autocmd(
"   { "BufReadPost", "FileReadPost" },
"   { pattern = "*", command = "normal zR", group = open_folds_group }
" )

" " Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif
"
" map Q <Nop>
"
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
