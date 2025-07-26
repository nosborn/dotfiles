return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
            },
            codelenses = {
                generate = true,
                test = true,
                tidy = true,
            },
            gofumpt = true,
            hints = {
                constantValues = true,
                parameterNames = true,
            },
            staticcheck = true,
        },
    },
}
