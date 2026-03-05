---@type vim.lsp.Config
return {
    on_attach = function(client, _)
        client.server_capabilities.completionProvider.triggerCharacters = { '.', ':', '#', '(' }
    end,
    settings = {
        Lua = {
            runtime = {
                path = vim.split(package.path, ';'),
                version = 'LuaJIT',
            },
            workspace = {
                ignoreSubmodules = true,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}
