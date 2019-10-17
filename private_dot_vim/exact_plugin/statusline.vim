scriptencoding utf-8

if exists('g:loaded_statusline')
  finish
endif
let g:loaded_statusline = 1

" function! ActiveStatusLine()
"   let statusline=''

"   let statusline.='%#Search#'
"   let statusline.=' %{GetMode()} '
"   let statusline.='%#diffadd#'
"   let statusline.='%{StatuslineGit()}'
"   let statusline.='%#CursorlineNr#'
"   let statusline.=' %f'                " path to file in buffer
"   let statusline.=' %m'                " modified flag

"   let statusline.='%='

"   let statusline.='%#StatuslineNC#'
"   let statusline.='▏%y'                " type of file in the buffer
"   let statusline.=' %{&fileencoding ? &fileencoding : &encoding}'
"   let statusline.='[%{&fileformat}] '
"   let statusline.='%#TermCursor#'
"   let statusline.='▏%3p%% ☰ %l:%c'
"   let statusline.='%#WarningColor#'
"   let statusline.='%{GetWarnings()}'   " ALE warnings
"   let statusline.='%#ErrorColor#'
"   let statusline.='%{GetErrors()}'     " ALE errors

"   return statusline
" endfunction

" function! InactiveStatusLine()
"   let statusline=''

"   " let statusline.='%#Whitespace#'
"   " let statusline.=' %{GetMode()} '
"   " let statusline.='\%{StatuslineGit()}'
"   let statusline.='▏%f'
"   let statusline.=' %m'

"   let statusline.='%='

"   let statusline.='▏%y'
"   let statusline.=' %{&fileencoding?&fileencoding:&encoding}'
"   let statusline.='[%{&fileformat}] '
"   let statusline.='▏%3p%% ☰ %l:%c'
"   let statusline.='%{GetWarnings()}'   " ALE warnings
"   let statusline.='%{GetErrors()}'     " ALE errors

"   return statusline
" endfunction

" set laststatus=2
" set statusline=%!ActiveStatusLine()

" augroup statusline
"   autocmd!
"   autocmd WinEnter * setlocal statusline=%!ActiveStatusLine()
"   autocmd WinLeave * setlocal statusline=%!InactiveStatusLine()
" augroup END

" highlight WarningColor guibg=#DA711A guifg=#FFFFFF ctermbg=DarkBlue ctermfg=White
" highlight ErrorColor guibg=#B63939 guifg=#FFFFFF ctermbg=Red ctermfg=White

" function! GetErrors()
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   return l:all_errors == 0 ? '' : ' E:'.l:all_errors.' '
" endfunction

" function! GetWarnings()
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_warnings = l:counts.total - (l:counts.error + l:counts.style_error)
"   return l:all_warnings == 0 ? '' : ' W:'.l:all_warnings.' '
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0 ? '▏'.l:branchname.' ' : ''
" endfunction

" function! GitBranch()
"   return exists('b:git_dir') ? FugitiveHead(7) : ''
" endfunction

" function! GetMode()
"   let mode = mode()
"   if mode ==# 'n'
"     return 'NORMAL'
"   elseif mode ==? 'v'
"     return 'VISUAL'
"   elseif mode ==? 's'
"     return 'SELECT'
"   elseif mode ==# 'i'
"     return 'INSERT'
"   elseif mode ==# 'R'
"     return 'REPLACE'
"   elseif mode ==# 'c'
"     return 'COMMAND'
"   else
"     return 'NORMAL'
"   endif
" endfunction
