if executable('sops') == 1
  function! SopsDecrypt()
    silent %!sops decrypt --filename-override=%
  endfunction

  function! SopsEncrypt()
    silent %!sops encrypt --filename-override=%
  endfunction

  augroup SopsPlugin
    autocmd!
    autocmd BufReadPre,FileReadPre */resouces/secret.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPost,FileReadPost */resources/secret.yaml call SopsDecrypt()
    autocmd BufWritePre,FileWritePre */resources/secret.yaml call SopsEncrypt()
    autocmd BufWritePost,FileWritePost */resources/secret.yaml silent undo
  augroup END
end
