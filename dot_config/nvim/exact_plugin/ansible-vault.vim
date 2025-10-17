if executable('ansible-vault') == 1
  function! AnsibleVaultDecrypt()
    let s:header = split(getline(1), ';')
    let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
    silent %!ansible-vault decrypt
  endfunction

  function! AnsibleVaultEncrypt()
    execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
  endfunction

  augroup ansible-vault
    autocmd!
    autocmd BufReadPre,FileReadPre */group_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPre,FileReadPre */host_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPre,FileReadPre */vars/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPost,FileReadPost */group_vars/*/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufReadPost,FileReadPost */host_vars/*/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufReadPost,FileReadPost */vars/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufWritePre,FileWritePre */group_vars/*/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePre,FileWritePre */host_vars/*/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePre,FileWritePre */vars/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePost,FileWritePost */group_vars/*/vault.yaml silent undo
    autocmd BufWritePost,FileWritePost */host_vars/*/vault.yaml silent undo
    autocmd BufWritePost,FileWritePost */vars/vault.yaml silent undo
  augroup END
end
