---@type vim.lsp.Config
return {
    cmd = {
        'tflint',
        '--langserver',
    },
    filetypes = {
        'terraform',
    },
    root_markers = {
        '.git',
        '.terraform',
        '.tflint.hcl',
    },
}
