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
let s:transparent = [ '#000000', 'None' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:blue, s:transparent ], [ s:green, s:transparent ] ]
let s:p.insert.left = [ [ s:yellow, s:transparent ], [ s:green, s:transparent ] ]
let s:p.replace.left = [ [ s:red, s:transparent ], [ s:green, s:transparent ] ]
let s:p.visual.left = [ [ s:magenta, s:transparent ], [ s:green, s:transparent ] ]
let s:p.inactive.left =  [ [ s:green, s:transparent ], [ s:green, s:transparent ] ]

let s:p.normal.middle = [ [ s:base2, s:transparent ] ]
let s:p.inactive.middle = [ [ s:base2, s:transparent ] ]

let s:p.normal.right = [ [ s:base2, s:transparent ], [ s:base2, s:transparent ] ]
let s:p.inactive.right = [ [ s:base2, s:transparent ], [ s:base2, s:transparent ] ]

let s:p.tabline.left = [ [ s:base2, s:transparent ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:transparent ] ]
let s:p.tabline.middle = [ [ s:base01, s:transparent ] ]
let s:p.tabline.right = copy(s:p.normal.right)

let s:p.normal.error = [ [ s:red, s:transparent ] ]
let s:p.normal.warning = [ [ s:yellow, s:transparent ] ]

let g:lightline#colorscheme#jellybeans#palette = lightline#colorscheme#flatten(s:p)
