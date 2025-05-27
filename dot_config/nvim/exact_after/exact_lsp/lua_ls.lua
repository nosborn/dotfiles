return {
    settings = {
        Lua = {
            codeLens = {
                enable = true,
            },
            completion = {
                callSnippet = 'Replace',
            },
            -- diagnostics = {
            --     globals = {
            --         'MiniIcons',
            --         'vim',
            --     },
            -- },
            doc = {
                privateName = {
                    '^_',
                },
            },
            hint = {
                arrayIndex = 'Disable',
                enable = true,
                paramName = 'Disable',
                paramType = true,
                semicolon = 'Disable',
                setType = false,
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
}
