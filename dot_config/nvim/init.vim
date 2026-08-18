set encoding=UTF-8
scriptencoding utf-8

set autoindent
set breakindent
set breakindentopt=list:-1
" set cmdheight=1
set colorcolumn=+1
if has('nvim-0.12')
  set completetimeout=100
endif
set cursorline
set cursorlineopt=screenline,number
set expandtab
set foldlevel=10
set foldmethod=expr
set foldnestmax=10
set formatoptions=rqnl1j
set ignorecase
set incsearch
set infercase
set iskeyword=@,48-57,_,192-255,-
set linebreak
set list
set mouse=a
set mousescroll=ver:25,hor:6
set nomodeline
set noruler
set noshowmode
set noswapfile
set noundofile
set nowrap
set number
if has('nvim-0.12')
  set pumborder=single
endif
set pumheight=10
if has('nvim-0.12')
  set pummaxwidth=100
endif
set shiftwidth=2
set shortmess=CFIOSWaco
set signcolumn=yes
set smartcase
set smartindent
" set spelllang=en_gb
set spelloptions=camel
set splitbelow
set splitkeep=screen
set switchbuf=usetab
set tabstop=2
set textwidth=80
set virtualedit=block
set winborder=single
set winhighlight=NormalNC:CursorLine

lua <<EOT
-- vim.g.mapleader = ' '

vim.o.complete = '.,w,b,kspell'
vim.o.completeopt = 'fuzzy,menuone,noselect,nosort'
vim.o.fillchars = 'eob: ,fold:·,foldclose:▶︎,foldinner: ,foldopen:▼,foldsep: ,trunc:…,truncrl:…'
vim.o.foldcolumn = '1'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.guicursor = '' -- 'n-v-i-c:block-Cursor'
vim.o.listchars = 'tab:⇥ ,extends:…,precedes:…,nbsp:␣'
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
EOT

filetype plugin indent on
" syntax enable

lua <<EOT
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.cmd('setlocal formatoptions-=c formatoptions-=o')
    end,
    desc = "Proper 'formatoptions'",
    group = vim.api.nvim_create_augroup('custom-config', {}),
})

vim.g.health = { style = 'float' }
EOT

let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0

let g:netrw_altfile = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

let g:chezmoi#use_external = 1
let g:chezmoi#use_tmp_buffer = 1

lua <<EOT
-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better up/down
vim.keymap.set({ 'n', 'x' }, '<Down>', function()
    return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', function()
    return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'j', function()
    return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', function()
    return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, silent = true })

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Insert mode
vim.keymap.set('i', '<C-a>', '<C-o>^')
vim.keymap.set('i', '<C-e>', '<C-o>$')
vim.keymap.set('i', '<C-k>', '<C-o>C')

-- Command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- Typing is hard
vim.keymap.set('c', 'w1', function()
    return vim.fn.getcmdtype() == ':' and vim.fn.getcmdline() == 'w1' and 'w!' or 'w1'
end, { expr = true })

vim.lsp.enable({
    -- 'ansiblels',
    'clangd',
    'golangci_lint_ls',
    'gopls',
    'systemd_lsp',
    -- 'terraformls',
    -- 'terramatels',
    -- 'tflint',
    -- 'yamlls',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- if client:supports_method('textDocument/implementation') then
        --     -- Create a keymap for vim.lsp.buf.implementation ...
        -- end
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
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
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
                            if r.edit then
                                vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
                            end
                        end
                    end
                end,
                group = vim.api.nvim_create_augroup('gopls-imports', { clear = true }),
            })
        end
    end,
    group = vim.api.nvim_create_augroup('lsp-attach', {}),
})

require('catppuccin').setup({
    background = {
        dark = 'frappe',
        light = 'latte',
    },
    -- overrides = function(_)
    --     return {
    --         FloatBorder = { link = 'PmenuBorder' },
    --     }
    -- end,
    -- -- dimInactive = true,
    -- -- foreground = 'saturated',
})
vim.cmd('colorscheme catppuccin-nvim')

local _diag_open_float = vim.diagnostic.open_float
---@diagnostic disable-next-line: duplicate-set-field
vim.diagnostic.open_float = function(opts, ...)
    local bufnr, winnr = _diag_open_float(opts, ...)
    if winnr and vim.api.nvim_win_is_valid(winnr) then
        vim.wo[winnr].winhighlight = 'Normal:Pmenu,FloatBorder:PmenuBorder'
    end
    return bufnr, winnr
end

vim.diagnostic.config({
    float = {
        border = 'rounded',
        focusable = 'false',
    },
    severity_sort = true,
    signs = {
        priority = 9999,
        severity = {
            max = 'ERROR',
            min = 'WARN',
        },
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.HINT] = '󰌶',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
    },
    underline = false,
    update_in_insert = true,
    virtual_lines = true,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    group = vim.api.nvim_create_augroup('highlight-yank', {}),
})
EOT

lua require('vim._core.ui2').enable()
