require('mini.bracketed').setup()
require('mini.bufremove').setup()

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
        { mode = 'c', keys = '<C-r>' }, -- Registers
        { mode = 'i', keys = '<C-r>' }, -- Registers
        { mode = 'i', keys = '<C-x>' }, -- Built-in completion
        { mode = 'n', keys = "'" }, -- Marks
        { mode = 'n', keys = '"' }, -- Registers
        { mode = 'n', keys = '<C-w>' }, -- window commands
        { mode = 'n', keys = '<Leader>' }, -- Leader trigger
        { mode = 'n', keys = '[' }, -- mini.bracketed
        { mode = 'n', keys = '\\' }, -- mini.basics
        { mode = 'n', keys = ']' }, -- mini.bracketed
        { mode = 'n', keys = '`' }, -- Marks
        { mode = 'n', keys = 'g' }, -- `g` key
        { mode = 'n', keys = 'z' }, -- `z` key
        { mode = 'x', keys = "'" }, -- Marks
        { mode = 'x', keys = '"' }, -- Registers
        { mode = 'x', keys = '<Leader>' }, -- Leader trigger
        { mode = 'x', keys = '[' }, -- mini.bracketed
        { mode = 'x', keys = ']' }, -- mini.bracketed
        { mode = 'x', keys = '`' }, -- Marks
        { mode = 'x', keys = 'g' }, -- `g` key
        { mode = 'x', keys = 'z' }, -- `z` key
    },
    window = {
        delay = 500,
    },
})

require('mini.comment').setup()

-- luacheck: globals MiniCompletion
require('mini.completion').setup({
    lsp_completion = {
        auto_setup = false,
        process_items = function(items, base)
            return MiniCompletion.default_process_items(items, base, {
                kind_priority = {
                    Snippet = 99,
                    Text = -1,
                },
            })
        end,
        source_func = 'omnifunc',
    },
})
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('mini-completion-lsp-attach', { clear = true }),
    callback = function(ev) vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp' end,
    desc = "Set 'omnifunc'",
})
vim.lsp.config('*', {
    capabilities = MiniCompletion.get_lsp_capabilities(),
})

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
local icons_ext3_blocklist = { scm = true, txt = true, yml = true }
local icons_ext4_blocklist = { json = true, yaml = true }
require('mini.icons').setup({
    file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
    },
    filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
    },
    use_file_extension = function(ext, _)
        return not (icons_ext3_blocklist[ext:sub(-3)] or icons_ext4_blocklist[ext:sub(-4)])
    end,
})
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()

-- require('mini.indentscope').setup({
--     draw = {
--         animation = require('mini.indentscope').gen_animation.none(),
--     },
-- })

-- luacheck: globals MiniKeymap
require('mini.keymap').setup()
MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
MiniKeymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next' })

-- luacheck: globals MiniMisc
require('mini.misc').setup()
MiniMisc.setup_auto_root()
-- MiniMisc.setup_restore_cursor()
MiniMisc.setup_termbg_sync()

require('mini.notify').setup()

-- luacheck: globals MiniPick
require('mini.pick').setup()
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Pick from buffers' })
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Pick from files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Pick from pattern matches with live feedback' })
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, { desc = 'Pick from help tagss' })

-- require('mini.snippets').setup()
require('mini.tabline').setup()
