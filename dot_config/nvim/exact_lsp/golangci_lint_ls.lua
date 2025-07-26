return {
    cmd = { 'golangci-lint-langserver' },
    filetypes = { 'go', 'gomod' },
    init_options = {
        command = { 'golangci-lint', 'run', '--output.json.path=stdout', '--show-stats=false' },
    },
    root_markers = {
        '.git',
        '.golangci.json',
        '.golangci.toml',
        '.golangci.yaml',
        '.golangci.yml',
        'go.mod',
        'go.work',
    },
    settings = {
        diagnostics = {
            enable = true,
        },
    },
}
