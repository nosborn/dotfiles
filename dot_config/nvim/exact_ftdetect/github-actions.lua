local group = vim.api.nvim_create_augroup('ftdetect_ghaction', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = group,
    pattern = { '*/.github*/workflows/*.yml', '*/.github*/workflows/*.yaml' },
    callback = function() vim.cmd('setfiletype yaml.ghaction') end,
})
