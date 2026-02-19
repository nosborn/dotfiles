-- Ensure tflint processes are cleaned up when Neovim exits
-- tflint's language server doesn't properly handle shutdown notifications
vim.api.nvim_create_autocmd('VimLeavePre', {
    group = vim.api.nvim_create_augroup('tflint_cleanup', { clear = true }),
    callback = function()
        for _, client in ipairs(vim.lsp.get_clients({ name = 'tflint' })) do
            vim.lsp.stop_client(client.id, true) -- force stop
        end
    end,
})

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
        'stack.tm.hcl',
        '.tflint.hcl',
        '.terraform',
        '.git',
    },
    -- Aggressive cleanup for tflint's poor shutdown behavior
    detached = false, -- Run in same process group as nvim for automatic cleanup
    exit_timeout = 100, -- Only wait 100ms before force-killing
}
