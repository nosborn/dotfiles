-- vim.g.mapleader = " "

vim.o.autoindent = true
-- vim.o.clipboard = 'unnamed,unnamedplus'
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
vim.o.expandtab = true
-- vim.o.fillchars = 'horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┨,vertright:┣,verthoriz:╋'
-- vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.o.foldmethod = 'expr'
-- vim.o.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true
-- vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:⇥ '
vim.o.mouse = ''
vim.o.number = true
-- vim.o.pumblend = 10 -- make builtin completion menus slightly transparent
-- vim.o.pumheight = 10 -- make popup menu smaller
vim.o.relativenumber = true
-- vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
-- vim.o.spelllang = 'en_gb'
vim.o.spelloptions = 'camel'
vim.o.swapfile = false
vim.o.tabstop = 2
-- vim.o.undofile = false
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

local map_multistep = require('mini.keymap').map_multistep
map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })

-- local notify_many_keys = function(key)
--     local lhs = string.rep(key, 5)
--     local action = function() vim.notify('Too many ' .. key) end
--     require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
-- end
-- notify_many_keys('h')
-- notify_many_keys('j')
-- notify_many_keys('k')
-- notify_many_keys('l')

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
-- vim.cmd('colorscheme retrobox')

-- require('kanagawa').setup({
--     compile = false,  -- enable compiling the colorscheme
--     undercurl = true, -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true },
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = false,   -- do not set background color
--     dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true, -- define vim.g.terminal_color_{0,17}
--     colors = {             -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = 'wave',    -- Load "wave" theme
--     background = {     -- map the value of 'background' option to a theme
--         dark = 'wave', -- try "dragon" !
--         light = 'lotus',
--     },
-- })
require('kanagawa').setup({
    -- compile = false,  -- enable compiling the colorscheme
    -- undercurl = true, -- enable undercurls
    -- commentStyle = { italic = true },
    -- functionStyle = {},
    -- keywordStyle = { italic = true },
    -- statementStyle = { bold = true },
    -- typeStyle = {},
    -- transparent = false,   -- do not set background color
    dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
    -- colors = {             -- add/modify theme and palette colors
    --     palette = {},
    --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    -- },
    -- overrides = function(colors) -- add/modify highlights
    --     return {}
    -- end,
    theme = 'dragon', -- Load "wave" theme
    background = { -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        -- light = 'lotus',
    },
})
vim.cmd('colorscheme kanagawa')

-- vim.lsp.enable('gopls')
-- vim.lsp.enable('golangci_lint_ls')

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

-- -- require('treesitter-context').setup()

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
