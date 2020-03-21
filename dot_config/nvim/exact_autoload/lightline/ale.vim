scriptencoding utf-8

function! lightline#ale#error() abort
  if !lightline#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  let l:errors = l:count.error + l:count.style_error
  return l:errors == 0 ? '' : printf('E: %d', errors)
endfunction

function! lightline#ale#info() abort
  if !lightline#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  return l:count.info == 0 ? '' : printf('I: %d', l:count.info)
endfunction

function! lightline#ale#linted() abort
  return get(g:, 'ale_enabled', 0) == 1
        \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
        \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
endfunction

function! lightline#ale#ok() abort
  if !lightline#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  return l:count.total == 0 ? '✓' : ''
endfunction

function! lightline#ale#warning() abort
  if !lightline#ale#linted()
    return ''
  endif
  let l:count = ale#statusline#Count(bufnr(''))
  let l:warnings = l:count.warning + l:count.style_warning
  return l:warnings == 0 ? '' : printf('W: %d', warnings)
endfunction
