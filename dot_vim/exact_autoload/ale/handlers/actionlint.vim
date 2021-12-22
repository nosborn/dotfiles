function! ale#handlers#actionlint#GetCommand(buffer) abort
  return '%e' . ale#Pad(ale#Var(a:buffer, 'yaml_actionlint_options'))
        \ . ' -no-color -oneline %t'
endfunction

function! ale#handlers#actionlint#Handle(buffer, lines) abort
  let l:pattern = '\v^.*:(\d+):(\d+): (.+)$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, l:pattern)
    let l:item = {
          \   'lnum': l:match[1] + 0,
          \   'col': l:match[2] + 0,
          \   'text': l:match[3],
          \   'type': 'E',
          \ }

    call add(l:output, l:item)
  endfor

  return l:output
endfunction
