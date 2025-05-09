--- @type vim.lsp.Config
return {
    cmd = {
        'pyright-langserver',
        '--stdio',
    },
    filetypes = {
        'python',
    },
    root_markers = {
        '.git',
        'Pipfile',
        'pyproject.toml',
        'pyrightconfig.json',
        'requirements.txt',
        'setup.cfg',
        'setup.py',
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
            },
        },
    },
}
