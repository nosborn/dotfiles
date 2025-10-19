local function fileinfo()
    local result = vim.bo.fileencoding
    if vim.bo.bomb then result = result .. '[BOM]' end
    result = result .. '[' .. vim.bo.fileformat .. ']'
    return result
end

require('lualine').setup({
    options = {
        component_separators = {
            left = '',
            right = '',
        },
        globalstatus = true,
        section_separators = {
            left = '',
            right = '',
        },
        theme = 'kanso',
    },
    sections = {
        lualine_b = {
            {
                'branch',
                icon = '',
            },
            {
                'diff',
                symbols = {
                    added = ' ',
                    modified = ' ',
                    removed = ' ',
                },
            },
        },
        lualine_c = {
            {
                'filename',
                path = 1,
                symbols = {
                    modified = '●',
                    readonly = '',
                },
            },
        },
        lualine_x = {
            {
                'lsp_status',
                -- ignore_lsp = {},
                symbols = {
                    separator = ',',
                },
            },
            'diagnostics',
            'filetype',
            fileinfo,
        },
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
