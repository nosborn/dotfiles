---@type vim.lsp.Config
return {
    cmd = {
        'terraform-ls',
        'serve',
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
    root_markers = {
        '.git',
        '.terraform',
    },
}
