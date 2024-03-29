setlocal expandtab
setlocal linebreak
setlocal shiftwidth=2
setlocal tabstop=2
setlocal wrap

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal expandtab< filetype< linebreak< shiftwidth< tabstop< wrap<'
else
  let b:undo_ftplugin = 'setlocal expandtab< filetype< linebreak< shiftwidth< tabstop< wrap<'
endif

" Stolen from https://github.com/plasticboy/vim-markdown
function! s:TableFormat()
  let l:pos = getpos('.')
  normal! {
  " Search instead of `normal! j` because of the table at beginning of file
  " edge case.
  call search('|')
  normal! j
  " Remove everything that is not a pipe, colon or hyphen next to a colon
  " otherwise well formatted tables would grow because of addition of 2 spaces
  " on the separator line by Tabularize /|.
  let l:flags = (&gdefault ? '' : 'g')
  execute 's/\(:\@<!-:\@!\|[^|:-]\)//e' . l:flags
  execute 's/--/-/e' . l:flags
  Tabularize /|
  " Move colons for alignment to left or right side of the cell.
  execute 's/:\( \+\)|/\1:|/e' . l:flags
  execute 's/|\( \+\):/|:\1/e' . l:flags
  execute 's/ /-/' . l:flags
  execute 's/|-/| /' . l:flags
  execute 's/-|/ |/' . l:flags
  call setpos('.', l:pos)
endfunction

command! -buffer TableFormat call s:TableFormat()
