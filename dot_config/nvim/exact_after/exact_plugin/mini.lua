require("mini.basics").setup({
  autocommands = {
    relnum_in_visual_mode = true,
  },
  options = {
    extra_ui = true,
  },
})

require("mini.clue").setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups.
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.marks(),
    require("mini.clue").gen_clues.registers(),
    require("mini.clue").gen_clues.windows(),
    require("mini.clue").gen_clues.z(),
  },
})

require("mini.comment").setup()

require("mini.diff").setup({
  view = {
    -- signs = {
    --   add = "┃",
    --   change = "┃",
    --   delete = "▒",
    -- },
    -- style = "sign",
  },
})

require("mini.extra").setup()

require("mini.git").setup()

require("mini.icons").setup()

require("mini.indentscope").setup()

require("mini.splitjoin").setup()

require("mini.statusline").setup()

-- require("mini.tabline").setup()

require("mini.visits").setup()
-- map("<Leader>vr", "Select recent (all)", true, 1)
-- map("<Leader>vR", "Select recent (cwd)", false, 1)
-- map("<Leader>vy", "Select frecent (all)", true, 0.5)
-- map("<Leader>vY", "Select frecent (cwd)", false, 0.5)
-- map("<Leader>vf", "Select frequent (all)", true, 0)
-- map("<Leader>vF", "Select frequent (cwd)", false, 0)
