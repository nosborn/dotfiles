---@type vim.lsp.Config
return {
    cmd = {
        'terramate-ls',
    },
    filetypes = {
        'terramate',
    },
    root_markers = { -- order is significant
        'stack.tm.hcl',
        '.terraform',
        '.git',
    },
}
