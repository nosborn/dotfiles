call ale#Set('river_alloy_executable', 'alloy')

function! ale#fixers#alloy#GetExecutable(buffer) abort
  return ale#Var(a:buffer, 'river_alloy_executable')
endfunction

function! ale#fixers#alloy#Fix(buffer) abort
  let l:executable = ale#fixers#alloy#GetExecutable(a:buffer)

  return {
    \   'command': ale#Escape(l:executable)
    \     . ' fmt'
    \ }
endfunction
