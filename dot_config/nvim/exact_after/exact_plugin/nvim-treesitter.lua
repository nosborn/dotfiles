require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'git_config',
        'gotmpl',
        'html',
        'ini',
        'javascript',
        'json',
        -- 'latex',
        'lua',
        'markdown',
        'markdown_inline',
        -- 'norg',
        'python',
        'regex',
        'ruby',
        -- 'scss',
        -- 'svelte',
        'terraform',
        'toml',
        -- 'tsx',
        -- 'typst',
        -- 'vue',
        'yaml',
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
