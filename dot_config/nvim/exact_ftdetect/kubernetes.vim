" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead *.yaml,*.yml if search('apiVersion: ', 'nw') | setfiletype yaml.kubernetes | endif
