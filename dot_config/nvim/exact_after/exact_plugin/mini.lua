require('mini.bracketed').setup()

local mini_clue = require('mini.clue')
mini_clue.setup({
    clues = {
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers({ show_contents = true }),
        mini_clue.gen_clues.windows({ submode_resize = true }),
        mini_clue.gen_clues.z(),
    },
    triggers = {
        { mode = 'c', keys = '<C-r>' }, -- registers
        { mode = 'i', keys = '<C-r>' }, -- registers
        { mode = 'i', keys = '<C-x>' }, -- built-in completion
        { mode = 'n', keys = "'" }, -- marks
        { mode = 'n', keys = '"' }, -- registers
        { mode = 'n', keys = '<C-w>' }, -- window commands
        { mode = 'n', keys = '<Leader>' }, -- leader triggers
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '`' }, -- marks
        { mode = 'n', keys = 'g' }, -- `g` key
        { mode = 'n', keys = 'z' }, -- `z` key
        { mode = 'x', keys = "'" }, -- marks
        { mode = 'x', keys = '"' }, -- registers
        { mode = 'x', keys = '<Leader>' }, -- leader triggers
        { mode = 'x', keys = '`' }, -- marks
        { mode = 'x', keys = 'g' }, -- `g` key
        { mode = 'x', keys = 'z' }, -- `z` key
    },
    window = {
        delay = 500,
    },
})

require('mini.completion').setup()

-- require('mini.cursorword').setup()

require('mini.diff').setup()

require('mini.git').setup()

-- local mini_hipatterns = require('mini.hipatterns')
-- mini_hipatterns.setup({
--     highlighters = {
--         fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
--         hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
--         hex_color = mini_hipatterns.gen_highlighter.hex_color(),
--         note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
--         todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
--     },
-- })
--

-- luacheck: globals MiniIcons
require('mini.icons').setup({
    file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
    },
    filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
    },
})
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()

-- luacheck: globals MiniPick
require('mini.pick').setup()
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Pick from buffers' })
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Pick from files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Pick from pattern matches with live feedback' })
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, { desc = 'Pick from help tagss' })

-- require('mini.snippets').setup()
-- require('mini.statusline').setup()
