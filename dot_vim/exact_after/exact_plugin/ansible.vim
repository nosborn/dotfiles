scriptencoding UTF-8

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
