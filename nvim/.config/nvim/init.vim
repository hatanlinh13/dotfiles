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

Plugin 'Shougo/deoplete.nvim'
"Plugin 'Shougo/neosnippet.vim'
"Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/deoplete-clangx'
"Plugin 'Shougo/neoinclude.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'deoplete-plugins/deoplete-jedi'


"""""""""""""""""""""""""""""""""""""
" Neovim specific configurations
"""""""""""""""""""""""""""""""""""""

" deoplete
let g:deoplete#enable_at_startup = 1
" enable deoplete after = sign
set isfname-==
" use tabs
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" auto close review
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tmux complete
let g:tmuxcomplete#trigger = ''

" clangx
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
