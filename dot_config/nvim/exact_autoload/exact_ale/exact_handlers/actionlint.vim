function! ale#handlers#actionlint#GetCommand(buffer) abort
  return '%e' . ale#Pad(ale#Var(a:buffer, 'yaml_actionlint_options'))
        \ . ' -no-color -oneline %t'
endfunction

function! ale#handlers#actionlint#Handle(buffer, lines) abort
  let l:pyflakes_pattern = '\v^.*:(\d+):(\d+): (pyflakes reported issue in this script: (\d+):(\d+) (.+)) \[(pyflakes)\]$'
  let l:shellcheck_pattern = '\v^.*:(\d+):(\d+): (shellcheck reported issue in this script: (SC\d+):(\w+):(\d+):(\d+): (.+)) \[(shellcheck)\]$'
  let l:pattern = '\v^.*:(\d+):(\d+): (.+) \[.+\]$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, [l:pyflakes_pattern, l:shellcheck_pattern, l:pattern])
    let l:item = {
          \   'lnum': str2nr(l:match[1]),
          \   'col': str2nr(l:match[2]),
          \   'text': l:match[3],
          \   'type': 'E',
          \ }

    if l:match[9] is# 'shellcheck'
      if l:match[5] is# 'note'
        let l:item.type = 'I'
      elseif l:match[5] isnot# 'error'
        let l:item.type = 'W'
      endif

      if trim(getline(l:item.lnum)) =~# '\v^run:\s+\|'
        let l:item.lnum += str2nr(l:match[6])
        let l:item.col += (str2nr(l:match[7]) + 2) " FIXME
        let l:item.text = l:match[8]
        let l:item.code = l:match[4]
      endif
    elseif l:match[7] is# 'pyflakes'
      if trim(getline(l:item.lnum)) =~# '\v^run:\s+\|'
        let l:item.lnum += str2nr(l:match[4])
        let l:item.col += (str2nr(l:match[5]) + 2) " FIXME
        let l:item.text = l:match[6]
      endif
    endif

    call add(l:output, l:item)
  endfor

  return l:output
endfunction
