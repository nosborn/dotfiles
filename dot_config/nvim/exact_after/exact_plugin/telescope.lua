require("telescope").setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_prefix = "❯",
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
})
