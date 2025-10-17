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
        shfmt = {
            prepend_args = { '-i', '2', '-ci' },
        },
    },
    formatters_by_ft = {
        ansible = { 'ansible-lint' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        dockerfile = { 'dockerfmt' },
        esqlc = { 'clang-format' },
        h = { 'clang-format' },
        hcl = { 'packer_fmt' },
        -- html = { 'prettier' },
        javascript = { 'prettier' },
        lua = { 'stylua' },
        perl = { 'perltidy' },
        river = { 'alloy_fmt' },
        sh = { 'shfmt' },
        xml = { 'xmllint' },
        yaml = { 'yamlfmt' },
    },
})
