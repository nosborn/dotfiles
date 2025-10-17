function! s:Matches(pattern, text)
  return match(a:text, a:pattern) != -1
endfunction

function! s:IsAnsible()
  let l:filepath = expand('%:p')
  let l:filename = expand('%:t')

  if s:Matches('\v/(tasks|roles|handlers)/.*\.ya?ml$', l:filepath) | return 1 | endif

  if s:Matches('\v/(group|host)_vars/', l:filepath) | return 1 | endif

  let l:filename_regex = get(g:, 'ansible_ftdetect_filename_regex', '\v(playbook|site|main|local|requirements)\.ya?ml$')

  if s:Matches(l:filename_regex, l:filename) | return 1 | endif

  let l:first_line = getline(1)
  if s:Matches('^#!.*/bin/env\s\+ansible-playbook\>', l:first_line) | return 1 | endif
  if s:Matches('^#!.*/bin/ansible-playbook\>', l:first_line) | return 1 | endif

  return 0
endfunction

function! s:SetupTemplate()
  let l:syntaxes = get(g:, 'ansible_template_syntaxes', {})
  if type(l:syntaxes) == v:t_dict
    let l:filepath = expand('%:p')
    for [l:pattern, l:filetype] in items(l:syntaxes)
      if s:Matches('\v/' . l:pattern, l:filepath)
        let &filetype = l:filetype . '.jinja2'
        return
      endif
    endfor
  endif

  setfiletype jinja2
endfunction

augroup ansible_vim_ftyaml_ansible
  autocmd!
  autocmd BufNewFile,BufRead * if s:IsAnsible() | setfiletype yaml.ansible | endif
augroup END

augroup ansible_vim_ftjinja2
  autocmd!
  autocmd BufNewFile,BufRead *.j2 call s:SetupTemplate()
augroup END

augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype ansible_hosts
augroup END
