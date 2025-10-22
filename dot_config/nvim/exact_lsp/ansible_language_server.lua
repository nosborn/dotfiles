---@type vim.lsp.Config
return {
    cmd = {
        'ansible-language-server',
        '--stdio',
    },
    filetypes = {
        'yaml.ansible',
    },
    root_markers = {
        'ansible.cfg',
        '.ansible-lint',
    },
    settings = {
        ansible = {
            ansible = {
                path = 'ansible',
            },
            executionEnvironment = {
                enabled = false,
            },
            python = {
                interpreterPath = 'python3.13',
            },
            validation = {
                enabled = true,
                lint = {
                    enabled = true,
                    path = 'ansible-lint',
                },
            },
        },
    },
}
