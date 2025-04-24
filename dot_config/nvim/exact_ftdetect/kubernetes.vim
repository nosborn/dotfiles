autocmd BufRead *.{yaml,yml}
      \ if search('apiVersion: ', 'nw') |
      \   setlocal ft=yaml.kubernetes |
      \ endif
