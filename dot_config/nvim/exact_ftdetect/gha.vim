augroup ftdetect_github_actions
  autocmd!
  autocmd BufRead,BufNewFile .github/workflows/* if &filetype ==# 'yaml' | set filetype=yaml.gha | endif
augroup END
