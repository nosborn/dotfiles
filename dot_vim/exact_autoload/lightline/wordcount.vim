function! mayonnaise#wordcount#words() abort
  let l:words = wordcount().words
  return printf('%dw', l:words)
endfunction
