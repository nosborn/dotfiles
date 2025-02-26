scriptencoding utf-8

function! lightline#custom#gitbranch()
  if empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf(' %s', FugitiveHead())
endfunction

function! lightline#custom#githunks()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction

function! lightline#custom#readonly()
  return &readonly && &filetype !=# 'help' ? "\uE0A2" : ''
endfunction

" function! mayonnaise#wordcount#words() abort
"   let l:words = wordcount().words
"   return printf('%dw', l:words)
" endfunction
