local group = vim.api.nvim_create_augroup('gopls', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    pattern = '*.go',
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { 'source.organizeImports' } }
        local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})

return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.sum' },
    settings = {
        gopls = {
            -- Build
            -- Formatting
            gofumpt = true,
            -- UI
            --codelenses = {
            --    generate = true,
            --    test = true,
            --    tidy = true,
            --},
            -- Completion
            -- Diagnostic
            --analyses = {
            --    --ST1000 = false, -- Incorrect or missing package comment
            --},
            --staticcheck = true,
            -- Documentation
            -- Inlayhint
            hints = {
                constantValues = true,
                parameterNames = true,
            },
            -- Navigation
        },
    },
}
