---@type vim.lsp.Config
return {
    cmd = {
        'yaml-language-server',
        '--stdio',
    },
    filetypes = {
        'yaml',
        'yaml.docker-compose',
        'yaml.gitlab',
        'yaml.helm-values',
    },
    -- on_init = function(client)
    --     client.server_capabilities.documentFormattingProvider = true
    -- end,
    root_markers = {
        '.git',
    },
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
        yaml = {
            -- format = {
            --     enable = true,
            -- },
        },
    },
}
