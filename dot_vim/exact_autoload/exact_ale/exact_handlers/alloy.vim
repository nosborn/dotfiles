function! ale#handlers#alloy#GetCommand(buffer) abort
  return '%e' . ' fmt -test %t'
endfunction

function! ale#handlers#alloy#Handle(buffer, lines) abort
  let l:pattern = '\v^.*:(\d*):(\d*): (.*)$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, [l:pattern])
    let l:item = {
          \   'lnum': str2nr(l:match[1]) + 0,
          \   'col': str2nr(l:match[2]) + 0,
          \   'text': l:match[3],
          \   'type': 'E',
          \ }

    call add(l:output, l:item)
  endfor

  return l:output
endfunction
