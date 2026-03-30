-- vim.g.mapleader = ' '

vim.o.autoindent = true -- Use auto indent
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1' -- Add padding for lists (if 'wrap' is set)
vim.o.colorcolumn = '+1' -- Draw column on the right of maximum width
vim.o.complete = '.,w,b,kspell' -- Use less sources
vim.o.completeopt = 'fuzzy,menuone,noselect,nosort' -- Use custom behavior
vim.o.completetimeout = 100 -- Limit sources delay
vim.o.cursorline = true -- Enable current line highlighting
vim.o.cursorlineopt = 'screenline,number' -- Show cursor line per screen line
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod = 'indent' -- Fold based on indent level
vim.o.foldnestmax = 10 -- Limit number of fold levels
vim.o.foldtext = '' -- Show text under fold with its highlighting
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true -- Ignore case during search
vim.o.incsearch = true -- Show search matches while typing
vim.o.infercase = true -- Infer case in built-in completion
vim.o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part
vim.o.linebreak = true -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list = true -- Show helpful text indicators
vim.o.listchars = 'tab:⇥ ,extends:…,precedes:…,nbsp:␣'
vim.o.mouse = 'a' -- Enable mouse
vim.o.mousescroll = 'ver:25,hor:6' -- Customize mouse scroll
vim.o.number = true -- Show line numbers
vim.o.pumborder = 'single' -- Use border in popup menu
vim.o.pumheight = 10 -- Make popup menu smaller
vim.o.pummaxwidth = 100 -- Make popup menu not too wide
vim.o.ruler = false -- Don't show cursor coordinates
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)
vim.o.shiftwidth = 2 -- Use this number of spaces for indentation
vim.o.shortmess = 'CFIOSWaco' -- Disable some built-in completion messages
vim.o.showmode = false -- Don't show mode in command line
vim.o.signcolumn = 'yes' -- Always show signcolumn (less flicker)
vim.o.smartcase = true -- Respect case if search pattern has upper case
vim.o.smartindent = true -- Make indenting smart
-- vim.o.spelllang = 'en_gb'
vim.o.spelloptions = 'camel' -- Treat camelCase word parts as separate words
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitkeep = 'screen' -- Reduce scroll during window split
vim.o.splitbelow = true -- Horizontal splits should be below
vim.o.swapfile = false
vim.o.switchbuf = 'usetab' -- Use already opened buffers when switching
vim.o.tabstop = 2 -- Show tab as this number of spaces
vim.o.textwidth = 80
vim.o.undofile = false -- Disable persistent undo
vim.o.virtualedit = 'block' -- Allow going past end of line in blockwise mode
vim.o.winborder = 'single' -- Use border in floating windows
vim.o.winhighlight = 'NormalNC:CursorLine'
vim.o.wrap = false -- Don't visually wrap lines (toggle with \w)

vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then
    vim.cmd('syntax enable')
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.cmd('setlocal formatoptions-=c formatoptions-=o')
    end,
    desc = "Proper 'formatoptions'",
    group = vim.api.nvim_create_augroup('custom-config', {}),
})

vim.g.health = { style = 'float' }
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.netrw_banner = 0

vim.g['chezmoi#use_external'] = 1
vim.g['chezmoi#use_tmp_buffer'] = 1

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
    'golangci_lint_ls',
    'gopls',
    'terraformls',
    'terramatels',
    -- 'tflint',
    -- 'yamlls',
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

require('kanso').setup({
    background = {
        dark = 'zen',
        light = 'pearl',
    },
    -- dimInactive = true,
    -- foreground = 'saturated',
})
vim.cmd('colorscheme kanso')

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
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
        },
    },
    underline = {
        severity = {
            max = 'ERROR',
            min = 'HINT',
        },
    },
    update_in_insert = false,
    virtual_lines = false,
    virtual_text = {
        current_line = true,
        severity = {
            max = 'ERROR',
            min = 'ERROR',
        },
    },
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    group = vim.api.nvim_create_augroup('highlight-yank', {}),
})
