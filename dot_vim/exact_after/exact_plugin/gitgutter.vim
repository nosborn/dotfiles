scriptencoding utf-8

let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '│'
" let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_priority = 9

" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_modified_removed = 'ww'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_removed_first_line = '^^'

nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
