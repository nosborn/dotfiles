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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
        end
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil') then
            if client:supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                    buffer = args.buf,
                    callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
                })
            end
        end
    end,
})

vim.lsp.enable('ansiblels')
vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('terraformls')
vim.lsp.enable('tflint')

-- vim.notify = require('notify')

vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('color-scheme', { clear = true }),
    pattern = 'catppuccin',
    callback = function() vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'FloatBorder' }) end,
})
require('catppuccin').setup({
    color_overrides = {
        mocha = {
            base = '#000000',
        },
    },
})
vim.cmd('colorscheme catppuccin')

require('mini.bracketed').setup()

local mini_clue = require('mini.clue')
mini_clue.setup({
    clues = {
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers({ show_contents = true }),
        mini_clue.gen_clues.windows({ submode_resize = true }),
        mini_clue.gen_clues.z(),
    },
    triggers = {
        { mode = 'c', keys = '<C-r>' },    -- registers
        { mode = 'i', keys = '<C-r>' },    -- registers
        { mode = 'i', keys = '<C-x>' },    -- built-in completion
        { mode = 'n', keys = "'" },        -- marks
        { mode = 'n', keys = '"' },        -- registers
        { mode = 'n', keys = '<C-w>' },    -- window commands
        { mode = 'n', keys = '<Leader>' }, -- leader triggers
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '`' },        -- marks
        { mode = 'n', keys = 'g' },        -- `g` key
        { mode = 'n', keys = 'z' },        -- `z` key
        { mode = 'x', keys = "'" },        -- marks
        { mode = 'x', keys = '"' },        -- registers
        { mode = 'x', keys = '<Leader>' }, -- leader triggers
        { mode = 'x', keys = '`' },        -- marks
        { mode = 'x', keys = 'g' },        -- `g` key
        { mode = 'x', keys = 'z' },        -- `z` key
    },
})

require('mini.completion').setup()

require('mini.icons').setup({
    file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
    },
    filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
    },
})
MiniIcons.mock_nvim_web_devicons() -- luacheck: globals MiniIcons
MiniIcons.tweak_lsp_kind()         -- luacheck: globals MiniIcons

require('mini.pick').setup()
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Pick from buffers' })
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Pick from files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Pick from pattern matches with live feedback' })
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, { desc = 'Pick from help tagss' })

-- require('mini.snippets').setup()

-- require('which-key').setup({
--     preset = 'helix',
-- })

vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
        },
    },
    -- underline = false,
    virtual_text = true,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

-- -- require('fidget').setup()
--
-- -- require('mini.cursorword').setup()
--
-- local mini_hipatterns = require('mini.hipatterns')
-- mini_hipatterns.setup({
--     highlighters = {
--         fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
--         hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
--         hex_color = mini_hipatterns.gen_highlighter.hex_color(),
--         note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
--         todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
--     },
-- })
--
-- require('telescope').setup({
--     -- defaults = {
--     --     mappings = {
--     --         i = {
--     --             ['<esc>'] = actions.close,
--     --         },
--     --     },
--     -- },
-- })
--
-- -- require('treesitter-context').setup()
--
-- require('trim').setup({
--     ft_blocklist = {
--         'python',
--     },
--
--     patterns = {
--         [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
--     },
-- })
--
-- require('virt-column').setup({
--     virtcolumn = '+1,80',
-- })

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
