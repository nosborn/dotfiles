-- vim.g.mapleader = ' '

vim.o.autoindent = true
vim.o.breakindent = true
vim.o.breakindentopt = 'list:-1'
-- vim.o.cmdheight = 1
vim.o.colorcolumn = '+1'
vim.o.complete = '.,w,b,kspell'
vim.o.completeopt = 'fuzzy,menuone,noselect,nosort'
if vim.fn.has('nvim-0.12') == 1 then
    vim.o.completetimeout = 100
end
vim.o.cursorline = true
vim.o.cursorlineopt = 'screenline,number'
vim.o.expandtab = true
vim.o.fillchars = 'eob: ,fold: ,foldclose:,foldinner: ,foldopen:,foldsep: '
vim.o.foldcolumn = 'auto:1'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 10
vim.o.foldmethod = 'expr'
vim.o.foldnestmax = 10
vim.o.foldtext = ''
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.formatoptions = 'rqnl1j'
-- vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.iskeyword = '@,48-57,_,192-255,-'
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'tab:⇥ ,extends:…,precedes:…,nbsp:␣'
vim.o.modeline = false
vim.o.mouse = 'a'
vim.o.mousescroll = 'ver:25,hor:6'
vim.o.number = true
if vim.fn.has('nvim-0.12') == 1 then
    vim.o.pumborder = 'single'
end
vim.o.pumheight = 10
if vim.fn.has('nvim-0.12') == 1 then
    vim.o.pummaxwidth = 100
end
vim.o.ruler = false
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.o.shiftwidth = 2
vim.o.shortmess = 'CFIOSWaco'
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
-- vim.o.spelllang = 'en_gb'
vim.o.spelloptions = 'camel'
vim.o.splitbelow = true
vim.o.splitkeep = 'screen'
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.switchbuf = 'usetab'
vim.o.tabstop = 2
vim.o.textwidth = 80
vim.o.undofile = false
vim.o.virtualedit = 'block'
vim.o.winborder = 'single'
vim.o.winhighlight = 'NormalNC:CursorLine'
vim.o.wrap = false

vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then
    vim.cmd('syntax enable')
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.cmd('setlocal formatoptions-=c formatoptions-=o')
        vim.bo.indentexpr = 'v:lua.require("treesitter").indentexpr()'
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

require('kanso').setup({
    background = {
        dark = 'zen',
        light = 'pearl',
    },
    -- dimInactive = true,
    -- foreground = 'saturated',
})
vim.cmd('colorscheme kanso')
-- vim.g.kanso_lualine_bold = 1

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
        border = 'single',
        -- source = 'always',
        -- width = 100,
        -- wrap = true,
        -- format = function(diagnostic)
        --     return string.format('[%s] %s', diagnostic.source or 'unknown', diagnostic.message)
        -- end,
    },
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

-- require('vim._core.ui2').enable({
--     enable = true,
--     msg = {
--         cmd = {
--             height = 0.5,
--         },
--         dialog = {
--             height = 0.5,
--         },
--         msg = {
--             height = 0.3,
--             timeout = 5000,
--         },
--         pager = {
--             height = 0.5,
--         },
--         targets = {
--             [''] = 'msg',
--             bufwrite = 'msg',
--             completion = 'cmd',
--             confirm = 'cmd',
--             echo = 'msg',
--             echoerr = 'pager',
--             echomsg = 'msg',
--             empty = 'cmd',
--             emsg = 'pager',
--             list_cmd = 'pager',
--             lua_error = 'pager',
--             lua_print = 'msg',
--             progress = 'pager',
--             quickfix = 'msg',
--             rpc_error = 'pager',
--             search_cmd = 'cmd',
--             search_count = 'cmd',
--             shell_cmd = 'pager',
--             shell_err = 'pager',
--             shell_out = 'pager',
--             shell_ret = 'msg',
--             typed_cmd = 'cmd',
--             undo = 'msg',
--             verbose = 'pager',
--             wildlist = 'cmd',
--             wmsg = 'msg',
--         },
--     },
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--     callback = function()
--         local ui2 = require('vim._core.ui2')
--         local win = ui2.wins and ui2.wins.msg
--         if win and vim.api.nvim_win_is_valid(win) then
--             vim.api.nvim_set_option_value(
--                 'winhighlight',
--                 'Normal:NormalFloat,FloatBorder:FloatBorder',
--                 { scope = 'local', win = win }
--             )
--         end
--     end,
--     pattern = 'msg',
-- })

-- local msgs = require('vim._core.ui2.messages')
-- local ui2 = require('vim._core.ui2')
-- local orig_set_pos = msgs.set_pos
-- msgs.set_pos = function(tgt)
--     orig_set_pos(tgt)
--     if (tgt == 'msg' or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
--         pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
--             relative = 'editor',
--             anchor = 'SE',
--             row = 1,
--             col = vim.o.columns - 1,
--             border = 'rounded',
--         })
--     end
-- end
