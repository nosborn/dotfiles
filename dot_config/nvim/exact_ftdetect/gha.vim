augroup ftdetect_github_actions
  autocmd!
  autocmd BufNewFile,BufRead .github/workflows/* if &filetype ==# 'yaml' | set filetype=yaml.gha | endif
augroup END
