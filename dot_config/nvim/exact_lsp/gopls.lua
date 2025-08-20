vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('gopls', { clear = true }),
    pattern = '*.go',
    callback = function() vim.lsp.buf.format({ async = false }) end,
})

---@type vim.lsp.Config
return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            analyses = {
                ST1000 = false, -- Incorrect or missing package comment
                shadow = true,
                unusedparams = true,
            },
            -- codelenses = {
            --     generate = true,
            --     test = true,
            --     tidy = true,
            -- },
            gofumpt = true,
            hints = {
                assignVariableTypes = true,
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                constantValues = true,
                -- functionTypeParameters = true,
                parameterNames = true,
                -- rangeVariableTypes = true,
            },
            staticcheck = true,
        },
    },
}
