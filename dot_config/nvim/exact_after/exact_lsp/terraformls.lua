---@type vim.lsp.Config
return {
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
