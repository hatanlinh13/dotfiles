" =============================================================================
" Filename: autoload/lightline/colorscheme/jellybeans.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 12:21:04.
" =============================================================================
let s:base03 = [ '#151513', 233 ]
let s:base02 = [ '#30302c ', 236 ]
let s:base01 = [ '#4e4e43', 239 ]
let s:base00 = [ '#666656', 242  ]
let s:base0 = [ '#808070', 244 ]
let s:base1 = [ '#949484', 246 ]
let s:base2 = [ '#a8a897', 248 ]
let s:base3 = [ '#e8e8d3', 253 ]
let s:yellow = [ '#ffb964', 215 ]
let s:orange = [ '#fad07a', 222 ]
let s:red = [ '#cf6a4c', 167 ]
let s:magenta = [ '#f0a0c0', 217 ]
let s:blue = [ '#8197bf', 103 ]
let s:cyan = [ '#8fbfdc', 110 ]
let s:green = [ '#99ad6a', 107 ]

let s:fg    = [ '#abb2bf', 145 ]
let s:bg    = [ '#282c34', 235 ]
let s:gray1 = [ '#5c6370', 241 ]
let s:gray2 = [ '#2c323d', 235 ]
let s:gray3 = [ '#3e4452', 240 ]

let s:red1   = [ '#e06c75', 168 ]
let s:purple = [ '#c678dd', 176 ]


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left   = [ [ s:bg, s:blue ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle = [ [ s:fg, s:gray2 ] ]
let s:p.normal.right  = [ [ s:bg, s:blue ], [ s:fg, s:gray3 ] ]

let s:p.normal.error = [ [ s:red, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]

let s:p.insert.left  = [ [ s:bg, s:green ], [ s:fg, s:gray3 ] ]
let s:p.insert.right = [ [ s:bg, s:green ], [ s:fg, s:gray3 ] ]

let s:p.replace.left  = [ [ s:bg, s:red1 ], [ s:fg, s:gray3 ] ]
let s:p.replace.right = [ [ s:bg, s:red1 ], [ s:fg, s:gray3 ] ]

let s:p.visual.left = [ [ s:bg, s:magenta ], [ s:fg, s:gray3 ] ]
let s:p.visual.right = [ [ s:bg, s:magenta ], [ s:fg, s:gray3 ] ]

let s:p.tabline.tabsel = [ [ s:bg, s:red1] ]
let s:p.tabline.left   = copy(s:p.normal.left)
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right  = copy(s:p.normal.right)

let s:p.inactive.left   = [ [ s:gray1,  s:gray2 ], [ s:gray1, s:gray2 ] ]
let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:gray1, s:gray2 ] ]


let g:lightline#colorscheme#jellybeans#palette = lightline#colorscheme#flatten(s:p)
