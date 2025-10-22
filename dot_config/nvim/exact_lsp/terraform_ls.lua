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
    -- init_options = {
    -- },
    root_markers = {
        '.git',
        '.terraform',
    },
}
