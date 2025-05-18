-- luacheck: globals vim

-- -- vim.g.mapleader = " "

vim.o.autoindent = true
-- -- vim.o.clipboard = "unnamed,unnamedplus"
vim.o.cursorline = true
vim.o.expandtab = true
-- -- Lua initialization file
-- vim.o.fillchars = 'horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┨,vertright:┣,verthoriz:╋'
-- -- vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- -- vim.o.foldmethod = 'expr'
-- -- vim.o.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.o.guicursor = 'n-v-i-c:block-Cursor'
vim.o.ignorecase = true
-- vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.number = true
-- -- vim.o.pumblend = 10 -- make builtin completion menus slightly transparent
-- -- vim.o.pumheight = 10 -- make popup menu smaller
vim.o.relativenumber = true
-- -- vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
-- vim.o.spelllang = 'en_gb'
-- -- vim.o.spelloptions = "camel"
vim.o.tabstop = 2
-- vim.o.undofile = false
-- -- vim.o.updatetime = 1000
-- -- vim.o.winblend = 10 -- make floating windows slightly transparent
-- -- vim.o.winborder = 'bold'
-- vim.o.winhighlight = 'NormalNC:CursorLine'
--
-- vim.g.health = { style = 'float' }
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.moonflyCursorColor = true
-- vim.g.moonflyNormalFloat = true
vim.g.moonflyWinSeparator = 2
vim.g.netrw_banner = 0

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- vim.keymap.set('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true })

-- vim.notify = require('notify')

vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('color-scheme', { clear = true }),
    pattern = 'moonfly',
    callback = function()
        vim.api.nvim_set_hl(
            0,
            'CursorLineNr',
            vim.tbl_deep_extend(
                'force',
                vim.api.nvim_get_hl(0, { name = 'CursorLineNr' }),
                { fg = require('moonfly').palette.orange }
            )
        )
        -- vim.api.nvim_set_hl(0, 'NoiceCmdlineBorder', { link = 'Normal' })
    end,
})
require('moonfly')
vim.cmd('colorscheme moonfly')

require('conform').setup({
    format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
    },
    formatters = {
        alloy_fmt = {
            args = { 'fmt', '-' },
            command = 'alloy',
        },
        dockerfmt = {
            args = { '$FILENAME', '--newline' },
            command = 'dockerfmt',
            stdin = false,
        },
        shfmt = {
            prepend_args = { '-i', '2', '-ci' },
        },
    },
    formatters_by_ft = {
        -- ansible = { 'ansible-lint' },
        dockerfile = { 'dockerfmt' },
        hcl = { 'packer_fmt' },
        lua = { 'stylua' },
        river = { 'alloy_fmt' },
        sh = { 'shfmt' },
        terraform = { 'terraform_fmt' },
        xml = { 'xmllint' },
    },
})

require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        ignore_whitespace = false,
    },
    -- word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
})

require('lint').linters.alloy_fmt = {
    cmd = 'alloy',
    args = { 'fmt', '--test', '-' },
    stream = 'stderr',
    parser = require('lint.parser').from_pattern(
        ':(%d+):(%d+): (.+)',
        { 'lnum', 'col', 'message' },
        {},
        { severity = vim.diagnostic.severity.ERROR, source = 'alloy_fmt' }
    ),
}
require('lint').linters_by_ft = {
    ansible = { 'ansible_lint' },
    dockerfile = { 'hadolint' },
    editorconfig = { 'editorconfig-checker' },
    github = { 'actionlint' },
    json = { 'jsonlint' },
    lua = { 'luacheck' },
    make = { 'checkmake' },
    markdown = { 'markdownlint' },
    river = { 'alloy_fmt' },
    sh = { 'shellcheck' },
    terraform = { 'tflint', 'trivy' },
    vim = { 'vint' },
    yaml = { 'yamllint' },
    zsh = { 'zsh' },
}
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufWritePost', 'InsertLeave' }, {
    callback = function()
        require('lint').try_lint()
    end,
})

require('lualine').setup({
    options = {
        component_separators = { left = '│', right = '│' },
        globalstatus = true,
        section_separators = { left = '', right = '' },
        theme = 'moonfly',
    },
    sections = {
        lualine_a = {
            'mode',
        },
        lualine_b = {
            {
                'branch',
                icon = '',
            },
            {
                'diff',
                symbols = {
                    added = ' ',
                    modified = ' ',
                    removed = ' ',
                },
            },
            'diagnostics',
        },
        lualine_c = {
            {
                'filename',
                path = 1,
                symbols = {
                    modified = '●',
                    readonly = '',
                },
            },
        },
        lualine_x = {
            {
                'encoding',
                show_bomb = true,
            },
            'fileformat',
            'filetype',
        },
        lualine_y = {
            'progress',
        },
        lualine_z = {
            -- {
            --     'searchcount',
            --     maxcount = 999,
            --     timeout = 500,
            -- },
            'location',
            'lint_progress',
        },
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                show_filename_only = false,
                mode = 2,
            },
        },
    },
})

