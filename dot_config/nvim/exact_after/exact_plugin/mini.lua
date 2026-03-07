local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
    vim.keymap.set('x', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- b is for 'Buffer'
local new_scratch_buffer = function()
    vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end
nmap_leader('ba', '<Cmd>b#<CR>', 'Alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>', 'Delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>', 'Delete!')
nmap_leader('bs', new_scratch_buffer, 'Scratch')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>', 'Wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'Wipeout!')

-- e is for 'Explore' and 'Edit'
local explore_at_file = '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>'
local explore_quickfix = function()
    vim.cmd(vim.fn.getqflist({ winid = true }).winid ~= 0 and 'cclose' or 'copen')
end
local explore_locations = function()
    vim.cmd(vim.fn.getloclist(0, { winid = true }).winid ~= 0 and 'lclose' or 'lopen')
end
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>', 'Directory')
nmap_leader('ef', explore_at_file, 'File directory')
-- nmap_leader('ei', '<Cmd>edit $MYVIMRC<CR>', 'init.lua')
-- nmap_leader('ek', edit_plugin_file('20_keymaps.lua'), 'Keymaps config')
-- nmap_leader('em', edit_plugin_file('30_mini.lua'), 'MINI config')
nmap_leader('en', '<Cmd>lua MiniNotify.show_history()<CR>', 'Notifications')
-- nmap_leader('eo', edit_plugin_file('10_options.lua'), 'Options config')
-- nmap_leader('ep', edit_plugin_file('40_plugins.lua'), 'Plugins config')
nmap_leader('eq', explore_quickfix, 'Quickfix list')
nmap_leader('eQ', explore_locations, 'Location list')

