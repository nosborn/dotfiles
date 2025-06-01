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
    dockerfile = { 'hadolint' },
    editorconfig = { 'editorconfig-checker' },
    github = { 'actionlint' },
    json = { 'jsonlint' },
    -- lua = { 'luacheck' },
    make = { 'checkmake' },
    markdown = { 'markdownlint' },
    river = { 'alloy_fmt' },
    sh = { 'shellcheck' },
    vim = { 'vint' },
    yaml = { 'yamllint' },
    zsh = { 'zsh' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = vim.api.nvim_create_augroup('plugin/lint', { clear = true }),
    callback = function()
        if vim.bo.modifiable then require('lint').try_lint() end
    end,
})
