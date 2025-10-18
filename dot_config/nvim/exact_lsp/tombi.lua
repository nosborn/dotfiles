---@type vim.lsp.Config
return {
    cmd = {
        'tombi',
        'lsp',
    },
    filetypes = {
        'toml',
    },
    root_markers = {
        '.git',
        'pyproject.toml',
        'tombi.toml',
    },
}