-- f is for 'Fuzzy Find'
local pick_added_hunks_buf = '<Cmd>Pick git_hunks path="%" scope="staged"<CR>'
local pick_workspace_symbols_live = '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>'
nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>', 'Added hunks (all)')
nmap_leader('fA', pick_added_hunks_buf, 'Added hunks (buf)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>', 'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>', 'Commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>', 'Commits (buf)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>', 'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap_leader('fH', '<Cmd>Pick hl_groups<CR>', 'Highlight groups')
nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>', 'Lines (all)')
nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>', 'Lines (buf)')
nmap_leader('fm', '<Cmd>Pick git_hunks<CR>', 'Modified hunks (all)')
nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>', 'Modified hunks (buf)')
nmap_leader('fr', '<Cmd>Pick resume<CR>', 'Resume')
nmap_leader('fR', '<Cmd>Pick lsp scope="references"<CR>', 'References (LSP)')
nmap_leader('fs', pick_workspace_symbols_live, 'Symbols workspace (live)')
nmap_leader('fS', '<Cmd>Pick lsp scope="document_symbol"<CR>', 'Symbols document')
nmap_leader('fv', '<Cmd>Pick visit_paths cwd=""<CR>', 'Visit paths (all)')
nmap_leader('fV', '<Cmd>Pick visit_paths<CR>', 'Visit paths (cwd)')

-- g is for 'Git'
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf_cmd = git_log_cmd .. ' --follow -- %'
nmap_leader('ga', '<Cmd>Git diff --cached<CR>', 'Added diff')
nmap_leader('gA', '<Cmd>Git diff --cached -- %<CR>', 'Added diff buffer')
nmap_leader('gc', '<Cmd>Git commit<CR>', 'Commit')
nmap_leader('gC', '<Cmd>Git commit --amend<CR>', 'Commit amend')
nmap_leader('gd', '<Cmd>Git diff<CR>', 'Diff')
nmap_leader('gD', '<Cmd>Git diff -- %<CR>', 'Diff buffer')
nmap_leader('gl', '<Cmd>' .. git_log_cmd .. '<CR>', 'Log')
nmap_leader('gL', '<Cmd>' .. git_log_buf_cmd .. '<CR>', 'Log buffer')
nmap_leader('go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>', 'Toggle overlay')
nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>', 'Show at cursor')
xmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>', 'Show at selection')

-- l is for 'Language'
nmap_leader('la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Actions')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic popup')
nmap_leader('lf', '<Cmd>lua require("conform").format()<CR>', 'Format')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
nmap_leader('lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>', 'References')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Source definition')
nmap_leader('lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')
xmap_leader('lf', '<Cmd>lua require("conform").format()<CR>', 'Format selection')

-- m is for 'Map'
nmap_leader('mf', '<Cmd>lua MiniMap.toggle_focus()<CR>', 'Focus (toggle)')
nmap_leader('mr', '<Cmd>lua MiniMap.refresh()<CR>', 'Refresh')
nmap_leader('ms', '<Cmd>lua MiniMap.toggle_side()<CR>', 'Side (toggle)')
nmap_leader('mt', '<Cmd>lua MiniMap.toggle()<CR>', 'Toggle')

-- o is for 'Other'
nmap_leader('or', '<Cmd>lua MiniMisc.resize_window()<CR>', 'Resize to default width')
nmap_leader('ot', '<Cmd>lua MiniTrailspace.trim()<CR>', 'Trim trailspace')
nmap_leader('oz', '<Cmd>lua MiniMisc.zoom()<CR>', 'Zoom toggle')

-- s is for 'Session'
local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'
nmap_leader('sd', '<Cmd>lua MiniSessions.select("delete")<CR>', 'Delete')
nmap_leader('sn', '<Cmd>lua ' .. session_new .. '<CR>', 'New')
nmap_leader('sr', '<Cmd>lua MiniSessions.select("read")<CR>', 'Read')
nmap_leader('sw', '<Cmd>lua MiniSessions.write()<CR>', 'Write current')

-- t is for 'Terminal'
nmap_leader('tT', '<Cmd>horizontal term<CR>', 'Terminal (horizontal)')
nmap_leader('tt', '<Cmd>vertical term<CR>', 'Terminal (vertical)')

-- v is for 'Visits'
local make_pick_core = function(cwd, desc)
    return function()
        -- luacheck: globals MiniExtra MiniVisits
        local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
        local local_opts = { cwd = cwd, filter = 'core', sort = sort_latest }
        MiniExtra.pickers.visit_paths(local_opts, { source = { name = desc } })
    end
end
nmap_leader('vc', make_pick_core('', 'Core visits (all)'), 'Core visits (all)')
nmap_leader('vC', make_pick_core(nil, 'Core visits (cwd)'), 'Core visits (cwd)')
nmap_leader('vv', '<Cmd>lua MiniVisits.add_label("core")<CR>', 'Add "core" label')
nmap_leader('vV', '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')
nmap_leader('vl', '<Cmd>lua MiniVisits.add_label()<CR>', 'Add label')
nmap_leader('vL', '<Cmd>lua MiniVisits.remove_label()<CR>', 'Remove label')

require('mini.basics').setup({
    options = {
        basic = false,
    },
    mappings = {
        move_with_alt = true, -- Create `<M-hjkl>` mappings for navigation in Insert and Command modes
        windows = true, -- Create `<C-hjkl>` mappings for window navigation
    },
})

require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.cmdline').setup()

require('mini.clue').setup({
    clues = {
        {
            { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
            { mode = 'n', keys = '<Leader>e', desc = '+Explore/Edit' },
            { mode = 'n', keys = '<Leader>f', desc = '+Find' },
            { mode = 'n', keys = '<Leader>g', desc = '+Git' },
            { mode = 'n', keys = '<Leader>l', desc = '+Language' },
            { mode = 'n', keys = '<Leader>m', desc = '+Map' },
            { mode = 'n', keys = '<Leader>o', desc = '+Other' },
            { mode = 'n', keys = '<Leader>s', desc = '+Session' },
            { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
            { mode = 'n', keys = '<Leader>v', desc = '+Visits' },
            { mode = 'x', keys = '<Leader>g', desc = '+Git' },
            { mode = 'x', keys = '<Leader>l', desc = '+Language' },
        },
        require('mini.clue').gen_clues.builtin_completion(),
        require('mini.clue').gen_clues.g(),
        require('mini.clue').gen_clues.marks(),
        require('mini.clue').gen_clues.registers(),
        require('mini.clue').gen_clues.square_brackets(),
        require('mini.clue').gen_clues.windows({ submode_resize = true }),
        require('mini.clue').gen_clues.z(),
    },
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
        { mode = 'n', keys = '\\' }, -- mini.basics
        { mode = { 'n', 'x' }, keys = '[' }, -- mini.bracketed
        { mode = { 'n', 'x' }, keys = ']' },
        { mode = 'i', keys = '<C-x>' }, -- Built-in completion
        { mode = { 'n', 'x' }, keys = 'g' }, -- `g` key
        { mode = { 'n', 'x' }, keys = "'" }, -- Marks
        { mode = { 'n', 'x' }, keys = '`' },
        { mode = { 'n', 'x' }, keys = '"' }, -- Registers
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        { mode = 'n', keys = '<C-w>' }, -- Window commands
        { mode = { 'n', 'x' }, keys = 's' }, -- `s` key (mini.surround, etc.)
        { mode = { 'n', 'x' }, keys = 'z' }, -- `z` key
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
            local opts = { kind_priority = { Text = -1, Snippet = 99 } }
            return MiniCompletion.default_process_items(items, base, opts)
        end,
        source_func = 'omnifunc',
    },
})
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('mini-completion-lsp-attach', { clear = true }),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
    end,
    desc = "Set 'omnifunc'",
})
vim.lsp.config('*', {
    capabilities = MiniCompletion.get_lsp_capabilities(),
})

