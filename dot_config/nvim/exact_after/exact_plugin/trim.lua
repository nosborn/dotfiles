require('trim').setup({
    ft_blocklist = {
        'python',
        'text',
    },

    patterns = {
        [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
    },
})
