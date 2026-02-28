" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead *.yaml,*.yml if search('^apiVersion: ', 'nw') && search('^kind: ', 'nw') | setlocal filetype=yaml.kubernetes | endif
