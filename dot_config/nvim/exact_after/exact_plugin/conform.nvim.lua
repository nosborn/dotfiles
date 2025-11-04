require('conform').setup({
    format_on_save = {
        lsp_format = 'never',
        timeout_ms = 500,
    },
    formatters = {
        alloy_fmt = {
            args = { 'fmt', '-' },
            command = 'alloy',
        },
        dockerfmt = {
            args = { '--newline' },
            command = 'dockerfmt',
        },
        hcledit_fmt = {
            args = { 'fmt' },
            command = 'hcledit',
        },
        shfmt = {
            prepend_args = { '-i', '2', '-ci' },
        },
        terramate_fmt = {
            args = { 'fmt', '-' },
            command = 'terramate',
        },
    },
    formatters_by_ft = {
        ansible = { 'ansible-lint' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        dockerfile = { 'dockerfmt' },
        esqlc = { 'clang-format' },
        h = { 'clang-format' },
        hcl = { 'hcledit_fmt' },
        -- html = { 'prettier' },
        javascript = { 'prettier' },
        lua = { 'stylua' },
        perl = { 'perltidy' },
        -- python = { 'black' },
        river = { 'alloy_fmt' },
        sh = { 'shfmt' },
        terramate = { 'terramate_fmt' },
        xml = { 'xmllint' },
        yaml = { 'yamlfmt' },
    },
})
