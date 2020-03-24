" =============================================================================
" Filename: plugin/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2020/03/16 19:08:41.
" =============================================================================

if exists('g:loaded_mayonnaise') || v:version < 700
  finish
endif
let g:loaded_mayonnaise = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

augroup mayonnaise
  autocmd!
  autocmd WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost * call mayonnaise#update()
  if !has('patch-8.1.1715')
    autocmd FileType qf call mayonnaise#update()
  endif
  autocmd SessionLoadPost * call mayonnaise#highlight()
  autocmd ColorScheme * if !has('vim_starting') || expand('<amatch>') !=# 'macvim'
        \ | call mayonnaise#update() | call mayonnaise#highlight() | endif
augroup END

" This quickfix option was introduced at Vim 85850f3a5ef9, which is the commit
" just before 8.1.1715. Before this patch, autocmd FileType is required to
" overwrite the statusline of the quickfix and location windows.
let g:qf_disable_statusline = 1

let &cpoptions = s:save_cpo
unlet s:save_cpo
