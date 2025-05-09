local h = require('null-ls.helpers')
local methods = require('null-ls.methods')
local u = require('null-ls.utils')

local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

return h.make_builtin({
    name = 'alloy_fmt',
    meta = {
        url = 'https://grafana.com/docs/alloy/latest/reference/cli/fmt/',
        deacription = 'The alloy-fmt command formats a given Alloy configuration file.',
    },
    method = DIAGNOSTICS_ON_SAVE,
    filetypes = { 'river' },
    generator_opts = {
        command = 'alloy',
        args = {
            'fmt',
            '--test',
            '-',
        },
        format = 'line',
        check_exit_code = function(code, _stderr)
            return code <= 1
        end,
        on_output = h.diagnostics.from_pattern([[:(%d+):(%d+): (.*)]], { 'row', 'col', 'message' }, {
            severities = {
                error = h.diagnostics.severities['error'],
                warning = h.diagnostics.severities['warning'],
            },
        }),
    },
    factory = h.generator_factory,
})
