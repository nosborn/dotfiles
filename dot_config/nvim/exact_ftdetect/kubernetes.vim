" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead *.yaml,*.yml if search('apiVersion: ', 'nw') | setlocal filetype=yaml.kubernetes | endif
