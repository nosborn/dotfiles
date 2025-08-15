return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.sum' },
    settings = {
        gopls = {
            -- Build
            -- Formatting
            gofumpt = true,
            -- UI
            --codelenses = {
            --    generate = true,
            --    test = true,
            --    tidy = true,
            --},
            -- Completion
            -- Diagnostic
            --analyses = {
            --    --ST1000 = false, -- Incorrect or missing package comment
            --},
            --staticcheck = true,
            -- Documentation
            -- Inlayhint
            hints = {
                constantValues = true,
                parameterNames = true,
            },
            -- Navigation
        },
    },
}
