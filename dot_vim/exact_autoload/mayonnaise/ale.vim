scriptencoding utf-8

function! mayonnaise#ale#error() abort
  if !mayonnaise#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  let l:errors = l:count.error + l:count.style_error
  return l:errors == 0 ? '' : printf('E: %d', errors)
endfunction

function! mayonnaise#ale#info() abort
  if !mayonnaise#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  return l:count.info == 0 ? '' : printf('I: %d', l:count.info)
endfunction

function! mayonnaise#ale#linted() abort
  return get(g:, 'ale_enabled', 0) == 1
        \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
        \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
endfunction

function! mayonnaise#ale#ok() abort
  if !mayonnaise#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  return l:count.total == 0 ? '✓' : ''
endfunction

function! mayonnaise#ale#warning() abort
  if !mayonnaise#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  let l:warnings = l:count.warning + l:count.style_warning
  return l:warnings == 0 ? '' : printf('W: %d', warnings)
endfunction
