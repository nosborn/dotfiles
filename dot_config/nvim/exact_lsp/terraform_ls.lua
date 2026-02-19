---@type vim.lsp.Config
return {
    cmd = {
        'terraform-ls',
        'serve',
        '-log-file=/dev/null',
    },
    filetypes = {
        'terraform',
        'terraform-vars',
    },
    init_options = {
        experimentalFeatures = {
            prefillRequiredFields = true,
        },
        indexing = {
            ignoreDirectoryNames = {
                '.github',
                'builds',
            },
        },
    },
    root_markers = { -- order is significant
        'stack.tm.hcl',
        '.terraform',
        '.git',
    },
}
