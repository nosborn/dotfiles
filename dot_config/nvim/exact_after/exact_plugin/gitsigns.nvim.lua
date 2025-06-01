require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,
        ignore_whitespace = false,
    },
    -- word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
})
