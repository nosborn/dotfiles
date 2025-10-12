vim.api.nvim_create_autocmd('BufRead', {
    pattern = { '*.yaml', '*.yml' },
    callback = function()
        if vim.fn.search('apiVersion: ', 'nw') ~= 0 then vim.bo.filetype = 'yaml.kubernetes' end
    end,
})
