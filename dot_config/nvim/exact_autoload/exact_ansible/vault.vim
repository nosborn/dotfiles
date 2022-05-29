function ansible#vault#decrypt()
  let s:header = split(getline(1), ';')
  let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
  silent %!ansible-vault decrypt
endfunction

function ansible#vault#encrypt()
  execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
endfunction