-- require('mini.cursorword').setup()
require('mini.diff').setup()
require('mini.extra').setup()

require('mini.files').setup({
    windows = {
        preview = true,
    },
})
vim.api.nvim_create_autocmd('User', {
    -- luacheck: globals MiniFiles
    group = vim.api.nvim_create_augroup('mini-completion-lsp-attach', { clear = true }),
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
        -- MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
        -- local minideps_plugins = vim.fn.stdpath('data') .. '/site/pack/deps/opt'
        -- MiniFiles.set_bookmark('p', minideps_plugins, { desc = 'Plugins' })
        MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
    end,
    desc = 'Add bookmarks',
})

require('mini.git').setup()

require('mini.hipatterns').setup({
    highlighters = {
        fixme = require('mini.extra').gen_highlighter.words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
        hack = require('mini.extra').gen_highlighter.words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
        todo = require('mini.extra').gen_highlighter.words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
        note = require('mini.extra').gen_highlighter.words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
    },
})

-- luacheck: globals MiniIcons
require('mini.icons').setup({
    file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
    },
    filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
    },
    use_file_extension = function(ext, _)
        local icons_ext3_blocklist = { scm = true, txt = true, yml = true }
        local icons_ext4_blocklist = { json = true, yaml = true }
        return not (icons_ext3_blocklist[ext:sub(-3)] or icons_ext4_blocklist[ext:sub(-4)])
    end,
})
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()

require('mini.indentscope').setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none(),
    },
})

-- luacheck: globals MiniKeymap
require('mini.keymap').setup()
-- MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
MiniKeymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next' })

require('mini.map').setup({
    integrations = {
        require('mini.map').gen_integration.builtin_search(),
        require('mini.map').gen_integration.diagnostic(),
        require('mini.map').gen_integration.diff(),
    },
    symbols = {
        encode = require('mini.map').gen_encode_symbols.dot('4x2'),
    },
})
for _, key in ipairs({ 'n', 'N', '*', '#' }) do
    local rhs = key
        -- Also open enough folds when jumping to the next match
        .. 'zv'
        .. '<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>'
    vim.keymap.set('n', key, rhs)
end

-- luacheck: globals MiniMisc
require('mini.misc').setup()
MiniMisc.setup_auto_root()
-- MiniMisc.setup_restore_cursor()
MiniMisc.setup_termbg_sync()

require('mini.move').setup()
require('mini.notify').setup()
-- require('mini.pairs').setup()

