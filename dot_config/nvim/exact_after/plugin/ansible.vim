let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = {
  \   '*.conf.j2':      'conf',
  \   '*.ini.j2':       'dosini',
  \   '*.json.j2':      'json',
  \   '*.php.j2':       'php',
  \   '*.sh.j2':        'sh',
  \   '*.yaml.j2':      'yaml',
  \   '*.yml.j2':       'yaml',
  \   'Dockerfile.j2':  'dockerfile',
  \   'my.cnf.j2':      'dosini',
  \   'named.conf.j2':  'named',
  \   'nginx.conf.j2':  'nginx',
  \   'smb.conf.j2':    'dosini',
  \   'sshd_config.j2': 'sshdconfig',
  \ }
let g:ansible_unindent_after_newline = 1

function AnsibleVaultDecrypt()
  let s:header = split(getline(1), ';')
  let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
  silent %!ansible-vault decrypt
endfunction

function AnsibleVaultEncrypt()
  execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
endfunction

augroup ansible-vault
  autocmd!
  autocmd BufReadPre,FileReadPre */ansible/**/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPre,FileReadPre */vars/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
  autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml call AnsibleVaultDecrypt()
  autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml call AnsibleVaultDecrypt()
  autocmd BufReadPost,FileReadPost */vars/vault.yml call AnsibleVaultDecrypt()
  autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePre,FileWritePre */vars/vault.yml call AnsibleVaultEncrypt()
  autocmd BufWritePost,FileWritePost */ansible/**/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
  autocmd BufWritePost,FileWritePost */vars/vault.yml silent undo
augroup END
