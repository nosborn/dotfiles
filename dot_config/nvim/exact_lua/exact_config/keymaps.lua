vim.keymap.set("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev({float = false})<CR>", { silent = true })
vim.keymap.set("n", "]d", "<Cmd>lua vim.diagnostic.goto_next({float = false})<CR>", { silent = true })

vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