-- luacheck: globals MiniPick
require('mini.pick').setup()
vim.keymap.set('n', '<Leader>f/', '<Cmd>Pick history scope="/"<CR>', { desc = '"/" history' })
vim.keymap.set('n', '<Leader>f:', '<Cmd>Pick history scope=":"<CR>', { desc = '":" history' })
vim.keymap.set('n', '<Leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>', { desc = 'Added hunks (all)' })
vim.keymap.set('n', '<Leader>fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', { desc = 'Added hunks (buf)' })
vim.keymap.set('n', '<Leader>fb', '<Cmd>Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<Leader>fc', '<Cmd>Pick git_commits<CR>', { desc = 'Commits (all)' })
vim.keymap.set('n', '<Leader>fC', '<Cmd>Pick git_commits path="%"<CR>', { desc = 'Commits (buf)' })
vim.keymap.set('n', '<Leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>', { desc = 'Diagnostic workspace' })
vim.keymap.set('n', '<Leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>', { desc = 'Diagnostic buffer' })
vim.keymap.set('n', '<Leader>ff', '<Cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<Leader>fg', '<Cmd>Pick grep_live<CR>', { desc = 'Grep live' })
vim.keymap.set('n', '<Leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = 'Grep current word' })
vim.keymap.set('n', '<Leader>fh', '<Cmd>Pick help<CR>', { desc = 'Help tags' })
vim.keymap.set('n', '<Leader>fH', '<Cmd>Pick hl_groups<CR>', { desc = 'Highlight groups' })
vim.keymap.set('n', '<Leader>fl', '<Cmd>Pick buf_lines scope="all"<CR>', { desc = 'Lines (all)' })
vim.keymap.set('n', '<Leader>fL', '<Cmd>Pick buf_lines scope="current"<CR>', { desc = 'Lines (buf)' })
vim.keymap.set('n', '<Leader>fm', '<Cmd>Pick git_hunks<CR>', { desc = 'Modified hunks (all)' })
vim.keymap.set('n', '<Leader>fM', '<Cmd>Pick git_hunks path="%"<CR>', { desc = 'Modified hunks (buf)' })
vim.keymap.set('n', '<Leader>fr', '<Cmd>Pick resume<CR>', { desc = 'Resume' })
vim.keymap.set('n', '<Leader>fp', '<Cmd>Pick projects<CR>', { desc = 'Projects' })
vim.keymap.set('n', '<Leader>fR', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References (LSP)' })
vim.keymap.set('n', '<Leader>fs', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = 'Symbols workspace' })
vim.keymap.set('n', '<Leader>fS', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = 'Symbols document' })
vim.keymap.set('n', '<Leader>fv', '<Cmd>Pick visit_paths cwd=""<CR>', { desc = 'Visit paths (all)' })
vim.keymap.set('n', '<Leader>fV', '<Cmd>Pick visit_paths<CR>', { desc = 'Visit paths (cwd)' })

-- require('mini.sessions').setup()

-- -- luacheck: globals MiniSnippets
-- require('mini.snippets').setup({
--     -- snippets = {
--     --     -- Always load 'snippets/global.json' from config directory
--     --     require('mini.snippets').gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
--     --     -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
--     --     require('mini.snippets').gen_loader.from_lang({
--     --         lang_patterns = {
--     --             tex = { 'latex/**/*.json', '**/latex.json' },
--     --             plaintex = { 'latex/**/*.json', '**/latex.json' },
--     --             -- Recognize special injected language of markdown tree-sitter parser
--     --             markdown_inline = { 'markdown.json' },
--     --         },
--     --     }),
--     -- },
-- })
-- MiniSnippets.start_lsp_server()

require('mini.splitjoin').setup()
-- require('mini.starter').setup()

-- -- luacheck: globals MiniStatusline
-- require('mini.statusline').setup({
--     content = {
--         active = function()
--             local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
--             local git = MiniStatusline.section_git({ trunc_width = 40 })
--             local diff = MiniStatusline.section_diff({ trunc_width = 75 })
--             local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
--             local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
--             local filename = MiniStatusline.section_filename({ trunc_width = 140 })
--             local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
--             local location = MiniStatusline.section_location({ trunc_width = 75 })
--             local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
--
--             return MiniStatusline.combine_groups({
--                 { hl = mode_hl, strings = { mode } },
--                 { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
--                 '%<', -- Mark general truncate point
--                 { hl = 'MiniStatuslineFilename', strings = { filename } },
--                 '%=', -- End left alignment
--                 { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
--                 { hl = mode_hl, strings = { search, location } },
--             })
--         end,
--     },
-- })

require('mini.tabline').setup()
require('mini.visits').setup()
