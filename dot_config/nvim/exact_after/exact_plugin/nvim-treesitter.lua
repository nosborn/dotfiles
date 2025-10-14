require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'awk',
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'dot',
        'editorconfig',
        -- 'embedded_template',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gotmpl',
        'gowork',
        'gpg',
        'graphql',
        'hcl',
        'helm',
        'html',
        'ini',
        'javascript',
        'jq',
        'json',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'nginx',
        'perl',
        'python',
        'regex',
        'requirements',
        'ruby',
        'ssh_config',
        'terraform',
        'toml',
        'vim',
        'xml',
        'yaml',
    },
    fold = {
        enable = true,
    },
    highlight = {
        -- additional_vim_regex_highlighting = {
        --     'ruby',
        -- },
        enable = true,
    },
    indent = {
        enable = true,
    },
})

require('nvim-treesitter.parsers').get_parser_configs().d2 = {
    filetype = 'd2',
    install_info = {
        files = {
            'src/parser.c',
            'src/scanner.cc',
        },
        revision = 'main',
        url = 'https://github.com/pleshevskiy/tree-sitter-d2', -- FIXME: archived
    },
}

require('nvim-treesitter.parsers').get_parser_configs().river = {
    install_info = {
        branch = 'main',
        files = {
            'src/parser.c',
        },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
        url = 'https://github.com/grafana/tree-sitter-river.git', -- FIXME: archived
    },
}
