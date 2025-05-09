--- @type vim.lsp.Config
return {
    cmd = {
        'ansible-language-server',
        '--stdio',
    },
    filetypes = {
        'yaml.ansible',
    },
    root_markers = {
        '.ansible-lint',
        'ansible.cfg',
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
                interpreterPath = 'python3',
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
    single_file_support = true,
}
