local function fileinfo()
    local result = vim.opt.fileencoding:get()
    if vim.opt.bomb:get() then result = result .. '[BOM]' end
    result = result .. '[' .. vim.bo.fileformat .. ']'
    return result
end

require('lualine').setup({
    options = {
        component_separators = {
            left = '', -- '│',
            right = '', -- '│',
        },
        globalstatus = true,
        section_separators = {
            left = '',
            right = '',
        },
        theme = 'kanso',
    },
    sections = {
        lualine_a = {
            'mode',
        },
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
            'diagnostics',
            'filetype',
            fileinfo,
        },
        lualine_y = {
            'progress',
        },
        lualine_z = {
            'location',
        },
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' },
    },
})
