" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead,BufNewFile */.github/workflows/*.y{a,}ml setlocal filetype=yaml.ghaction
autocmd BufRead,BufNewFile action.y{a,}ml setlocal filetype=yaml.ghaction
