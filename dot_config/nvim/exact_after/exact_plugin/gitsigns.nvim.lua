require('gitsigns').setup({
    -- current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,
        ignore_whitespace = false,
        watch_gitdir = {
            follow_files = true,
            interval = 1000,
        },
    },
    -- word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
})
