if vim.g.did_load_filetypes then return end

local group = vim.api.nvim_create_augroup('filetypedetect', { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '*.alloy',
    callback = function() vim.bo.filetype = 'river' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '*.env',
    callback = function()
        vim.bo.filetype = 'dotenv'
        vim.bo.syntax = 'sh'
    end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '*.ini.j2',
    callback = function() vim.bo.filetype = 'dosini.jinja2' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '*.json.j2',
    callback = function() vim.bo.filetype = 'json.jinja2' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = { '*.yaml.j2', '*.yml.j2' },
    callback = function() vim.bo.filetype = 'yaml.jinja2' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.chezmoiignore',
    callback = function() vim.bo.filetype = 'gitignore' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.envrc.ignore',
    callback = function() vim.bo.filetype = 'direnv' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.markdownlintignore',
    callback = function() vim.bo.filetype = 'gitignore' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.markdownlintrc',
    callback = function() vim.bo.filetype = 'json' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.prettierignore',
    callback = function() vim.bo.filetype = 'gitignore' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.prettierrc',
    callback = function() vim.bo.filetype = 'yaml' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '.yamllint',
    callback = function() vim.bo.filetype = 'yaml' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'CODEOWNERS',
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'ansible-lint',
    callback = function() vim.bo.filetype = 'yaml' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'dot_editorconfig',
    callback = function() vim.bo.filetype = 'editorconfig' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'tsconfig.json',
    callback = function() vim.bo.filetype = 'jsonc' end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'unbound.conf.d/*.conf.j2',
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = 'unbound.conf.j2',
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end,
})
