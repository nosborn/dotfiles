-- vim.g.mapleader = ' '

vim.o.autoindent = true -- Use auto indent
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1' -- Add padding for lists (if 'wrap' is set)
-- vim.o.clipboard = 'unnamed,unnamedplus'
vim.o.colorcolumn = '+1' -- Draw column on the right of maximum width
vim.o.complete = '.,w,b,kspell' -- Use less sources
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior
vim.o.cursorline = true -- Enable current line highlighting
vim.o.cursorlineopt = 'screenline,number' -- Show cursor line per screen line
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true -- Ignore case during search
vim.o.incsearch = true -- Show search matches while typing
vim.o.infercase = true -- Infer case in built-in completion
vim.o.linebreak = true -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list = true -- Show helpful text indicators
vim.o.listchars = 'tab:⇥ ,extends:…,precedes:…,nbsp:␣'
vim.o.mouse = ''
vim.o.number = true -- Show line numbers
-- vim.o.pumblend = 10 -- make builtin completion menus slightly transparent
vim.o.pumheight = 10 -- Make popup menu smaller
-- vim.o.relativenumber = true
vim.o.ruler = false -- Don't show cursor coordinates
-- vim.o.scrolloff = 10
vim.o.shiftwidth = 2 -- Use this number of spaces for indentation
-- vim.o.shortmess = 'CFOSWaco' -- Disable some built-in completion messages
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
-- vim.o.updatetime = 1000
vim.o.virtualedit = 'block' -- Allow going past end of line in blockwise mode
-- vim.o.winblend = 10 -- make floating windows slightly transparent
vim.o.winborder = 'single' -- Use border in floating windows
-- vim.o.winhighlight = 'NormalNC:CursorLine'
vim.o.wrap = false -- Don't visually wrap lines (toggle with \w)

vim.g.health = { style = 'float' }
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.netrw_banner = 0

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })

-- Better up/down.
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys.
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Better indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Insert mode.
vim.keymap.set('i', '<C-a>', '<C-o>^')
vim.keymap.set('i', '<C-e>', '<C-o>$')
vim.keymap.set('i', '<C-k>', '<C-o>C')

-- Command mode.
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- Typing is hard.
vim.keymap.set('c', 'w1', function()
    if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline() == 'w1' then return 'w!' end
    return 'w1'
end, { expr = true })

vim.lsp.enable({
    -- 'ansiblels',
    'golangci_lint_ls',
    'gopls',
    'terraformls',
    'tflint',
    -- 'yamlls',
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', {}),
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
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = false }),
                buffer = args.buf,
                callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
            })
        end
        -- if client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable(true, args.buf)
        -- end
        -- Organize imports for gopls before save
        if client.name == 'gopls' then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('gopls-imports', { clear = true }),
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
            })
        end
    end,
})

do
    local group = vim.api.nvim_create_augroup('color-scheme', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
        group = group,
        pattern = 'catppuccin',
        callback = function() vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'FloatBorder' }) end,
    })
    vim.api.nvim_create_autocmd('ColorScheme', {
        group = group,
        pattern = '{default,retrobox,sorbet,wildcharm,zaibatsu}',
        callback = function() vim.api.nvim_set_hl(0, 'Comment', { italic = true }) end,
    })
end

require('kanso').setup({
    background = {
        dark = 'zen',
        light = 'pearl',
    },
    compile = true,
    dimInactive = true,
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

-- -- Show diagnostic popup when cursor moves to a diagnostic
-- vim.api.nvim_create_autocmd('CursorMoved', {
--     desc = 'Show diagnostic popup when navigating to diagnostics',
--     group = vim.api.nvim_create_augroup('diagnostic-popup', { clear = true }),
--     callback = function()
--         local current_line = vim.api.nvim_win_get_cursor(0)[1]
--         local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })
--         if #diagnostics > 0 then
--             -- Small delay to avoid popup spam while navigating
--             vim.defer_fn(function()
--                 if vim.api.nvim_win_get_cursor(0)[1] == current_line then
--                     vim.diagnostic.open_float(nil, { focus = false })
--                 end
--             end, 100)
--         end
--     end,
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
})

if vim.fn.executable('ansible-vault') == 1 then
    vim.cmd([[
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
            autocmd BufReadPre,FileReadPre */group_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
            autocmd BufReadPre,FileReadPre */host_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
            autocmd BufReadPre,FileReadPre */vars/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
            autocmd BufReadPost,FileReadPost */group_vars/*/vault.yaml call AnsibleVaultDecrypt()
            autocmd BufReadPost,FileReadPost */host_vars/*/vault.yaml call AnsibleVaultDecrypt()
            autocmd BufReadPost,FileReadPost */vars/vault.yaml call AnsibleVaultDecrypt()
            autocmd BufWritePre,FileWritePre */group_vars/*/vault.yaml call AnsibleVaultEncrypt()
            autocmd BufWritePre,FileWritePre */host_vars/*/vault.yaml call AnsibleVaultEncrypt()
            autocmd BufWritePre,FileWritePre */vars/vault.yaml call AnsibleVaultEncrypt()
            autocmd BufWritePost,FileWritePost */group_vars/*/vault.yaml silent undo
            autocmd BufWritePost,FileWritePost */host_vars/*/vault.yaml silent undo
            autocmd BufWritePost,FileWritePost */vars/vault.yaml silent undo
        augroup END
    ]])
end
