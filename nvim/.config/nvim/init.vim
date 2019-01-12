"""""""""""""""""""""""""""""""""""""
" General vim configurations
"""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source $HOME/.vimrc


"""""""""""""""""""""""""""""""""""""
" Neovim specific plugins
"""""""""""""""""""""""""""""""""""""

Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'


"""""""""""""""""""""""""""""""""""""
" Neovim specific configurations
"""""""""""""""""""""""""""""""""""""

" deoplete
let g:deoplete#enable_at_startup = 1
" enable deoplete after = sign
set isfname-==
