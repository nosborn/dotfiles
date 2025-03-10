scriptencoding utf-8

let s:bg = '#222436'
let s:bg_highlight = '#2f334d'
let s:bg_statusline = '#1e2030'
let s:black = '#1b1d2b'
let s:blue = '#82aaff'
let s:dark3 = '#545c7e'
let s:error = '#c53b53'
let s:fg = '#c8d3f5'
let s:fg_gutter = '#3b4261'
let s:green = '#c3e88d'
let s:magenta = '#c099ff'
let s:red = '#ff757f'
let s:warning = '#ffc777'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [[s:black, s:blue], [s:blue, s:fg_gutter]]
let s:p.normal.middle = [[s:fg, s:bg_statusline]]
let s:p.normal.right = [[s:black, s:blue], [s:blue, s:fg_gutter]]
let s:p.normal.error = [[s:black, s:error]]
let s:p.normal.warning = [[s:black, s:warning]]
let s:p.inactive.left = [[s:blue, s:bg_statusline], [s:dark3, s:bg]]
let s:p.inactive.middle = [[s:fg_gutter, s:bg_statusline]]
let s:p.inactive.right = [[s:fg_gutter, s:bg_statusline], [s:dark3, s:bg]]
let s:p.insert.left = [[s:black, s:green], [s:blue, s:bg]]
let s:p.replace.left = [[s:black, s:red], [s:blue, s:bg]]
let s:p.visual.left = [[s:black, s:magenta], [s:blue, s:bg]]
let s:p.tabline.left = [[s:dark3, s:bg_highlight], [s:dark3, s:bg]]
let s:p.tabline.middle = [[s:fg_gutter, s:bg_statusline]]
let s:p.tabline.right = [[s:fg_gutter, s:bg_statusline], [s:dark3, s:bg]]
let s:p.tabline.tabsel = [[s:blue, s:fg_gutter], [s:dark3, s:bg]]

let g:lightline#colorscheme#tokyonight_night#palette = lightline#colorscheme#fill(s:p)
