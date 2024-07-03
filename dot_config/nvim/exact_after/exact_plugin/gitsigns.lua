require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = vim.o.updatetime,
    ignore_whitespace = true,
    virt_text_pos = "right_align",
  },
  numhl = true,
})
