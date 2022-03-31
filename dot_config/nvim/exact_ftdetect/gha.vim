autocmd BufRead,BufNewFile .github/workflows/* if &filetype ==# 'yaml' | set filetype=yaml.gha | endif
