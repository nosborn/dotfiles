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
    ansible = { 'ansible_lint' },
    bash = { 'bash' },
    dockerfile = { 'hadolint' },
    dotenv = { 'dotenv_linter' },
    editorconfig = { 'editorconfig-checker' },
    ghaction = { 'actionlint' },
    html = { 'htmlhint', 'tidy' },
    json = { 'jsonlint' },
    lua = { 'luacheck' },
    make = { 'checkmake' },
    markdown = { 'markdownlint' },
    perl = { 'perlcritic' },
    river = { 'alloy_fmt' },
    sh = { 'shellcheck' },
    -- terraform = { 'tflint' },
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
