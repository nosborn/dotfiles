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
    on_attach = function(client, _bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    root_markers = {
        '.git',
        '.terraform',
    },
}
