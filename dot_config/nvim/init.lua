-- vim.g.mapleader = ' '

vim.o.autoindent = true
-- vim.o.clipboard = 'unnamed,unnamedplus'
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.cursorline = true
-- vim.o.cursorlineopt = 'number'
vim.o.expandtab = true
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true
-- vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = 'tab:⇥ ,extends:…,precedes:…,nbsp:␣'
vim.o.mouse = ''
vim.o.number = true
-- vim.o.pumblend = 10 -- make builtin completion menus slightly transparent
-- vim.o.pumheight = 10 -- make popup menu smaller
-- vim.o.relativenumber = true
-- vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
-- vim.o.spelllang = 'en_gb'
vim.o.spelloptions = 'camel'
vim.o.swapfile = false
vim.o.tabstop = 2
-- vim.o.updatetime = 1000
-- vim.o.winblend = 10 -- make floating windows slightly transparent
-- vim.o.winborder = 'bold'
-- vim.o.winhighlight = 'NormalNC:CursorLine'

-- vim.g.health = { style = 'float' }
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

vim.lsp.enable({
    -- 'ansiblels',
    'golangci_lint_ls',
    'gopls',
    'harper_ls',
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

local map_multistep = require('mini.keymap').map_multistep
map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })

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
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
        },
    },
    underline = false,
    virtual_text = true,
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
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
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

-- Typing is hard.
vim.cmd([[
    cabbrev <expr> w1 getcmdtype() == ':' && getcmdline() == 'w1' ? 'w!' : 'w1'
]])
