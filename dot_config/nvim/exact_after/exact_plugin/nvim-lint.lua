-- require('lint').linters.ajv_yaml = {
--     cmd = 'sh',
--     args = { '-c', 'yq -o=json eval % | ajv validate -s /absolute/path/to/schema.json -d /dev/stdin' },
--     stdin = false,
--     stream = 'stderr',
--     parser = require('lint.parser').from_errorformat('%f: %l:%c %m', {
--         source = 'ajv',
--         severity = vim.diagnostic.severity.ERROR,
--     }),
--     ignore_exitcode = true,
-- }

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

require('lint').linters.kubeconform = {
    cmd = 'kubeconform',
    args = { '-strict', '-ignore-missing-schemas' },
    stdin = false,
    stream = 'stdout',
    parser = require('lint.parser').from_errorformat('%f:%l %m', {
        source = 'kubeconform',
        severity = vim.diagnostic.severity.ERROR,
    }),
    ignore_exitcode = true,
}

-- local revive = require('lint').linters.revive
-- revive.args = {
--     '-config',
--     vim.fn.getcwd() .. '/.revive.toml',
--     '-formatter',
--     'json',
-- }

-- require('lint').linters.spectral_k8s = {
--     cmd = 'spectral',
--     args = { 'lint', '--ruleset', vim.fn.expand('~/.config/spectral/kubernetes.yaml') },
--     stdin = false,
--     stream = 'stdout',
--     parser = require('lint.parser').from_errorformat('%f:%l:%c %m', {
--         source = 'spectral',
--         severity = vim.diagnostic.severity.WARN,
--     }),
--     ignore_exitcode = true,
-- }

-- require('lint').linters.yamale = {
--     cmd = 'yamale',
--     args = { '-s', '/absolute/path/to/schema.yaml' },
--     stdin = false,
--     stream = 'stderr',
--     parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
--         source = 'yamale',
--         severity = vim.diagnostic.severity.ERROR,
--     }),
--     ignore_exitcode = true,
-- }

require('lint').linters_by_ft = {
    ansible = { 'ansible-lint' },
    bash = { 'bash' },
    dockerfile = { 'hadolint' },
    dotenv = { 'dotenv_linter' },
    editorconfig = { 'editorconfig-checker' },
    ghaction = { 'actionlint' },
    html = { 'htmlhint', 'tidy' },
    json = { 'jsonlint' },
    k8s = { 'kubeconform' },
    lua = { 'luacheck' },
    make = { 'checkmake' },
    markdown = { 'markdownlint' },
    perl = { 'perlcritic' },
    river = { 'alloy_fmt' },
    sh = { 'shellcheck' },
    vim = { 'vint' },
    yaml = { 'yamllint' },
    zsh = { 'zsh' },
}

local dotenv_linter = require('lint').linters.dotenv_linter
dotenv_linter.args = { '--no-color', '--not-check-updates', '--quiet' }

-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = vim.api.nvim_create_augroup('plugin/lint', { clear = true }),
    callback = function()
        if vim.bo.modifiable then require('lint').try_lint() end
    end,
})
