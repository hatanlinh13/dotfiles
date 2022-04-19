"""""""""""""""""""""""""""""""""""""
" General vim configurations
"""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source $HOME/.vimrc


"""""""""""""""""""""""""""""""""""""
" General vim configurations
"""""""""""""""""""""""""""""""""""""

set termguicolors
" highlight groups test
" :so $VIMRUNTIME/syntax/hitest.vim
highlight VertSplit guifg=#5C6370
highlight DiffChange gui=None
highlight SpellBad gui=None
highlight PmenuThumb guifg=bg
highlight RedrawDebugClear guifg=bg
highlight RedrawDebugComposed guifg=bg
highlight RedrawDebugRecompose guifg=bg
highlight MatchParen gui=None guifg=bg guibg=fg
highlight NvimInternalError guifg=bg


"""""""""""""""""""""""""""""""""""""
" Neovim specific plugins
"""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""
" Neovim specific configurations
"""""""""""""""""""""""""""""""""""""

" tmux complete
let g:tmuxcomplete#trigger = ''

