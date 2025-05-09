--- @type vim.lsp.Config
return {
    cmd = {
        'lua-language-server',
    },
    filetypes = {
        'lua',
    },
    root_markers = {
        '.git',
        '.luacheckrc',
        '.luarc.json',
        '.luarc.jsonc',
        '.stylua.toml',
        'selene.toml',
        'selene.yml',
        'stylua.toml',
    },
    settings = {
        Lua = {
            diagnostics = {
                disable = {
                    'missing-fields',
                },
                globals = {
                    'vim',
                },
                neededFileStatus = {
                    ['codestyle-check'] = 'Any',
                },
            },
            format = {
                defaultConfig = {
                    indent_size = 4,
                    indent_style = 'space',
                },
                enable = false, -- TODO: true
            },
            runtime = {
                path = {
                    '?.lua',
                    '?/init.lua',
                },
                pathStrict = true,
                version = 'LuaJIT',
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}

-- vim.lsp.config.lua_ls = {
--     -- on_attach = function(client, buf_id)
--     --     -- Reduce unnecessarily long list of completion triggers for better
--     --     -- 'mini.completion' experience
--     --     client.server_capabilities.completionProvider.triggerCharacters = { '.', ':', '#', '(' }
--     --
--     --     -- Override global "Go to source" mapping with dedicated buffer-local
--     --     local opts = { buffer = buf_id, desc = 'Lua source definition' }
--     --     vim.keymap.set('n', '<Leader>ls', Config.luals_unique_definition, opts)
--     -- end,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 neededFileStatus = {
--                     ['codestyle-check'] = 'Any'
--                 },
--                 workspaceDelay = -1, -- Don't analyze whole workspace, as it consumes too much CPU and RAM
--             },
--             format = {
--                 defaultConfig = {
--                     indent_size = 4,
--                     indent_style = 'space',
--                 },
--                 enable = true,
--             },
--             runtime = {
--                 path = vim.split(package.path, ';'),
--                 version = 'LuaJIT',
--             },
--             telemetry = {
--                 enable = false,
--             },
--             workspace = {
--                 ignoreSubmodules = true,
--                 library = {
--                     vim.env.VIMRUNTIME,
--                 },
--             },
--         },
--     },
-- }
