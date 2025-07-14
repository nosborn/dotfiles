require('lualine').setup({
    options = {
        component_separators = { left = '│', right = '│' },
        globalstatus = true,
        section_separators = { left = '', right = '' },
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
            'diagnostics',
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
                'encoding',
                show_bomb = true,
            },
            'fileformat',
            'filetype',
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
