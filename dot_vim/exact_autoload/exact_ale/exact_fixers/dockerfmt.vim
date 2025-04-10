call ale#Set('dockerfile_dockerfmt_executable', 'dockerfmt')

function! ale#fixers#dockerfmt#GetExecutable(buffer) abort
  return ale#Var(a:buffer, 'dockerfile_dockerfmt_executable')
endfunction

function! ale#fixers#dockerfmt#Fix(buffer) abort
  let l:executable = ale#fixers#dockerfmt#GetExecutable(a:buffer)

  return {
    \   'command': ale#Escape(l:executable)
    \     . ' --newline'
    \ }
endfunction
