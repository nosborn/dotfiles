return {
    cmd = {
        'gopls',
    },
    filetypes = {
        'go',
        'gomod',
        'gotmpl',
        'gowork',
    },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git'))
    end,
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
