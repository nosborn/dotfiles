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
            validateOnSave = true,
        },
    },
    root_markers = {
        '.git',
        '.terraform',
    },
}
