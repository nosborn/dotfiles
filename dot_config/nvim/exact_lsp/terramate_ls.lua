---@type vim.lsp.Config
return {
    cmd = {
        'terramate-ls',
    },
    filetypes = {
        'terramate',
    },
    root_markers = {
        '.git',
    },
}
