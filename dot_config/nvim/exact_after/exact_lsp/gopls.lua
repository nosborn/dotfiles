---@type vim.lsp.Config
return {
    settings = {
        gopls = {
            -- analyses = {
            --     unusedparams = true,
            -- },
            gofumpt = true,
            staticcheck = true,
        },
    },
}
