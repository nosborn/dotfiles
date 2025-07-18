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
        go = { 'goimports', 'gofmt' },
        h = { 'clang-format' },
        -- hcl = { 'packer_fmt' },
        lua = { 'stylua' },
        river = { 'alloy_fmt' },
        sh = { 'shfmt' },
        terraform = { 'terraform_fmt' },
        xml = { 'xmllint' },
        yaml = { 'yamlfmt' },
    },
})
