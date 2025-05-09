function! s:isAnsible()
  let filepath = expand('%:p')
  let filename = expand('%:t')
  if filepath =~ '\v/(tasks|roles|handlers)/.*\.ya?ml$' | return 1 | en
  if filepath =~ '\v/(group|host)_vars/' | return 1 | en
  let s:ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
  if exists('g:ansible_ftdetect_filename_regex')
    let s:ftdetect_filename_regex = g:ansible_ftdetect_filename_regex
  endif

  if filename =~ s:ftdetect_filename_regex | return 1 | en

  let shebang = getline(1)
  if shebang =~# '^#!.*/bin/env\s\+ansible-playbook\>' | return 1 | en
  if shebang =~# '^#!.*/bin/ansible-playbook\>' | return 1 | en

  return 0
endfunction

function! s:setupTemplate()
  if exists('g:ansible_template_syntaxes')
    let filepath = expand('%:p')
    for syntax_name in items(g:ansible_template_syntaxes)
      let s:syntax_string = '\v/'.syntax_name[0]
      if filepath =~ s:syntax_string
        execute 'set ft='.syntax_name[1].'.jinja2'
        return
      endif
    endfor
  endif
  set filetype=jinja2
endfunction

augroup ansible_vim_ftyaml_ansible
  autocmd!
  autocmd BufNewFile,BufRead * if s:isAnsible() | set filetype=yaml.ansible | en
augroup END
augroup ansible_vim_ftjinja2
  autocmd!
  autocmd BufNewFile,BufRead *.j2 call s:setupTemplate()
augroup END
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts set filetype=ansible_hosts
augroup END
