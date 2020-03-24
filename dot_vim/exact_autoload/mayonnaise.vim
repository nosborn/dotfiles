" =============================================================================
" Filename: autoload/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2020/03/16 19:10:15.
" =============================================================================

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:_ = 1 " 1: uninitialized, 2: disabled

function! mayonnaise#update() abort
  if &buftype ==# 'popup' | return | endif
  if s:_
    if s:_ == 2 | return | endif
    call mayonnaise#init()
    call mayonnaise#colorscheme()
  endif
  if !s:mayonnaise.enable.statusline
    return
  endif
  let w = winnr()
  let s = winnr('$') == 1 && w > 0 ? [mayonnaise#statusline(0)] : [mayonnaise#statusline(0), mayonnaise#statusline(1)]
  for n in range(1, winnr('$'))
    call setwinvar(n, '&statusline', s[n!=w])
  endfor
endfunction

function! mayonnaise#update_disable() abort
  if !s:mayonnaise.enable.statusline
    return
  endif
  call setwinvar(0, '&statusline', '')
endfunction

function! mayonnaise#enable() abort
  let s:_ = 1
  call mayonnaise#update()
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
  augroup mayonnaise-disable
    autocmd!
  augroup END
  augroup! mayonnaise-disable
endfunction

function! mayonnaise#disable() abort
  let [&statusline, &tabline] = [get(s:, '_statusline', ''), get(s:, '_tabline', '')]
  for t in range(1, tabpagenr('$'))
    for n in range(1, tabpagewinnr(t, '$'))
      call settabwinvar(t, n, '&statusline', '')
    endfor
  endfor
  augroup mayonnaise
    autocmd!
  augroup END
  augroup! mayonnaise
  augroup mayonnaise-disable
    autocmd!
    autocmd WinEnter * call mayonnaise#update_disable()
  augroup END
  let s:_ = 2
endfunction

function! mayonnaise#toggle() abort
  if exists('#mayonnaise')
    call mayonnaise#disable()
  else
    call mayonnaise#enable()
  endif
endfunction

let s:_mayonnaise = {
      \   'active': {
      \     'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
      \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
      \   },
      \   'inactive': {
      \     'left': [['filename']],
      \     'right': [['lineinfo'], ['percent']]
      \   },
      \   'tabline': {
      \     'left': [['tabs']],
      \     'right': [['close']]
      \   },
      \   'tab': {
      \     'active': ['tabnum', 'filename', 'modified'],
      \     'inactive': ['tabnum', 'filename', 'modified']
      \   },
      \   'component': {
      \     'mode': '%{mayonnaise#mode()}',
      \     'absolutepath': '%F', 'relativepath': '%f', 'filename': '%t', 'modified': '%M', 'bufnum': '%n',
      \     'paste': '%{&paste?"PASTE":""}', 'readonly': '%R', 'charvalue': '%b', 'charvaluehex': '%B',
      \     'spell': '%{&spell?&spelllang:""}', 'fileencoding': '%{&fenc!=#""?&fenc:&enc}', 'fileformat': '%{&ff}',
      \     'filetype': '%{&ft!=#""?&ft:"no ft"}', 'percent': '%3p%%', 'percentwin': '%P',
      \     'lineinfo': '%3l:%-2v', 'line': '%l', 'column': '%c', 'close': '%999X X ', 'winnr': '%{winnr()}'
      \   },
      \   'component_visible_condition': {
      \     'modified': '&modified||!&modifiable', 'readonly': '&readonly', 'paste': '&paste', 'spell': '&spell'
      \   },
      \   'component_function': {},
      \   'component_function_visible_condition': {},
      \   'component_expand': {
      \     'tabs': 'mayonnaise#tabs'
      \   },
      \   'component_type': {
      \     'tabs': 'tabsel', 'close': 'raw'
      \   },
      \   'component_raw': {},
      \   'tab_component': {},
      \   'tab_component_function': {
      \     'filename': 'mayonnaise#tab#filename', 'modified': 'mayonnaise#tab#modified',
      \     'readonly': 'mayonnaise#tab#readonly', 'tabnum': 'mayonnaise#tab#tabnum'
      \   },
      \   'colorscheme': 'default',
      \   'mode_map': {
      \     'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
      \     'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '|', 'right': '|' },
      \   'tabline_separator': {},
      \   'tabline_subseparator': {},
      \   'enable': { 'statusline': 1, 'tabline': 1 },
      \   '_mode_': {
      \     'n': 'normal', 'i': 'insert', 'R': 'replace', 'v': 'visual', 'V': 'visual', "\<C-v>": 'visual',
      \     'c': 'command', 's': 'select', 'S': 'select', "\<C-s>": 'select', 't': 'terminal'
      \   },
      \   'mode_fallback': { 'replace': 'insert', 'terminal': 'insert', 'select': 'visual' },
      \   'palette': {},
      \   'winwidth': winwidth(0),
      \ }
function! mayonnaise#init() abort
  let s:mayonnaise = deepcopy(get(g:, 'mayonnaise', {}))
  for [key, value] in items(s:_mayonnaise)
    if type(value) == 4
      if !has_key(s:mayonnaise, key)
        let s:mayonnaise[key] = {}
      endif
      call extend(s:mayonnaise[key], value, 'keep')
    elseif !has_key(s:mayonnaise, key)
      let s:mayonnaise[key] = value
    endif
    unlet value
  endfor
  call extend(s:mayonnaise.tabline_separator, s:mayonnaise.separator, 'keep')
  call extend(s:mayonnaise.tabline_subseparator, s:mayonnaise.subseparator, 'keep')
  let s:mayonnaise.tabline_configured = has_key(get(get(g:, 'mayonnaise', {}), 'component_expand', {}), 'tabs')
  for components in deepcopy(s:mayonnaise.tabline.left + s:mayonnaise.tabline.right)
    if len(filter(components, 'v:val !=# "tabs" && v:val !=# "close"')) > 0
      let s:mayonnaise.tabline_configured = 1
      break
    endif
  endfor
  if !exists('s:_statusline')
    let s:_statusline = &statusline
  endif
  if !exists('s:_tabline')
    let s:_tabline = &tabline
  endif
  if s:mayonnaise.enable.tabline
    set tabline=%!mayonnaise#tabline()
  else
    let &tabline = get(s:, '_tabline', '')
  endif
  for f in values(s:mayonnaise.component_function)
    silent! call call(f, [])
  endfor
  for f in values(s:mayonnaise.tab_component_function)
    silent! call call(f, [1])
  endfor
  let s:mode = ''
endfunction

function! mayonnaise#colorscheme() abort
  try
    let s:mayonnaise.palette = g:mayonnaise#colorscheme#{s:mayonnaise.colorscheme}#palette
  catch
    call mayonnaise#error('Could not load colorscheme ' . s:mayonnaise.colorscheme . '.')
    let s:mayonnaise.colorscheme = 'default'
    let s:mayonnaise.palette = g:mayonnaise#colorscheme#{s:mayonnaise.colorscheme}#palette
  finally
    if has('win32') && !has('gui_running') && &t_Co < 256
      for u in values(s:mayonnaise.palette)
        for v in values(u)
          for _  in v
            let [_[2], _[3]] = [mayonnaise#colortable#gui2cui(_[0], _[2]), mayonnaise#colortable#gui2cui(_[1], _[3])]
          endfor
        endfor
      endfor
    endif
    let s:highlight = {}
    call mayonnaise#highlight('normal')
    call mayonnaise#link()
    let s:_ = 0
  endtry
endfunction

function! mayonnaise#palette() abort
  return s:mayonnaise.palette
endfunction

function! mayonnaise#mode() abort
  return get(s:mayonnaise.mode_map, mode(), '')
endfunction

let s:mode = ''
function! mayonnaise#link(...) abort
  let mode = get(s:mayonnaise._mode_, a:0 ? a:1 : mode(), 'normal')
  if s:mode ==# mode
    return ''
  endif
  let s:mode = mode
  if !has_key(s:highlight, mode)
    call mayonnaise#highlight(mode)
  endif
  let types = map(s:uniq(sort(filter(values(s:mayonnaise.component_type), 'v:val !=# "raw"'))), '[v:val, 1]')
  for [p, l] in [['Left', len(s:mayonnaise.active.left)], ['Right', len(s:mayonnaise.active.right)]]
    for [i, t] in map(range(0, l), '[v:val, 0]') + types
      if i != l
        exec printf('hi link mayonnaise%s_active_%s mayonnaise%s_%s_%s', p, i, p, mode, i)
      endif
      for [j, s] in map(range(0, l), '[v:val, 0]') + types
        if i + 1 == j || t || s && i != l
          exec printf('hi link mayonnaise%s_active_%s_%s mayonnaise%s_%s_%s_%s', p, i, j, p, mode, i, j)
        endif
      endfor
    endfor
  endfor
  exec printf('hi link mayonnaiseMiddle_active mayonnaiseMiddle_%s', mode)
  return ''
endfunction

function! s:term(p) abort
  return get(a:p, 4) !=# '' ? 'term='.a:p[4].' cterm='.a:p[4].' gui='.a:p[4] : ''
endfunction

if exists('*uniq')
  let s:uniq = function('uniq')
else
  function! s:uniq(xs) abort
    let i = len(a:xs) - 1
    while i > 0
      if a:xs[i] ==# a:xs[i - 1]
        call remove(a:xs, i)
      endif
      let i -= 1
    endwhile
    return a:xs
  endfunction
endif

function! mayonnaise#highlight(...) abort
  let [c, f] = [s:mayonnaise.palette, s:mayonnaise.mode_fallback]
  let [s:mayonnaise.llen, s:mayonnaise.rlen] = [len(c.normal.left), len(c.normal.right)]
  let [s:mayonnaise.tab_llen, s:mayonnaise.tab_rlen] = [len(has_key(get(c, 'tabline', {}), 'left') ? c.tabline.left : c.normal.left), len(has_key(get(c, 'tabline', {}), 'right') ? c.tabline.right : c.normal.right)]
  let types = map(s:uniq(sort(filter(values(s:mayonnaise.component_type), 'v:val !=# "raw"'))), '[v:val, 1]')
  let modes = a:0 ? [a:1] : extend(['normal', 'insert', 'replace', 'visual', 'inactive', 'command', 'select', 'tabline'], exists(':terminal') == 2 ? ['terminal'] : [])
  for mode in modes
    let s:highlight[mode] = 1
    let d = has_key(c, mode) ? mode : has_key(f, mode) && has_key(c, f[mode]) ? f[mode] : 'normal'
    let left = d ==# 'tabline' ? s:mayonnaise.tabline.left : d ==# 'inactive' ? s:mayonnaise.inactive.left : s:mayonnaise.active.left
    let right = d ==# 'tabline' ? s:mayonnaise.tabline.right : d ==# 'inactive' ? s:mayonnaise.inactive.right : s:mayonnaise.active.right
    let ls = has_key(get(c, d, {}), 'left') ? c[d].left : has_key(f, d) && has_key(get(c, f[d], {}), 'left') ? c[f[d]].left : c.normal.left
    let ms = has_key(get(c, d, {}), 'middle') ? c[d].middle[0] : has_key(f, d) && has_key(get(c, f[d], {}), 'middle') ? c[f[d]].middle[0] : c.normal.middle[0]
    let rs = has_key(get(c, d, {}), 'right') ? c[d].right : has_key(f, d) && has_key(get(c, f[d], {}), 'right') ? c[f[d]].right : c.normal.right
    for [p, l, zs] in [['Left', len(left), ls], ['Right', len(right), rs]]
      for [i, t] in map(range(0, l), '[v:val, 0]') + types
        if i < l || i < 1
          let r = t ? (has_key(get(c, d, []), i) ? c[d][i][0] : has_key(get(c, 'tabline', {}), i) ? c.tabline[i][0] : get(c.normal, i, zs)[0]) : get(zs, i, ms)
          exec printf('hi mayonnaise%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', p, mode, i, r[0], r[1], r[2], r[3], s:term(r))
        endif
        for [j, s] in map(range(0, l), '[v:val, 0]') + types
          if i + 1 == j || t || s && i != l
            let q = s ? (has_key(get(c, d, []), j) ? c[d][j][0] : has_key(get(c, 'tabline', {}), j) ? c.tabline[j][0] : get(c.normal, j, zs)[0]) : (j != l ? get(zs, j, ms) :ms)
            exec printf('hi mayonnaise%s_%s_%s_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s', p, mode, i, j, r[1], q[1], r[3], q[3])
          endif
        endfor
      endfor
    endfor
    exec printf('hi mayonnaiseMiddle_%s guifg=%s guibg=%s ctermfg=%s ctermbg=%s %s', mode, ms[0], ms[1], ms[2], ms[3], s:term(ms))
  endfor
endfunction

function! s:subseparator(components, subseparator, expanded) abort
  let [a, c, f, v, u] = [a:components, s:mayonnaise.component, s:mayonnaise.component_function, s:mayonnaise.component_visible_condition, s:mayonnaise.component_function_visible_condition]
  let xs = map(range(len(a:components)), 'a:expanded[v:val] ? "1" :
        \ has_key(f, a[v:val]) ? (has_key(u, a[v:val]) ? "(".u[a[v:val]].")" : (exists("*".f[a[v:val]]) ? "" : "exists(\"*".f[a[v:val]]."\")&&").f[a[v:val]]."()!=#\"\"") :
        \ has_key(v, a[v:val]) ? "(".v[a[v:val]].")" : has_key(c, a[v:val]) ? "1" : "0"')
  return '%{' . (xs[0] ==# '1' || xs[0] ==# '(1)' ? '' : xs[0] . '&&(') . join(xs[1:], '||') . (xs[0] ==# '1' || xs[0] ==# '(1)' ? '' : ')') . '?"' . a:subseparator . '":""}'
endfunction

function! mayonnaise#concatenate(xs, right) abort
  let separator = a:right ? s:mayonnaise.subseparator.right : s:mayonnaise.subseparator.left
  return join(filter(copy(a:xs), 'v:val !=# ""'), ' ' . separator . ' ')
endfunction

function! mayonnaise#statusline(inactive) abort
  if a:inactive && !has_key(s:highlight, 'inactive')
    call mayonnaise#highlight('inactive')
  endif
  return s:line(0, a:inactive)
endfunction

function! s:normalize(result) abort
  if type(a:result) == 3
    return map(a:result, 'type(v:val) == 1 ? v:val : string(v:val)')
  elseif type(a:result) == 1
    return [a:result]
  else
    return [string(a:result)]
  endif
endfunction

function! s:evaluate_expand(component) abort
  try
    let result = eval(a:component . '()')
    if type(result) == 1 && result ==# ''
      return []
    endif
  catch
    return []
  endtry
  return map(type(result) == 3 ? (result + [[], [], []])[:2] : [[], [result], []], 'filter(s:normalize(v:val), "v:val !=# ''''")')
endfunction

function! s:convert(name, index) abort
  if has_key(s:mayonnaise.component_expand, a:name)
    let type = get(s:mayonnaise.component_type, a:name, a:index)
    let is_raw = get(s:mayonnaise.component_raw, a:name) || type ==# 'raw'
    return filter(s:map(s:evaluate_expand(s:mayonnaise.component_expand[a:name]),
          \ '[v:val, 1 + ' . is_raw . ', v:key == 1 && ' . (type !=# 'raw') . ' ? "' . type . '" : "' . a:index . '", "' . a:index . '"]'), 'v:val[0] != []')
  else
    return [[[a:name], 0, a:index, a:index]]
  endif
endfunction

function! s:flatten_twice(xss) abort
  let ys = []
  for xs in a:xss
    for x in xs
      let ys += x
    endfor
  endfor
  return ys
endfunction

if v:version > 702 || v:version == 702 && has('patch295')
  let s:map = function('map')
else
  function! s:map(xs, f) abort
    let ys = []
    for i in range(len(a:xs))
      call extend(ys, map(a:xs[(i):(i)], substitute(a:f, 'v:key', i, 'g')))
    endfor
    return ys
  endfunction
endif

function! s:expand(components) abort
  let components = []
  let expanded = []
  let indices = []
  let prevtype = ''
  let previndex = -1
  let xs = s:flatten_twice(s:map(deepcopy(a:components), 'map(v:val, "s:convert(v:val, ''" . v:key . "'')")'))
  for [component, expand, type, index] in xs
    if prevtype !=# type
      for i in range(previndex + 1, max([previndex, index - 1]))
        call add(indices, string(i))
        call add(components, [])
        call add(expanded, [])
      endfor
      call add(indices, type)
      call add(components, [])
      call add(expanded, [])
    endif
    call extend(components[-1], component)
    call extend(expanded[-1], repeat([expand], len(component)))
    let prevtype = type
    let previndex = index
  endfor
  for i in range(previndex + 1, max([previndex, len(a:components) - 1]))
    call add(indices, string(i))
    call add(components, [])
    call add(expanded, [])
  endfor
  call add(indices, string(len(a:components)))
  return [components, expanded, indices]
endfunction

function! s:line(tabline, inactive) abort
  let _ = a:tabline ? '' : '%{mayonnaise#link()}'
  if s:mayonnaise.palette == {}
    call mayonnaise#colorscheme()
  endif
  let [l, r] = a:tabline ? [s:mayonnaise.tab_llen, s:mayonnaise.tab_rlen] : [s:mayonnaise.llen, s:mayonnaise.rlen]
  let [p, s] = a:tabline ? [s:mayonnaise.tabline_separator, s:mayonnaise.tabline_subseparator] : [s:mayonnaise.separator, s:mayonnaise.subseparator]
  let [c, f, t, w] = [s:mayonnaise.component, s:mayonnaise.component_function, s:mayonnaise.component_type, s:mayonnaise.component_raw]
  let mode = a:tabline ? 'tabline' : a:inactive ? 'inactive' : 'active'
  let l_ = has_key(s:mayonnaise, mode) ? s:mayonnaise[mode].left : s:mayonnaise.active.left
  let [lt, lc, ll] = s:expand(copy(l_))
  let r_ = has_key(s:mayonnaise, mode) ? s:mayonnaise[mode].right : s:mayonnaise.active.right
  let [rt, rc, rl] = s:expand(copy(r_))
  for i in range(len(lt))
    let _ .= '%#mayonnaiseLeft_' . mode . '_' . ll[i] . '#'
    for j in range(len(lt[i]))
      let x = lc[i][j] ? lt[i][j] : has_key(f, lt[i][j]) ? (exists('*' . f[lt[i][j]]) ? '%{' . f[lt[i][j]] . '()}' : '%{exists("*' . f[lt[i][j]] . '")?' . f[lt[i][j]] . '():""}') : get(c, lt[i][j], '')
      let _ .= has_key(t, lt[i][j]) && t[lt[i][j]] ==# 'raw' || get(w, lt[i][j]) || lc[i][j] ==# 2 || x ==# '' ? x : '%( ' . x . ' %)'
      if j < len(lt[i]) - 1 && s.left !=# ''
        let _ .= s:subseparator(lt[i][(j):], s.left, lc[i][(j):])
      endif
    endfor
    let _ .= '%#mayonnaiseLeft_' . mode . '_' . ll[i] . '_' . ll[i + 1] . '#'
    let _ .= i < l + len(lt) - len(l_) && ll[i] < l || ll[i] != ll[i + 1] ? p.left : len(lt[i]) ? s.left : ''
  endfor
  let _ .= '%#mayonnaiseMiddle_' . mode . '#%='
  for i in range(len(rt) - 1, 0, -1)
    let _ .= '%#mayonnaiseRight_' . mode . '_' . rl[i] . '_' . rl[i + 1] . '#'
    let _ .= i < r + len(rt) - len(r_) && rl[i] < r || rl[i] != rl[i + 1] ? p.right : len(rt[i]) ? s.right : ''
    let _ .= '%#mayonnaiseRight_' . mode . '_' . rl[i] . '#'
    for j in range(len(rt[i]))
      let x = rc[i][j] ? rt[i][j] : has_key(f, rt[i][j]) ? (exists('*' . f[rt[i][j]]) ? '%{' . f[rt[i][j]] . '()}' : '%{exists("*' . f[rt[i][j]] . '")?' . f[rt[i][j]] . '():""}') : get(c, rt[i][j], '')
      let _ .= has_key(t, rt[i][j]) && t[rt[i][j]] ==# 'raw' || get(w, rt[i][j]) || rc[i][j] ==# 2 || x ==# '' ? x : '%( ' . x . ' %)'
      if j < len(rt[i]) - 1 && s.right !=# ''
        let _ .= s:subseparator(rt[i][(j):], s.right, rc[i][(j):])
      endif
    endfor
  endfor
  return _
endfunction

let s:tabnr = -1
let s:tabcnt = -1
let s:tabline = ''
function! mayonnaise#tabline() abort
  if !has_key(s:highlight, 'tabline')
    call mayonnaise#highlight('tabline')
  endif
  if s:mayonnaise.tabline_configured || s:tabnr != tabpagenr() || s:tabcnt != tabpagenr('$')
    let s:tabnr = tabpagenr()
    let s:tabcnt = tabpagenr('$')
    let s:tabline = s:line(1, 0)
  endif
  return s:tabline
endfunction

function! mayonnaise#tabs() abort
  let [x, y, z] = [[], [], []]
  let nr = tabpagenr()
  let cnt = tabpagenr('$')
  for i in range(1, cnt)
    call add(i < nr ? x : i == nr ? y : z, (i > nr + 3 ? '%<' : '') . '%'. i . 'T%{mayonnaise#onetab(' . i . ',' . (i == nr) . ')}' . (i == cnt ? '%T' : ''))
  endfor
  let abbr = '...'
  let n = min([max([s:mayonnaise.winwidth / 40, 2]), 8])
  if len(x) > n && len(z) > n
    let x = extend(add(x[:n/2-1], abbr), x[-(n+1)/2:])
    let z = extend(add(z[:(n+1)/2-1], abbr), z[-n/2:])
  elseif len(x) + len(z) > 2 * n
    if len(x) > n
      let x = extend(add(x[:(2*n-len(z))/2-1], abbr), x[-(2*n-len(z)+1)/2:])
    elseif len(z) > n
      let z = extend(add(z[:(2*n-len(x)+1)/2-1], abbr), z[-(2*n-len(x))/2:])
    endif
  endif
  return [x, y, z]
endfunction

function! mayonnaise#onetab(n, active) abort
  let _ = []
  for name in a:active ? s:mayonnaise.tab.active : s:mayonnaise.tab.inactive
    if has_key(s:mayonnaise.tab_component_function, name)
      call add(_, call(s:mayonnaise.tab_component_function[name], [a:n]))
    else
      call add(_, get(s:mayonnaise.tab_component, name, ''))
    endif
  endfor
  return join(filter(_, 'v:val !=# ""'), ' ')
endfunction

function! mayonnaise#error(msg) abort
  echohl ErrorMsg
  echomsg 'mayonnaise.vim: '.a:msg
  echohl None
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
