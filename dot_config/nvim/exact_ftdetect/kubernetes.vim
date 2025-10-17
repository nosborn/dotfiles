augroup ftdetect_kubernetes
  autocmd!
  autocmd BufRead *.yaml,*.yml if search('apiVersion: ', 'nw') | setfiletype yaml.kubernetes | endif
augroup END
