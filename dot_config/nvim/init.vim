scriptencoding utf-8

" let g:mapleader = ' '

set autoindent " Use auto indent
set breakindent " Indent wrapped lines to match line start
set breakindentopt=list:-1 " Add padding for lists (if 'wrap' is set)
" set clipboard=unnamed,unnamedplus
set colorcolumn=+1 " Draw column on the right of maximum width
set complete=.,w,b,kspell " Use less sources
set completeopt=menuone,noselect,fuzzy,nosort " Use custom behavior
set cursorline " Enable current line highlighting
set cursorlineopt=screenline,number " Show cursor line per screen line
set expandtab " Convert tabs to spaces
set foldenable
set foldlevelstart=99
set formatoptions=rqnl1j " Improve comment editing
set guicursor=n-v-i-c:block-Cursor
set ignorecase " Ignore case during search
set incsearch " Show search matches while typing
set infercase " Infer case in built-in completion
set linebreak " Wrap lines at 'breakat' (if 'wrap' is set)
set list " Show helpful text indicators
set listchars=tab:⇥\ ,extends:…,precedes:…,nbsp:␣
set mouse=
set noruler " Don't show cursor coordinates
set noshowmode " Don't show mode in command line
set noswapfile
set nowrap " Don't visually wrap lines (toggle with \w)
set number " Show line numbers
" set pumblend=10 " Make builtin completion menus slightly transparent
set pumheight=10 " Make popup menu smaller
" set relativenumber
" set scrolloff=10
set shiftwidth=2 " Use this number of spaces for indentation
set shortmess=CFOSWaco " Disable some built-in completion messages
set signcolumn=yes " Always show signcolumn (less flicker)
set smartcase " Respect case if search pattern has upper case
set smartindent " Make indenting smart
" set spelllang=en_gb
set spelloptions=camel " Treat camelCase word parts as separate words
set splitbelow " Horizontal splits will be below
set splitkeep=screen " Reduce scroll during window split
set splitbelow " Horizontal splits should be below
set switchbuf=usetab " Use already opened buffers when switching
set tabstop=2 " Show tab as this number of spaces
set textwidth=80
" set updatetime=1000
set virtualedit=block " Allow going past end of line in blockwise mode
" set winblend=10 " Make floating windows slightly transparent
set winborder=single " Use border in floating windows
set winhighlight=NormalNC:CursorLine

let g:health = {'style': 'float'}
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:netrw_banner = 0

" Clear highlights on search
nnoremap <Esc> <cmd>nohlsearch<CR>

" Better up/down
nnoremap <expr> <silent> <Down> v:count == 0 ? 'gj' : 'j'
xnoremap <expr> <silent> <Down> v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <silent> <Up> v:count == 0 ? 'gk' : 'k'
xnoremap <expr> <silent> <Up> v:count == 0 ? 'gk' : 'k'
nnoremap <expr> <silent> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> <silent> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <silent> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> <silent> k v:count == 0 ? 'gk' : 'k'

" Move to window using the <ctrl> hjkl keys
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Insert mode
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-k> <C-o>C

" Command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Typing is hard
cnoremap <expr> w1 getcmdtype() == ':' && getcmdline() == 'w1' ? 'w!' : 'w1'

lua <<EOT
vim.lsp.enable({
    -- 'ansible_language_server',
    'golangci_lint_langserver',
    'gopls',
    'terraform_ls',
    'terramate_ls',
    'tflint',
    'tombi',
    -- 'yaml_language_server',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
        end
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if
            not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting')
        then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = false }),
            })
        end
        -- if client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable(true, args.buf)
        -- end
        -- Organize imports for gopls before save
        if client.name == 'gopls' then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
                    params.context = { only = { 'source.organizeImports' } }
                    local result = vim.lsp.buf_request_sync(args.buf, 'textDocument/codeAction', params, 3000)
                    for _, res in pairs(result or {}) do
                        for _, r in pairs(res.result or {}) do
                            if r.edit then vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding) end
                        end
                    end
                end,
                group = vim.api.nvim_create_augroup('gopls-imports', { clear = true }),
            })
        end
    end,
    group = vim.api.nvim_create_augroup('lsp-attach', {}),
})
EOT

lua <<EOT
require('kanso').setup({
    background = {
        dark = 'zen',
        light = 'pearl',
    },
    -- dimInactive = true,
    -- foreground = 'saturated',
})
EOT
colorscheme kanso

lua <<EOT
vim.diagnostic.config({
    -- float = {
    --     border = 'rounded',
    --     source = 'always',
    --     width = 100,
    --     wrap = true,
    --     format = function(diagnostic)
    --         return string.format('[%s] %s', diagnostic.source or 'unknown', diagnostic.message)
    --     end,
    -- },
    severity_sort = true,
    signs = {
        priority = 9999,
        severity = {
            max = 'ERROR',
            min = 'WARN',
        },
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
        },
    },
    underline = {
        severity = {
            max = 'ERROR',
            min = 'HINT',
        },
    },
    virtual_lines = false,
    virtual_text = {
        current_line = true,
        severity = {
            max = 'ERROR',
            min = 'ERROR',
        },
    },
})
EOT

augroup highlight-yank
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank()
augroup END
