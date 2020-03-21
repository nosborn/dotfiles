augroup lightline#ale
  autocmd!
  autocmd User ALEFixPost call lightline#update()
  autocmd User ALELintPost call lightline#update()
augroup END
