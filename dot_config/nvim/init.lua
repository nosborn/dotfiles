-- vim.g.mapleader = " "

vim.o.autoindent = true
-- vim.o.clipboard = "unnamed,unnamedplus"
vim.o.cursorline = true
vim.o.expandtab = true
-- vim.o.laststatus = 2
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.number = true
vim.o.pumblend = 10 -- make builtin completion menus slightly transparent
vim.o.pumheight = 10 -- make popup menu smaller
-- vim.o.relativenumber = false
-- vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.signcolumn = 'yes'
vim.o.tabstop = 2
vim.o.spelllang = 'en_gb'
-- vim.o.spelloptions = "camel"
vim.o.undofile = false
-- vim.o.updatetime = 1000
vim.o.winblend = 10 -- make floating windows slightly transparent
--
-- vim.opt.complete:append("kspell")
-- vim.opt.iskeyword:append("-")
-- vim.opt.sessionoptions:remove('blank')
--
-- vim.o.path = vim.o.path .. ",**"
-- vim.o.tags = vim.o.tags .. ",/home/dosa/.config/nvim/tags"

vim.g.netrw_banner = 0

vim.diagnostic.config({
    -- severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
        },
    },
    -- underline = false,
    virtual_text = true,
})

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

require('moonfly')
vim.cmd('colorscheme moonfly')

require('fidget').setup()

require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        ignore_whitespace = false,
    },
    numhl = true,
    signcolumn = false,
    -- word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
})

require('ibl').setup({
    scope = {
        enabled = false,
    },
})

require('lualine').setup({
    options = {
        component_separators = { left = '│', right = '│' },
        globalstatus = true,
        section_separators = { left = '', right = '' },
    },
    sections = {
        -- lualine_a = {
        --   'mode',
        --   function()
        --     local schema = require('yaml-companion').get_buf_schema(0)
        --     if schema.result[1].name == 'none' then
        --       return 'none' -- FIXME
        --     end
        --     return schema.result[1].name
        --   end,
        -- },
        lualine_b = {
            {
                'branch',
                cond = function()
                    return vim.fn.winwidth(0) > 80
                end,
                icon = '',
            },
            {
                'diff',
                cond = function()
                    return vim.fn.winwidth(0) > 80
                end,
                symbols = {
                    added = ' ',
                    modified = ' ',
                    removed = ' ',
                },
            },
            'diagnostics',
        },
    },
})

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
require('null-ls').setup({
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false, bufnr = bufnr })
                end,
            })
        end
    end,
    sources = {
        require('none-ls.diagnostics.alloy_fmt'),
        require('none-ls.formatting.alloy_fmt'),
        require('none-ls.formatting.trim_newlines'),
        require('none-ls.formatting.trim_whitespace'),
        -- null_ls.builtins.completion.spell,
        require('null-ls.builtins.diagnostics.actionlint').with({
            filetypes = { 'yaml.github' },
        }),
        require('null-ls.builtins.diagnostics.ansiblelint'),
        require('null-ls.builtins.diagnostics.checkmake'),
        require('null-ls.builtins.diagnostics.editorconfig_checker').with({
            filetypes = { 'editorconfig' },
        }),
        require('null-ls.builtins.diagnostics.hadolint'),
        require('null-ls.builtins.diagnostics.markdownlint'),
        -- require("null-ls.builtins.diagnostics.rubocop"),
        require('null-ls.builtins.diagnostics.terraform_validate'),
        -- require("null-ls.builtins.diagnostics.trivy"),
        require('null-ls.builtins.diagnostics.vint'),
        require('null-ls.builtins.diagnostics.yamllint'),
        require('null-ls.builtins.diagnostics.zsh'),
        -- require("null-ls.builtins.formatting.black"),
        require('null-ls.builtins.formatting.clang_format'),
        require('null-ls.builtins.formatting.d2_fmt'),
        require('null-ls.builtins.formatting.markdownlint'),
        -- require("null-ls.builtins.formatting.nginx_beautifier"),
        require('null-ls.builtins.formatting.packer'),
        -- require("null-ls.builtins.formatting.prettier"),
        -- require("null-ls.builtins.formatting.shellharden"),
        require('null-ls.builtins.formatting.shfmt').with({
            extra_args = { '-i', '2', '-ci' },
        }),
        require('null-ls.builtins.formatting.stylua'),
        require('null-ls.builtins.formatting.terraform_fmt'),
        require('null-ls.builtins.formatting.xmllint'),
        require('null-ls.builtins.formatting.yamlfmt'),
    },
})

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
        additional_vim_regex_highlighting = {
            'ruby',
        },
        enable = true,
    },
    -- indent = { enable = true, disable = { "ruby" } },
})
require('nvim-treesitter.parsers').get_parser_configs().d2 = {
    filetype = 'd2',
    install_info = {
        files = {
            'src/parser.c',
            'src/scanner.cc',
        },
        revision = 'main',
        url = 'https://github.com/pleshevskiy/tree-sitter-d2',
    },
}
require('nvim-treesitter.parsers').get_parser_configs().river = {
    install_info = {
        branch = 'main',
        files = {
            'src/parser.c',
        },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
        url = 'https://github.com/grafana/tree-sitter-river.git',
    },
}

require('virt-column').setup({
    virtcolumn = '+1,80',
})

-- vim.lsp.enable({
--     -- "ansiblels",
--     -- "bashls",
--     -- "clangd",
--     -- "golangci_lint_ls",
--     -- "gopls",
--     "jsonls",
--     'lua_ls',
--     -- "pyright",
--     "terraformls",
--     "tflint",
--     -- "yamlls",
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

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- -- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })
-- --
-- -- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- -- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- -- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- -- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- --
-- -- vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
-- -- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
-- -- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
-- -- vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })
--
-- -- vim.api.nvim_create_autocmd('LspAttach', {
-- --   callback = function(ev)
-- --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- --     if client:supports_method('textDocument/completion') then
-- --       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- --     end
-- --   end,
-- -- })
