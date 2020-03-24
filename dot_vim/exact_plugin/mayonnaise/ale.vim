augroup mayonnaise#ale
  autocmd!
  autocmd User ALEFixPost call mayonnaise#update()
  " autocmd User ALEJobStarted call mayonnaise#update()
  autocmd User ALELintPost call mayonnaise#update()
augroup END