local mini_clue = require('mini.clue')
mini_clue.setup({
    clues = {
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers(),
        mini_clue.gen_clues.windows(),
        mini_clue.gen_clues.z(),
    },
    triggers = {
        { mode = 'c', keys = '<C-r>' }, -- registers
        { mode = 'i', keys = '<C-r>' }, -- registers
        { mode = 'i', keys = '<C-x>' }, -- built-in completion
        { mode = 'n', keys = "'" }, -- marks
        { mode = 'n', keys = '"' }, -- registers
        { mode = 'n', keys = '<C-w>' }, -- window commands
        { mode = 'n', keys = '<Leader>' }, -- leader triggers
        { mode = 'n', keys = '`' }, -- marks
        { mode = 'n', keys = 'g' }, -- `g` key
        { mode = 'n', keys = 'z' }, -- `z` key
        { mode = 'x', keys = "'" }, -- marks
        { mode = 'x', keys = '"' }, -- registers
        { mode = 'x', keys = '<Leader>' }, -- leader triggers
        { mode = 'x', keys = '`' }, -- marks
        { mode = 'x', keys = 'g' }, -- `g` key
        { mode = 'x', keys = 'z' }, -- `z` key
    },
})

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons() -- luacheck: globals MiniIcons

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'git_config',
        'gotmpl',
        'html',
        'ini',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'ruby',
        'terraform',
        'toml',
        'yaml',
    },
    highlight = {
        -- additional_vim_regex_highlighting = {
        --     'ruby',
        -- },
        enable = true,
    },
    indent = {
        enable = true,
    },
})
require('nvim-treesitter.parsers').get_parser_configs().d2 = {
    filetype = 'd2',
    install_info = {
        files = { 'src/parser.c', 'src/scanner.cc' },
        revision = 'main',
        url = 'https://github.com/pleshevskiy/tree-sitter-d2',
    },
}
require('nvim-treesitter.parsers').get_parser_configs().river = {
    install_info = {
        branch = 'main',
        files = { 'src/parser.c' },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
        url = 'https://github.com/grafana/tree-sitter-river.git',
    },
}

-- require('which-key').setup({
--     preset = 'helix',
-- })

vim.diagnostic.config({
    -- severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
        },
    },
    -- underline = false,
    virtual_text = true,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
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
-- -- require('mini.statusline').setup()
--
-- require('noice').setup({
--     cmdline = {
--         view = 'cmdline',
--     },
--     lsp = {
--         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--         override = {
--             -- ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
--             ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
--             ['vim.lsp.util.stylize_markdown'] = true,
--         },
--     },
--     -- you can enable a preset for easier configuration
--     presets = {
--         bottom_search = true, -- use a classic bottom cmdline for search
--         -- command_palette = true, -- position the cmdline and popupmenu together
--         inc_rename = false, -- enables an input dialog for inc-rename.nvim
--         long_message_to_split = true, -- long messages will be sent to a split
--         lsp_doc_border = false, -- add a border to hover docs and signature help
--     },
--     win_options = {
--         winhighlight = {
--             FloatBorder = 'DiagnosticInfo',
--             Normal = 'Normal',
--         },
--     },
-- })

require('snacks').setup({
    indent = {
        animate = {
            enabled = false,
        },
    },
})

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
--
-- if vim.fn.executable('ansible-vault') == 1 then
--     vim.cmd([[
--         function AnsibleVaultDecrypt()
--             let s:header = split(getline(1), ';')
--             let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
--             silent %!ansible-vault decrypt
--         endfunction
--
--         function AnsibleVaultEncrypt()
--             execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
--         endfunction
--
--         augroup ansible-vault
--             autocmd!
--             autocmd BufReadPre,FileReadPre */group_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
--             autocmd BufReadPre,FileReadPre */host_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
--             autocmd BufReadPre,FileReadPre */vars/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
--             autocmd BufReadPost,FileReadPost */group_vars/*/vault.yaml call AnsibleVaultDecrypt()
--             autocmd BufReadPost,FileReadPost */host_vars/*/vault.yaml call AnsibleVaultDecrypt()
--             autocmd BufReadPost,FileReadPost */vars/vault.yaml call AnsibleVaultDecrypt()
--             autocmd BufWritePre,FileWritePre */group_vars/*/vault.yaml call AnsibleVaultEncrypt()
--             autocmd BufWritePre,FileWritePre */host_vars/*/vault.yaml call AnsibleVaultEncrypt()
--             autocmd BufWritePre,FileWritePre */vars/vault.yaml call AnsibleVaultEncrypt()
--             autocmd BufWritePost,FileWritePost */group_vars/*/vault.yaml silent undo
--             autocmd BufWritePost,FileWritePost */host_vars/*/vault.yaml silent undo
--             autocmd BufWritePost,FileWritePost */vars/vault.yaml silent undo
--         augroup END
--     ]])
-- end
--
-- -- vim.api.nvim_create_autocmd({ 'VimEnter' }, {
-- --     group = vim.api.nvim_create_augroup('file-explorer', { clear = true }),
-- --     callback = function()
-- --         Snacks.explorer.open()
-- --     end,
-- -- })

-- -- -- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })
-- -- --
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })
